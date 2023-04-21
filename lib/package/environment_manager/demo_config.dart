import 'package:bluefang/package/environment_manager/ibase_config.dart';

class DemoConfig implements BaseConfig {
  @override
  String get apiHost => "localhost";

  @override
  bool get reportErrors => true;

  @override
  bool get trackEvents => false;

  @override
  String get currEnv => "demo";
}
