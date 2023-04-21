// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:developer';

import 'package:bluefang/package/bit_manipulation/bit_manipulation.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/factory/beacon_factory.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/i_beacon.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/i_vehicle_beacon.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/standard_beacon/standard_beacon.dart';
import 'package:bluefang/src/domain/bluetooth/bluetooth_result.dart';
import 'package:bluefang/src/domain/bluetooth/core/bluetooth_failure.dart';
import 'package:bluefang/src/domain/bluetooth/core/bluetooth_repository_failure.dart';
import 'package:bluefang/src/domain/bluetooth/i_bluetooth_controls.dart';
import 'package:bluefang/src/domain/bluetooth/i_bluetooth_service.dart';
import 'package:bluefang/src/domain/core/i_repository.dart';
import 'package:bluefang/src/domain/core/mt_changed_values.dart';
import 'package:bluefang/src/domain/distance/distance.dart';
import 'package:bluefang/src/domain/distance/i_distance_repository.dart';
import 'package:bluefang/src/domain/location/bf_location_data.dart';
import 'package:bluefang/src/domain/location/i_location_service.dart';
import 'package:bluefang/src/domain/sensor/i_sensor_repository.dart';
import 'package:bluefang/src/domain/sensor/sensor.dart';
import 'package:bluefang/src/domain/sensor/sensor_failure.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/domain/vehicle/i_vehicle_repository.dart';
import 'package:bluefang/src/domain/vehicle/vehicle.dart';
import 'package:bluefang/src/infrastructure/bluetooth/dtos/bfbluetoothscanresult_dtos.dart';
import 'package:bluefang/src/infrastructure/distance/distance_dtos.dart';
import 'package:bluefang/src/infrastructure/modelandfuel/modelandfuel_dtos.dart';
import 'package:bluefang/src/infrastructure/sensor/sensor_dtos.dart';
import 'package:bluefang/src/infrastructure/site/site_dtos.dart';
import 'package:bluefang/src/infrastructure/vehicle/vehicle_dtos.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:injectable/injectable.dart';

@prod
@LazySingleton(as: IBluetoothControls)
class BluetoothControls with BitManipulation implements IBluetoothControls {
  final IBluetoothService _bluetoothService;
  final ISensorRepository _sensorRepository;
  final IDistanceRepository _distanceRepository;
  final IVehicleRepository _vehicleRepository;
  final IRepository _iRepository;
  final ILocationService _locationService;
  final BeaconFactory _beaconFactory;
  bool paused = false;

  BluetoothControls(
      this._bluetoothService,
      this._sensorRepository,
      this._distanceRepository,
      this._iRepository,
      this._vehicleRepository,
      this._locationService,
      this._beaconFactory);
  @override
  Future<Either<SensorFailure, Sensor>> alreadyInSensor(DtID dtId) {
    return _sensorRepository.isNewSensor(dtID: dtId);
  }

  @override
  Either<dynamic, IBeacon> emitBeacons(
      {required BFBluetoothScanResult scanResult}) {
    try {
      final Either<dynamic, IBeacon> beacon =
          _beaconFactory.createBeacons(scanResult);
      return beacon;
    } catch (err) {
      return left(
          BluetoothRepositoryFailure.errorEmittingBeacons(err.toString()));
    }
  }

