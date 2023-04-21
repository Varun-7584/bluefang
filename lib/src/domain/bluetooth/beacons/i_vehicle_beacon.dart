import 'package:bluefang/src/domain/bluetooth/beacons/i_beacon.dart';
import 'package:bluefang/src/domain/core/mt_changed_values.dart';

abstract class IVehicleBeacon extends IBeacon {
  String get payload;
  MTChangedValues processBeacon(IVehicleBeacon beacon);
}
