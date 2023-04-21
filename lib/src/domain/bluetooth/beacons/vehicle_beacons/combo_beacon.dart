import 'package:bluefang/src/domain/bluetooth/beacons/factory/beacon_factory.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/i_beacon.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'combo_beacon.freezed.dart';

@freezed
class ComboBeacon with _$ComboBeacon implements IBeacon {
  const ComboBeacon._();
  const factory ComboBeacon({
    required String hexValue,
    required String manufacturerId,
    required DtID dtId,
    required BeaconType beaconType,
    required String vehilceNumberStringLength,
    required String licensePlateStringLength,
    required String vinNumberStringLength,
    required String vehicleNumber,
    required String licensePlateNumber,
    required String vinNumber,
  }) = _ComboBeacon;

  @override
  BeaconType get beaconTypes => beaconType;

  @override
  DtID get dtID => dtId;

  void processBeacon(IBeacon beacon) {
    // TODO: implement processBeacon
  }

  @override
  // TODO: implement hex
  String get hex => hexValue;

  @override
  Map<String, Object?> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