  @override
  Future<Either<dynamic, Unit>> processBtBeacon3To6(
      IVehicleBeacon beacon) async {
    try {
      final DtID dtId = beacon.dtID;
      final String dtIdValue = dtId.getOrCrash().toString();
      log("Incoming non-standard beacon: $beacon");
      final vehicleOption = await _vehicleRepository.find(dtID: dtId);
      final currVehicle = vehicleOption.getOrElse(() => throw Exception(
          "[Bluetooth_controls]: Error retrieving vehicle value in processBtBeacon3To6 function."));
      final BeaconType type = beacon.beaconTypes;
      if (type == BeaconType.licensePlateNumberBeacon) {
        final currentLicensePlate = currVehicle.vehPlateId.getOrCrash();
        if (currentLicensePlate != beacon.payload) {
          final MTChangedValues changedValues = MTChangedValues({
            "vehPlateId": [currentLicensePlate, beacon.payload]
          });
          _iRepository.scribeRoutine(
              changedFields: changedValues,
              table: VehicleDBFields.tableName,
              primaryId: VehicleDBFields.primaryKey,
              primaryIdValue: dtIdValue,
              dtID: dtId,
              vehID: currVehicle.vehId);
        }
        return right(unit);
      }
      else if (type == BeaconType.vehicleNumberBeacon) {
        final vehicleNumber = currVehicle.vehId.getOrCrash();
        if (vehicleNumber != beacon.payload) {
          final MTChangedValues changedValues = MTChangedValues({
            VehicleDBFields.vehId: [vehicleNumber, beacon.payload]
          });
          _iRepository.scribeRoutine(
              changedFields: changedValues,
              table: VehicleDBFields.tableName,
              primaryId: VehicleDBFields.primaryKey,
              primaryIdValue: dtIdValue,
              dtID: dtId,
              vehID: currVehicle.vehId);
        }
        return right(unit);
      }
      else if (type == BeaconType.vinNumberBeacon) {
        final vinNumber = currVehicle.vinId.getOrCrash();
        if (vinNumber != beacon.payload) {
          final MTChangedValues changedValues = MTChangedValues({
            VehicleDBFields.vehId: [vinNumber, beacon.payload]
          });
          _iRepository.scribeRoutine(
              changedFields: changedValues,
              table: VehicleDBFields.tableName,
              primaryId: VehicleDBFields.primaryKey,
              primaryIdValue: dtIdValue,
              dtID: dtId,
              vehID: currVehicle.vehId);
        }
        return right(unit);
      }
      else if (type == BeaconType.comboBeacon) {
        //TODO need to implement this.
        throw UnimplementedError();
      } else {
        return left(Exception("Wrong Beacon Type passed"));
      }
    } catch (err) {
      return left(Exception("Error while processing beacons3to6 $err"));
    }
  }

