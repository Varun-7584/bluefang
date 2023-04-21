import 'dart:async';

import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/i_beacon.dart';
import 'package:bluefang/src/domain/bluetooth/bluetooth_result.dart';
import 'package:bluefang/src/domain/bluetooth/core/bluetooth_failure.dart';
import 'package:dartz/dartz.dart';

abstract class IBluetoothRepository {
  Either<BluetoothFailure, Stream<BFBluetoothScanResult>> getScanResults();
  Future<Either<dynamic, Unit>> processBeacons(
      BFBluetoothScanResult bfBluetoothScanResult);
  void start() {}
  
  /// Pauses the Bluetooth scan. 
  /// 
  /// If the scan was already paused, this method has no effect. 
  Future<void> pause();

  /// Resume the Bluetooth scan. 
  /// 
  /// If the scan was not paused, this method has no effect. 
  void resume();


  Future<Either<BluetoothFailure, Unit>> programDataTracSvt(
      {required ProgrammedDataTrac programDataTrac,
      required Map<String, dynamic> changedValues});
  Stream<IBeacon> get streamOfBeacons;
}
