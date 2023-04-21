import 'package:bluefang/injection.dart';
import 'package:bluefang/package/environment_manager/demo_config.dart';
import 'package:bluefang/package/environment_manager/dev_config.dart';
import 'package:bluefang/package/environment_manager/ibase_config.dart';
import 'package:bluefang/package/environment_manager/prod_config.dart';
import 'package:bluefang/package/environment_manager/test_config.dart';

// The environment manager class and the injection.dart class work hand in hand to set
// the current enviroment of the application and inject appropriate classes according to the environment.
class EnvironmentManager {
  late BaseConfig config;
  bool _isInitialized = false;

  factory EnvironmentManager() {
    return _singleton;
  }
  EnvironmentManager._internal();

  static final EnvironmentManager _singleton = EnvironmentManager._internal();

  static const String dev = 'dev';
  static const String demo = 'demo';
  static const String prod = 'prod';
  static const String test = 'test';

  void initConfig(EnviromentType environment) {
    config = _getConfig(environment);
    _isInitialized = true;
  }

  static EnviromentType getEnviromentType(String env) {
    final map = {
      EnvironmentManager.dev: EnviromentType.dev,
      EnvironmentManager.demo: EnviromentType.demo,
      EnvironmentManager.prod: EnviromentType.prod,
      EnvironmentManager.test: EnviromentType.test,
    };

    assert(map.containsKey(env.toLowerCase()));

    if (map.containsKey(env.toLowerCase())) {
      return map[env]!;
    } else {
      return EnviromentType.prod;
    }
  }

  void updateConfig(EnviromentType environment) {
    configureInjection(environment.name);
    initConfig(environment);
  }

  String get currEnvironment {
    if (_isInitialized) {
      return config.currEnv;
    } else {
      throw Exception(
          "Environment is not initialized. Please call the initConfig method to set the enviroment.");
    }
  }

  BaseConfig _getConfig(EnviromentType environment) {
    switch (environment) {
      case EnviromentType.prod:
        return ProdConfig();
      case EnviromentType.demo:
        return DemoConfig();
      case EnviromentType.dev:
        return DevConfig();
      case EnviromentType.test:
        return TestConfig();
      default:
        return DevConfig();
    }
  }
}

enum EnviromentType { test, demo, prod, dev }