  @override
  //TODO: Change return type to return a datatrac. 
  Future<Either<dynamic, Unit>> processStandardBeacon({
    required StandardBeacon incomingStandardBeacon,
    required StandardBeacon existingStandardBeacon,
  }) async {
    final DtID dtID = incomingStandardBeacon.dtID;
    final String dtIDString = dtID.getOrCrash().toString();

    if (incomingStandardBeacon.mtSensor.dtBtRaw ==
        existingStandardBeacon.mtSensor.dtBtRaw) {
      final value = await _distanceRepository.find(dtID: dtID);
      final Distance distance = value.getOrElse(() => throw Exception(
          'Error creating Distance Entity for dtID: $dtID. Value was retrieved from the database.'));
      existingStandardBeacon.mtDistance.updateFromDatabase(distance);
      final DateTime dateTimeRep = distance.dateTimeRep.toDateTime();

      // DateTime.difference() returns a negative number if the second time (the one in parentheses) is less than the one the method is called on
      if (dateTimeRep.difference(DateTime.now()) < const Duration(seconds: 30)) {
        log("Updating dateTimeRep for distance $dtID. Date time rep: $dateTimeRep. Current DateTime: ${DateTime.now()}", name: "bluetooth_controls.dart");
        final distanceResult = await _distanceRepository.updateDateTimeRep(dtID);
        if (distanceResult.isLeft()){
          log("Error updating distance dateTimeRep for $dtID: $distanceResult", name: "bluetooth_controls.dart");
        }

        final sensorResult = await _sensorRepository.updateDateTimeRep(dtID: dtID);
        if (sensorResult.isLeft()){
          log("Error updating sensor dateTimeRep for $dtID: $sensorResult");
        }
      } else {
        final vehicleResults = await _vehicleRepository.find(dtID: dtID);
        final vehicle = vehicleResults
            .getOrElse(() => Vehicle.empty().copyWith(dtId: dtID));
        final distanceValue = await _distanceRepository.find(dtID: dtID);
        final Distance distance = distanceValue.getOrElse(() => throw Exception(
            'Error creating Distance Entity for dtID: $dtID. Value was retrieved from the database.'));
        existingStandardBeacon.mtDistance.updateFromDatabase(distance);
        // Updating GPS location data for new data.
        final BFLocationData locationData =
            await _locationService.getCurrentLocation();
        incomingStandardBeacon.mtDistance.updateGPSData(locationData);
        final distanceChangedValues = existingStandardBeacon.mtDistance
            .parseAndGetChangedValues(
                newValue: incomingStandardBeacon.mtDistance);

        await _iRepository.scribeRoutine(
          changedFields: distanceChangedValues,
          table: DistanceDBFields.tableName,
          primaryIdValue: dtIDString,
          primaryId: DistanceDBFields.primaryKey,
          dtID: dtID,
          vehID: vehicle.vehId,
        );
      }
      return right(unit);
    } else {
      final vehicleResults = await _vehicleRepository.find(dtID: dtID);
      final vehicle = vehicleResults
          .getOrElse(() => Vehicle.empty().copyWith(dtId: dtID));

      // Process Distance Table.
      final value = await _distanceRepository.find(dtID: dtID);
      final Distance distance = value.getOrElse(() => throw Exception(
          'Error creating Distance Entity for dtID: $dtID. Value was retrieved from the database.'));
      existingStandardBeacon.mtDistance.updateFromDatabase(distance);
      // Updating GPS location data for new data.
      final BFLocationData locationData =
          await _locationService.getCurrentLocation();
      incomingStandardBeacon.mtDistance.updateGPSData(locationData);

      final distanceChangedValues = existingStandardBeacon.mtDistance
          .parseAndGetChangedValues(
              newValue: incomingStandardBeacon.mtDistance);

      await _iRepository.scribeRoutine(
        changedFields: distanceChangedValues,
        table: DistanceDBFields.tableName,
        primaryIdValue: dtIDString,
        primaryId: DistanceDBFields.primaryKey,
        dtID: dtID,
        vehID: vehicle.vehId,
      );

      // Sensor Table Changes.
      final sensorChangedValues = existingStandardBeacon.mtSensor
          .parseAndGetChangedValues(newValue: incomingStandardBeacon.mtSensor);
      await _iRepository.scribeRoutine(
        changedFields: sensorChangedValues,
        table: SensorDBFields.tableName,
        primaryId: SensorDBFields.primaryKey,
        primaryIdValue: dtIDString,
        dtID: dtID,
        vehID: vehicle.vehId,
      );

      // Model and Fuel Table changes.
      final modelAndFuelChangedValues = existingStandardBeacon.mtModelAndFuel
          .parseAndGetChangedValues(
              newValue: incomingStandardBeacon.mtModelAndFuel);
      await _iRepository.scribeRoutine(
        changedFields: modelAndFuelChangedValues,
        table: ModelAndFuelDBFields.tableName,
        primaryId: ModelAndFuelDBFields.primaryKey,
        primaryIdValue: dtIDString,
        dtID: dtID,
        vehID: vehicle.vehId,
      );

      // Vehicle Changed Values.(SiteID)
      existingStandardBeacon.mtSite.updatefromDatabase(vehicle);
      final siteChangedValues = existingStandardBeacon.mtSite
          .parseAndGetChangedValues(newValue: incomingStandardBeacon.mtSite);

      await _iRepository.scribeRoutine(
        changedFields: siteChangedValues,
        table: SiteDBFields.tableName,
        primaryId: SiteDBFields.primaryKey,
        primaryIdValue: dtIDString,
        dtID: dtID,
        vehID: vehicle.vehId,
      );

      // Making changes to the dtBtRaw Values.
      final Map<Object, List<Object?>> changedValues = {
        SensorDBFields.dtBtRaw: [
          existingStandardBeacon.mtSensor.dtBtRaw,
          incomingStandardBeacon.mtSensor.dtBtRaw
        ]
      };
      final MTChangedValues mtChangedValues = MTChangedValues(changedValues);
      await _iRepository.scribeRoutine(
        changedFields: mtChangedValues,
        table: SensorDBFields.tableName,
        primaryId: SensorDBFields.primaryKey,
        primaryIdValue: dtIDString,
        dtID: vehicle.dtId,
        vehID: vehicle.vehId,
      );

      return right(unit);
    }
  }

