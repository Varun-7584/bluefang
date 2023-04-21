import 'package:bluefang/injection.dart';
import 'package:bluefang/src/domain/modelandfuel/i_modelandfuel_repository.dart';
// import 'package:bluefang/src/domain/aggregates/vehicleInfo/i_vehicle_info_repository.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
import 'package:bluefang/src/infrastructure/core/database_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:integration_test/integration_test.dart';

Future<void> main() async {
  Future<void> initDbManagers() async {
    await usersDbManager.init();
  }

  WidgetsFlutterBinding.ensureInitialized();
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  await initDbManagers();
  await configureInjection(injectable.Environment.dev);
  final modelAndFuelRepo = getIt<IModelAndFuelRepository>();

  group('CRUD test', () {
    test('should fetch information about model and fuel for a given VINID9',
        () async {
      final result = await modelAndFuelRepo.find(vinID9: VinID9('1FDGF5GYJ'));
      expect(result.isRight(), true);
    });
  });
}
