import 'dart:developer';
import 'package:bluefang/injection.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/i_program_datatrac_repo.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
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
  final programDataTracRepo = getIt<IProgrammedDataTracRepository>();
  group('CRUD test', () {
    test('should fetch a ProgramDataTrac Aggregate for a given dtID', () async {
      final result = await programDataTracRepo.find(dtID: DtID(240683876));
      log('This is programmedData Trac Info 🚊🚊🚊 $result',
          name: 'program_data_trac_repository.test');

      expect(result.isRight(), true);
    });
  });
}
