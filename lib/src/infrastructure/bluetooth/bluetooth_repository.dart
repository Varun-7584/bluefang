import 'dart:async';
import 'dart:collection';
import 'dart:developer';

import 'package:bluefang/package/observer/watchlist.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/factory/beacon_factory.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/i_beacon.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/i_vehicle_beacon.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/standard_beacon/standard_beacon.dart';
import 'package:bluefang/src/domain/bluetooth/bluetooth_result.dart';
import 'package:bluefang/src/domain/bluetooth/core/bluetooth_failure.dart';
import 'package:bluefang/src/domain/bluetooth/core/bluetooth_repository_failure.dart';
import 'package:bluefang/src/domain/bluetooth/i_bluetooth_controls.dart';
import 'package:bluefang/src/domain/bluetooth/i_bluetooth_repository.dart';
import 'package:bluefang/src/domain/sensor/i_sensor_repository.dart';
import 'package:bluefang/src/domain/sensor/sensor.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/infrastructure/core/repository/i_cache.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IBluetoothRepository)
class BluetoothRepository implements IBluetoothRepository {
  final IBluetoothControls bluetoothControls;
  final ICache localRepository;
  final ISensorRepository sensorRepository;
  final Queue<BFBluetoothScanResult> queueOfScanResult = Queue();
  final processingBeacons = <dynamic>{};
  final StreamController<IBeacon> _bluetoothBeaconsStreamController =
      StreamController<IBeacon>.broadcast();
  bool running= false;

  BluetoothRepository(
      this.bluetoothControls, this.localRepository, this.sensorRepository);

  @override
  Either<BluetoothFailure, Stream<BFBluetoothScanResult>> getScanResults() {
    return bluetoothControls.returnScanResults();
  }

  @override
  Future<Either<dynamic, Unit>> processBeacons(
      BFBluetoothScanResult bfBluetoothScanResult) async {
    try {
      final Either<dynamic, IBeacon> beaconResult =
          bluetoothControls.emitBeacons(
        scanResult: bfBluetoothScanResult,
      );
      if (beaconResult.isRight()) {
        final IBeacon beaconEntity = beaconResult.getOrElse(() {
          throw const BluetoothRepositoryFailure.errorParsingBeacons(
              "Error getting Beacon entity");
        });
        final String dtIDString = beaconEntity.dtID.getOrCrash().toString();

        if (dtIDString == WatchList().key && WatchList().startWatching) {
          _bluetoothBeaconsStreamController.add(beaconEntity);
        }

        final DtID dtID = beaconEntity.dtID;
        final value = await sensorRepository.isNewSensor(dtID: dtID);
        final Sensor sensor = value.getOrElse(() {
          throw Exception('Error executing alreadyInSensor Method');
        });
        if (kDebugMode) {
          log("Sensor value $sensor", name: "bluetooth_repository.dart");
        }
        if (sensor.dtBtRaw == Sensor.emptyDtBtRaw) {
          log("new beacon processing", name: "bluetooth_repository");
          if (beaconEntity.beaconTypes == BeaconType.standardBeacon) {
            final StandardBeacon incomingStandardBeacon =
                beaconEntity as StandardBeacon;
            // new beacon processing.
            //if (incomingStandardBeacon.mtSensor.dtLocked.getOrCrash() == 0) {
              await bluetoothControls.processNewBeacon(
                  incomingStandardBeacon: incomingStandardBeacon);
            //}
          }
        } else {
          log("existing beacon processing", name: "bluetooth_repository");
          try {
            if (beaconEntity.beaconTypes == BeaconType.standardBeacon) {
              final StandardBeacon existingStandardBeacon =
                  StandardBeacon.existingValuesFromDB(sensor);
              final StandardBeacon incomingStandardBeacon =
                  beaconEntity as StandardBeacon;

              await bluetoothControls.processStandardBeacon(
                incomingStandardBeacon: incomingStandardBeacon,
                existingStandardBeacon: existingStandardBeacon,
              );
            } else {
              log("Beacon: $beaconResult");
              await bluetoothControls.processBtBeacon3To6(beaconEntity as IVehicleBeacon);
            }
          } catch (err) {
            return left(const BluetoothRepositoryFailure.errorProcessingBeacons(
                "Error getting Beacon entity"));
          }
        }
        return right(unit);
      } else {
        log("Error parsing beacon $beaconResult",
            name: "bluetooth_repository.dart");
        return left(unit);
      }
    } catch (err) {
      return left(const BluetoothRepositoryFailure.errorParsingBeacons(
          "Error getting Beacon entity"));
    }
  }

  @override
  /// Calls the [IBluetoothControls].pause method. 
  ///
  /// Mostly a wrapper to keep all calls related to the main Bluetooth scans in one place. 
  Future<void> pause() async {
    await bluetoothControls.pauseScan();
  }

  @override 
  void resume(){
    bluetoothControls.resumeScan();
  }

  @override
  void start() {
    //Don't restart the code if it's already running
    if (running){
      return;
    }
    else {
      //Flag to determine if instance of this method is already running or not
      running = true;
      log("Starting Bluetooth scan");
      final Stream<BFBluetoothScanResult> stream = getScanResults()
          .getOrElse(() => throw Exception('Error getting scan results stream'));
      stream.listen((BFBluetoothScanResult scanResult) async {
        //log("Processing scan result", name: "bluetooth_repository.dart");
        const int stemcoBluetoothIdentifier = 1687;
        final bool isStemcoBeacon = scanResult.advertisementData.manufacturerData
            .containsKey(stemcoBluetoothIdentifier);
        if (isStemcoBeacon) {
          queueOfScanResult.addFirst(scanResult);
        }
        else {
          //log("Manufacturer data: ${scanResult.advertisementData.manufacturerData.keys}");
        }
        //This method may be called again while one or more results are still being processed; therefore, check to make sure the queue isn't empty before processing anything
        while (queueOfScanResult.isNotEmpty) {
          final beaconToProcess = queueOfScanResult.removeLast();
          // Here we are checking manufactureData of the incoming beacon because
          // Dart doesn't have object equality so even though the object might contain same data
          // It returns false, but by comparing the manufactureData which is of type Map, we can get the equality.
          // We are storing the data in a Set to make sure that a beacon isn't processed multiple times if multiple instances of this method run at the same time
          final Map<int, List<int>> manufacturerData = beaconToProcess.advertisementData.manufacturerData;
          if (processingBeacons.add(manufacturerData)) {
            await processBeacons(beaconToProcess).whenComplete(() {
              processingBeacons.remove(manufacturerData);
            });
          }
        }
      });
    }
  }

  @override
  Future<Either<BluetoothFailure, Unit>> programDataTracSvt(
      {required ProgrammedDataTrac programDataTrac,
      required Map<String, dynamic> changedValues}) {
    return Future.value(right(unit));
  }

  @override
  Stream<IBeacon> get streamOfBeacons =>
      _bluetoothBeaconsStreamController.stream;
}
