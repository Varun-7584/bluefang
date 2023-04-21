import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

@module
abstract class LocationInjectableModule {
  Location get location => Location.instance;
}
