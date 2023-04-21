// import 'package:bluefang/injection.dart';
// import 'package:bluefang/src/domain/bluetooth/bluetooth_result.dart';
// import 'package:bluefang/src/domain/bluetooth/i_bluetooth_repository.dart';
// import 'package:bluefang/src/infrastructure/core/database_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:injectable/injectable.dart' as injectable;
// import 'package:integration_test/integration_test.dart';
// import 'package:flutter_driver/driver_extension.dart';

// Future<void> main() async {
//   enableFlutterDriverExtension();
//   Future<void> initDbManagers() async {
//     await usersDbManager.init();
//   }

//   WidgetsFlutterBinding.ensureInitialized();
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized();
//   await initDbManagers();
//   await configureInjection(injectable.Environment.dev);

//   final bluetoothRepo = getIt<IBluetoothRepository>();

//   group('get the value of the beacon', () {
//     test('should fetch the value of the beacon', () {
//       // final result = bluetoothRepo.getAllStemcoDevices();
//       // final Stream<BFBluetoothScanResult> stream =
//       //     result.getOrElse(() => throw Exception('Error getting result'));
//       // stream.listen((event) {
//       //   print(event);
//       });
//       expect(result.isRight(), true);
//     });
//   });
// }
