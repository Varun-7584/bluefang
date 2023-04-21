import 'dart:async';

import 'package:bluefang/src/domain/bluetooth/beacons/i_beacon.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/i_vehicle_beacon.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/standard_beacon/standard_beacon.dart';
import 'package:bluefang/src/domain/bluetooth/bluetooth_result.dart';
import 'package:bluefang/src/domain/bluetooth/core/bluetooth_failure.dart';
import 'package:bluefang/src/domain/sensor/sensor.dart';
import 'package:bluefang/src/domain/sensor/sensor_failure.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:dartz/dartz.dart';

abstract class IBluetoothControls {
  /// Returns a stream which contains results.
  /// Currently we use flutter_blue_plus so the type is [ScanResults]
  Either<BluetoothFailure, Stream<BFBluetoothScanResult>> returnScanResults();

  /// Used to check if the beacon emitted is from a new sensor.
  /// Returns a string 'null' if the sensor is new.
  /// Returns DtID if the sensor exists in the database.

  Future<Either<SensorFailure, Sensor>> alreadyInSensor(DtID dtId);
  Either<dynamic, IBeacon> emitBeacons(
      {required BFBluetoothScanResult scanResult});
  Future<Either<dynamic, Unit>> processStandardBeacon({
    required StandardBeacon incomingStandardBeacon,
    required StandardBeacon existingStandardBeacon,
  });

  Future<Either<dynamic, Unit>> processNewBeacon({
    required StandardBeacon incomingStandardBeacon,
  });

  Future<Either<dynamic, Unit>> processBtBeacon3To6(IVehicleBeacon beacon);
  void stopScanning();

  /// Pause the scan. 
  /// 
  /// If the scan was already paused, this has no effect. 
  Future<void> pauseScan();
  
  /// Set the scan to resume when the timer next triggers.  
  /// 
  /// If the scan was not paused, this has no effect. 
  void resumeScan();
}
