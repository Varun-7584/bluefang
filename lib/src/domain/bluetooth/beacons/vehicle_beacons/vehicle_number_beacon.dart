import 'package:bluefang/package/bit_manipulation/bit_manipulation.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/factory/beacon_factory.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/i_beacon.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/i_vehicle_beacon.dart';
import 'package:bluefang/src/domain/core/mt_changed_values.dart';
import 'package:bluefang/src/domain/core/mt_mixin.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_number_beacon.freezed.dart';

@freezed
class VehicleNumberBeacon
    with _$VehicleNumberBeacon, MTMixin
    implements IBeacon, IVehicleBeacon {
  VehicleNumberBeacon._();
  factory VehicleNumberBeacon({
    required String hexValue,
    required String manufacturerId,
    required DtID dtId,
    required BeaconType beaconType,
    required String stringLength,
    required String vehicleNumber,
  }) = _VehicleNumberBeacon;

  factory VehicleNumberBeacon.fromJson(Map<String, String> json) {
    return VehicleNumberBeacon(
      hexValue: json["hexValue"].toString(),
      manufacturerId: json['manufacturerId'].toString(),
      dtId: DtID(int.parse(json['dtId'].toString())),
      beaconType: BeaconType.vehicleNumberBeacon,
      stringLength: (json['stringLength']).toString(),
      vehicleNumber:
          BitManipulation.getPayloadFromVehBeacons(json['hexValue'].toString()),
    );
  }

  @override
  // TODO: implement payload
  String get payload => vehicleNumber;

  @override
  DtID get dtID => dtId;
  @override
  BeaconType get beaconTypes => beaconType;

  @override
  MTChangedValues processBeacon(IBeacon beacon) {
    // TODO: implement processBeacon
    throw UnimplementedError();
  }

  @override
  // TODO: implement mtTracked
  List<Object> get mtTracked => toJson().keys.toList();

  @override
  Map<String, Object?> toJson() {
    return {
      "hexValue": hexValue,
      "manufacturerId": manufacturerId,
      "dtId": dtID,
      "beaconType": beaconType,
      "stringLength": stringLength,
      "vehicleNumber": vehicleNumber
    };
  }

  @override
  // TODO: implement hex
  String get hex => hexValue;
}
