import 'package:bluefang/package/environment_manager/environment_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("environment", () {
    test("insantiate environment manager class", () {
      EnvironmentManager().initConfig(EnviromentType.dev);
      expect(EnvironmentManager().config.currEnv, "dev");
    });

    test("change environment multiple times", () {
      EnvironmentManager().initConfig(EnviromentType.demo);
      EnvironmentManager().initConfig(EnviromentType.prod);
      EnvironmentManager().initConfig(EnviromentType.test);
      expect(EnvironmentManager().config.currEnv, "test");
    });
  });
}
