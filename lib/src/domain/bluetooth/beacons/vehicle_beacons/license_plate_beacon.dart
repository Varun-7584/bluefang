import 'package:bluefang/package/bit_manipulation/bit_manipulation.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/factory/beacon_factory.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/i_beacon.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/i_vehicle_beacon.dart';
import 'package:bluefang/src/domain/core/mt_changed_values.dart';
import 'package:bluefang/src/domain/core/mt_mixin.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'license_plate_beacon.freezed.dart';

@freezed
class LicensePlateBeacon
    with _$LicensePlateBeacon, MTMixin
    implements IVehicleBeacon, IBeacon {
  const LicensePlateBeacon._();
  const factory LicensePlateBeacon({
    required String hexValue,
    required String manufacturerId,
    required DtID dtId,
    required BeaconType beaconType,
    required String stringLength,
    required String licensePlate,
  }) = _LicensePlateBeacon;

  factory LicensePlateBeacon.fromJson(Map<String, String> json) {
    return LicensePlateBeacon(
      hexValue: json['hexValue'].toString(),
      manufacturerId: json['manufacturerId'].toString(),
      dtId: DtID(int.parse(json['dtId'].toString())),
      beaconType: BeaconType.licensePlateNumberBeacon,
      stringLength: (json['stringLength']).toString(),
      licensePlate:
          BitManipulation.getPayloadFromVehBeacons(json['hexValue'].toString()),
    );
  }

  @override
  DtID get dtID => dtId;
  @override
  BeaconType get beaconTypes => beaconType;

  @override
  List<Object> get mtTracked => toJson().keys.toList();

  @override
  Map<String, Object?> toJson() {
    return {
      "hexValue": hexValue,
      "manufacturerId": manufacturerId,
      "dtId": dtID,
      "beaconType": beaconType,
      "stringLength": stringLength,
      "licensePlate": licensePlate
    };
  }

  @override
  MTChangedValues processBeacon(IBeacon beacon) {
    throw UnimplementedError();
  }

  @override
  String get payload => licensePlate;

  @override
  String get hex => hexValue;
}
