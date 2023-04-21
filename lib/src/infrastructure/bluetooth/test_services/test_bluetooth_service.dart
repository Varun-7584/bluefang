import 'dart:async';
import 'dart:collection';
import 'package:bluefang/src/domain/bluetooth/bluetooth_result.dart';
import 'package:bluefang/src/domain/bluetooth/core/bluetooth_failure.dart';
import 'package:bluefang/src/domain/bluetooth/i_bluetooth_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@test
@LazySingleton(as: IBluetoothService)
class TestBluetoothService implements IBluetoothService {
  static var _isScanning = false;
  int timeInterval = 5;
  int numberOfBeaconsToSend = 10000;
  final List<int> customHexBytes = [
    14,
    88,
    139,
    118,
    26,
    58,
    1,
    29,
    176,
    4,
    14,
    201,
    0,
    0,
    3,
    121,
    0,
    0,
    0,
    0,
    123
  ];

  final List<int> originalBeacon = [
    14,
    88,
    139,
    118,
    16,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ];

  final List<int> invalidBeaconBytes = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ];

  // [14, 88, 139, 118, 122, 58, 1, 29, 176, 4, 14, 201, 0, 0, 3, 121, 0, 0, 0, 0, 123];
  // TestBluetoothService();

  Either<BluetoothFailure, Stream<Queue<BFBluetoothScanResult>>> emitBeacons() {
    try {
      // ignore: unused_local_variable

      final BFBluetoothScanResult customStandardBeacon =
          BFBluetoothScanResult.create(listOfBeacon: customHexBytes, name: "1");
      final BFBluetoothScanResult invalidBeacon = BFBluetoothScanResult.create(
          listOfBeacon: invalidBeaconBytes, name: "1");

      final BFBluetoothScanResult originalStandardBeacon =
          BFBluetoothScanResult.create(listOfBeacon: originalBeacon, name: "2");
      final List<BFBluetoothScanResult> listOfBeacons = [
        customStandardBeacon,
        originalStandardBeacon,
        invalidBeacon
      ];

      final Queue<BFBluetoothScanResult> queueOfBeacons = Queue();
      final Stream<Queue<BFBluetoothScanResult>> myStream =
          Stream.periodic(Duration(seconds: timeInterval), (int count) {
        final int number = count % 3;
        if (kDebugMode) {
          print(
              "🪵 [test_bluetooth_service.dart] Beacons Emitted Count : $count");
        }
        if (numberOfBeaconsToSend > 0) {
          queueOfBeacons.addFirst(listOfBeacons[number]);
          numberOfBeaconsToSend -= 1;
        }
        return queueOfBeacons;
      });

      return right(myStream);
    } catch (err) {
      return left(const BluetoothFailure.deviceNotFound());
    }
  }

  Either<BluetoothFailure, Stream<List<BFBluetoothScanResult>>>
      emitListBeacons() {
    try {
      // ignore: unused_local_variable

      final BFBluetoothScanResult customStandardBeacon =
          BFBluetoothScanResult.create(
              listOfBeacon: customHexBytes, name: "Custom Standard Beacon 1");
      final BFBluetoothScanResult originalStandardBeacon =
          BFBluetoothScanResult.create(
              listOfBeacon: originalBeacon, name: "Custom Standard Beacon 2");
      final BFBluetoothScanResult invalidBeacon = BFBluetoothScanResult.create(
          listOfBeacon: invalidBeaconBytes, name: "1");
      final List<BFBluetoothScanResult> listOfBeacons = [
        customStandardBeacon,
        originalStandardBeacon,
        invalidBeacon,
      ];

      final List<BFBluetoothScanResult> returnListOfBeacons = [];

      final Stream<List<BFBluetoothScanResult>> myStream =
          Stream.periodic(Duration(seconds: timeInterval), (int count) {
        final int number = count % 3;
        if (kDebugMode) {
          print('[test_bluetooth_service] Beacons emitted count: $count');
        }
        if (numberOfBeaconsToSend > 0) {
          listOfBeacons.add(listOfBeacons[number]);
          numberOfBeaconsToSend -= 1;
        }
        returnListOfBeacons.add(listOfBeacons[number]);
        return returnListOfBeacons;
      });

      return right(myStream);
    } catch (err) {
      return left(const BluetoothFailure.deviceNotFound());
    }
  }

  @override
  Stream<List<BFBluetoothScanResult>> returnScanResults() {
    final stream = emitListBeacons().getOrElse(() =>
        throw Exception('Error getting stream from emitListBeacons function'));
    return stream;
  }

  @override
  Future startScan({Duration? timeout}) {
    if (_isScanning) {
      throw Exception('Another scan in progress');
    } else {
      _isScanning = true;
      if (kDebugMode) {
        print("🪵 [beacon_simulator] Started Scanning ... ");
      }
      return Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  Future stopScan() {
    _isScanning = false;
    return Future.delayed(const Duration(milliseconds: 1));
  }

  @override
  Future<bool> get isAvailable => Future.value(true);

  @override
  Future<bool> get isOn => Future.value(true);

  @override
  // TODO: implement isScanning
  Stream<bool> get isScanning => throw UnimplementedError();
}
