import 'package:bluefang/src/domain/bluetooth/beacons/factory/beacon_factory.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';

abstract class IBeacon {
  DtID get dtID;
  BeaconType get beaconTypes;
  Map<String, Object?> toJson();
  String get hex;
}
