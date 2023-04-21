// // TODO: work on the test eventually.
// // ignore_for_file: unused_local_variable

// import 'package:bluefang/src/domain/bluetooth/bluetooth_result.dart';
// import 'package:bluefang/src/domain/bluetooth/i_bluetooth_controls.dart';
// import 'package:bluefang/src/domain/bluetooth/i_bluetooth_service.dart';
// import 'package:bluefang/src/domain/core/i_repository.dart';
// import 'package:bluefang/src/domain/core/repository_failures.dart';
// import 'package:bluefang/src/domain/core/value_objects.dart';
// import 'package:bluefang/src/domain/distance/distance.dart';
// import 'package:bluefang/src/domain/distance/distance_failure.dart';
// import 'package:bluefang/src/domain/distance/i_distance_repository.dart';
// import 'package:bluefang/src/domain/sensor/i_sensor_repository.dart';
// import 'package:bluefang/src/domain/sensor/sensor_failure.dart';
// import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
// import 'package:bluefang/src/domain/vehicle/i_vehicle_repository.dart';
// import 'package:bluefang/src/infrastructure/bluetooth/bluetooth_controls.dart';
// import 'package:bluefang/src/infrastructure/bluetooth/bluetooth_repository.dart';
// import 'package:bluefang/src/infrastructure/bluetooth/services/test_bluetooth_service.dart';
// import 'package:bluefang/src/infrastructure/core/repository/i_cache.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_blue_plus/flutter_blue_plus.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// class MockBluetoothService extends Mock implements BluetoothService {
//   // @override
//   Stream<List<BFBluetoothScanResult>> returnScanResults() {
//     final TestBluetoothService beaconSimulator = TestBluetoothService();
//     final stream = beaconSimulator.emitListBeacons();
//     final returnStream = stream.getOrElse(() => throw 'Error getting stream');
//     return returnStream;
//   }
// }

// class MockBluetoothControls extends Mock implements IBluetoothControls {
//   @override
//   Future<Either<SensorFailure, String>> alreadyInSensor(DtID dtId) {
//     return Future.value(right('495968420'));
//   }
// }

// class MockSensorRepository extends Mock implements ISensorRepository {}

// class MockBeaconSimulator extends Mock implements IBluetoothService {}

// class MockDistanceRepository extends Mock implements IDistanceRepository {
//   @override
//   Future<Either<DistanceFailure, Distance>> find({required DtID dtID}) {
//     final Distance distance = Distance(
//         dtId: DtID(495968420),
//         dtLifeMiles: DtLifeMiles(0),
//         gpsLon: GpsLon(-73.12345),
//         gpsLat: GpsLat(40.12345),
//         userIdMod: UserID(811),
//         dateTimeMod: DateTimeMod.fromInt(1627613966),
//         userIdRep: UserID(811),
//         dateTimeRep: DateTimeMod.fromInt(1627613966));
//     return Future.value(right(distance));
//   }
// }

// class MockRepository extends Mock implements IRepository {
//   @override
//   Future<Either<RepositoryFailures, Unit>> scribeRoutine({
//     required Map<String, dynamic> changedFields,
//     required String table,
//     required String primaryId,
//     required String primaryIdValue,
//   }) {
//     if (kDebugMode) {
//       print(
//           "[bluetooth_controls_test] Inserting $changedFields to $table with primary ID $primaryId and value $primaryIdValue");
//     }
//     return Future.value(right(unit));
//   }
// }

// class MockCache extends Mock implements ICache {}

// class MockVehicleRepository extends Mock implements IVehicleRepository {}

// void main() {
//   setUp(() {});
//   tearDown(() {});

//   final mockSensorRepo = MockSensorRepository();
//   final mockDistanceRepo = MockDistanceRepository();
//   final mockRepo = MockRepository();
//   final beaconSimulator = TestBluetoothService();
//   final mockVehicleRepo = MockVehicleRepository();
//   final mockBluetoothService = MockBluetoothService();
//   final mockBeaconSimulator = MockBeaconSimulator();
//   final mockLocalRepository = MockCache();
//   final bluetoothControls = BluetoothControls(mockBeaconSimulator,
//       mockSensorRepo, mockDistanceRepo, mockRepo, mockVehicleRepo,);
//   final mockBluetoothRepository = BluetoothRepository(
//       bluetoothControls, mockLocalRepository, mockSensorRepo);
//   test('return a stream of data', () {
//     when(mockBeaconSimulator.returnScanResults()).thenAnswer(
//         (realInvocation) => mockBeaconSimulator.returnScanResults());

//     // mockBluetoothRepository.processBeacons(stream);
//     final stream = mockBeaconSimulator.returnScanResults();
//     stream.listen((event) {
//       if (kDebugMode) {
//         print("[bluetooth_controls_test] Return Scan Results Events: $event");
//       }
//     });
//   });
// }
