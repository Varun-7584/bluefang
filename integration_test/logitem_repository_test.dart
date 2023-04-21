import 'package:bluefang/injection.dart';
import 'package:bluefang/src/domain/logging/i_logitem_repository.dart';
// import 'package:bluefang/src/domain/aggregates/vehicleInfo/i_vehicle_info_repository.dart';
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
  final logItemRepo = getIt<ILogItemRepository>();

  group('CRUD test', () {
    test('should fetch information about sensor Repository', () async {
      final result = await logItemRepo.fetchItems(20);
      expect(result.isRight(), true);
    });
  });
}
