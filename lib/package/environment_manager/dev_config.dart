import 'package:bluefang/package/environment_manager/ibase_config.dart';

class DevConfig implements BaseConfig {
  @override
  String get apiHost => "localhost";

  @override
  bool get reportErrors => false;

  @override
  bool get trackEvents => false;

  @override
  String get currEnv => "dev";
}
