import 'package:bluefang/package/bit_manipulation/bit_manipulation.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/factory/beacon_factory.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/i_beacon.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/i_vehicle_beacon.dart';
import 'package:bluefang/src/domain/core/mt_changed_values.dart';
import 'package:bluefang/src/domain/core/mt_mixin.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vin_number_beacon.freezed.dart';

@freezed
class VinNumberBeacon
    with _$VinNumberBeacon, MTMixin
    implements IBeacon, IVehicleBeacon {
  const VinNumberBeacon._();
  const factory VinNumberBeacon({
    required String hexValue,
    required String manufacturerId,
    required DtID dtId,
    required BeaconType beaconType,
    required String stringLength,
    required String vinNumber,
  }) = _VinNumberBeacon;

  factory VinNumberBeacon.fromJson(Map<String, String> json) {
    return VinNumberBeacon(
      hexValue: json["hexValue"].toString(),
      manufacturerId: json['manufacturerId'].toString(),
      dtId: DtID(int.parse(json['dtId'].toString())),
      beaconType: BeaconType.vinNumberBeacon,
      stringLength: (json['stringLength']).toString(),
      vinNumber:
          BitManipulation.getPayloadFromVehBeacons(json['hexValue'].toString()),
    );
  }

  @override
  DtID get dtID => dtId;
  @override
  BeaconType get beaconTypes => beaconType;
  @override
  MTChangedValues processBeacon(IBeacon beacon) {
    final VinNumberBeacon beaconEntity = beacon as VinNumberBeacon;
    return mtChangedValues(newValue: beaconEntity);
  }

  @override
  // TODO: implement mtTracked
  List<Object> get mtTracked => toJson().keys.toList();

  @override
  Map<String, Object?> toJson() {
    // TODO: implement toJson
    return {
      "manufacturerId": manufacturerId,
      "dtId": dtID,
      "beaconType": beaconType,
      "stringLength": stringLength,
      "vinNumber": vinNumber
    };
  }

  @override
  // TODO: implement payload
  String get payload => vinNumber;

  @override
  String get hex => hexValue;
}
