import 'package:bluefang/package/environment_manager/ibase_config.dart';

class ProdConfig implements BaseConfig {
  @override
  String get apiHost => "www.stemco.com/api/bluefang";

  @override
  bool get reportErrors => true;

  @override
  bool get trackEvents => true;

  @override
  String get currEnv => "prod";
}