  @override
  Either<BluetoothFailure, Stream<BFBluetoothScanResult>> returnScanResults(){
    try {
      //Stop and restart the scan every half-second. 
      //The Bluetooth beacon will only be picked up once per device per scan, even if the beacon changes, so we need to stop and restart the scan frequently to make sure we pick up the changes. 
      Timer.periodic( Duration(seconds: 1), (timer) async {
        if (!paused && await FlutterBluePlus.instance.isOn){
          //log("Starting scan");
          await FlutterBluePlus.instance.stopScan();
          //final bool isBluetoothAvailable = await FlutterBluePlus.instance.isAvailable;
          //final bool isOn = await FlutterBluePlus.instance.isOn;
          //if (isBluetoothAvailable && isOn) {
          await FlutterBluePlus.instance.startScan(timeout: Duration(seconds: 1));
          //}
        }
      });

      final Stream<List<ScanResult>> scanResults = FlutterBluePlus.instance.scanResults;
      final Stream<BFBluetoothScanResult> bfScanResultStream =
          scanResults.map((scanResultsList) {
        if (scanResultsList.isEmpty) {
          return BFBluetoothScanResult.nonStemcoBeacon();
        } else {
          //log("Got scan item: ${scanResultsList.last.device.id.id}");
          final ScanResult scanResult = scanResultsList.last;
          final BFBluetoothScanResult bfBluetoothScanResult =
              BFBluetoothScanResultDtos.fromScanResults(scanResult).toDomain();
          return bfBluetoothScanResult;
        }
      });

      return right(bfScanResultStream);
    } catch (err) {
      return left(const BluetoothFailure.deviceNotFound());
    }
  }

  @override
  void stopScanning() {
    _bluetoothService.stopScan();
  }

  @override 
  Future<void> pauseScan() async {
    if (!paused){
      log("Pausing");
      paused = true;
      await FlutterBluePlus.instance.stopScan();
    }
    else {
      log("Already paused.");
    }
    return;
  }

  @override
  void resumeScan(){
    paused = false;
  }

  @override
  Future<Either<dynamic, Unit>> processNewBeacon(
      {required StandardBeacon incomingStandardBeacon}) async {
    try {
      log("Adding new beacon for dtId ${incomingStandardBeacon.dtID.getOrCrash()}", name: "bluetooth_controls.dart");
      final Sensor initialSensor = Sensor.empty().copyWith(
        dtId: incomingStandardBeacon.dtID,
      );
      await _sensorRepository.add(sensor: initialSensor);
      await _distanceRepository.add(
        distance: Distance.empty().copyWith(
          dtId: incomingStandardBeacon.dtID,
        ),
      );

      final StandardBeacon existingStandardBeacon =
          StandardBeacon.existingValuesFromDB(initialSensor);
      await processStandardBeacon(
        incomingStandardBeacon: incomingStandardBeacon,
        existingStandardBeacon: existingStandardBeacon,
      );
      return right(unit);
    } catch (err) {
      log("Error: $err", name: "bluetooth_controls.dart");
      return left(err);
    }
  }
}
