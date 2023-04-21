import 'package:bluefang/package/environment_manager/environment_manager.dart';
import 'package:bluefang/src/infrastructure/core/database_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqlite_api.dart';

@module
abstract class MockSqlLiteInjectableModule {
  @preResolve
  @Environment(EnvironmentManager.demo)
  Future<Database> get database => mockUserDbManager.db;
}

@module
abstract class SqlLiteInjectableModule {
  @preResolve
  @test
  @prod
  Future<Database> get database => usersDbManager.db;
}

@module
abstract class SharedPreferenceInjectableModule {
  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}
