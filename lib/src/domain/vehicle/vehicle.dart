import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/core/mt_mixin.dart';
import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/domain/site/site_value_objects.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle.freezed.dart';

@freezed
class Vehicle with _$Vehicle, MTMixin {
  static String defualtVINID = "0";
  Vehicle._();

  /// Constructs a Vehicle object from the given parameters.
  /// ```
  /// const factory Vehicle({
  ///  required VehID vehId,
  ///  required VehPlateID vehPlateId,
  ///  required VinID vinId,
  ///  required SiteID siteId,
  ///  required DtID dtId,
  ///  required UserID userIdMod,
  ///  required DateTimeMod dateTimeMod,
  ///  required UserID userIdRep,
  ///  required DateTimeMod dateTimeRep,
  ///})
  /// ```
  factory Vehicle({
    required VehID vehId,
    required VehPlateID vehPlateId,
    required VinID vinId,
    required SiteID siteId,
    required DtID dtId,
    required UserID userIdMod,
    required DateTimeMod dateTimeMod,
    required UserID userIdRep,
    required DateTimeMod dateTimeRep,
  }) = _Vehicle;

  @override
  // TODO: implement mtTracked
  List<Object> get mtTracked =>
      ["Veh_siteId,Veh_vehId,Veh_vehPlateId,Veh_vinId"];

  /// Creates an empty Vehicle object, using default values for all of the fields.
  factory Vehicle.empty() => Vehicle(
        vehId: VehID('Default'),
        vehPlateId: VehPlateID('Default'),
        vinId: VinID(defualtVINID), // Default VIN
        siteId: SiteID(255),
        dtId: DtID(0),
        userIdMod: UserID(0),
        dateTimeMod: DateTimeMod.now(),
        userIdRep: UserID(0),
        dateTimeRep: DateTimeMod.now(),
      );

  /// Returns a json representation of the object it is called on.
  ///
  /// Currently cannot handle the json object being null or any of the values being null.
  @override
  Map<String, Object?> toJson() => {
        'Veh_vehId': vehId.getValueOrErrorString(),
        'Veh_vehPlateId': vehPlateId.getValueOrErrorString(),
        'Veh_vinId': vinId.getValueOrErrorString(),
        'Veh_siteId': siteId.getValueOrErrorString(),
        'Veh_dtId': dtId.getValueOrErrorString(),
        'Veh_userIdMod': userIdMod.getValueOrErrorString(),
        'Veh_dateTimeMod': dateTimeMod.getValueOrErrorString(),
        'Veh_userIdRep': userIdRep.getValueOrErrorString(),
        'Veh_dateTimeRep': dateTimeRep.getValueOrErrorString(),
      };

  /// Takes a json map and returns a Vehicle object filled from that map.
  ///
  /// Currently cannot handle the json object being null or any of the values being null.
  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      vehId: VehID(
          (json['Veh_vehId'] as String?) == null || json['Veh_vehId'] == ""
              ? "0"
              : json['Veh_vehId'] as String),
      vehPlateId: VehPlateID((json["Veh_vehPlateId"] as String?) == null
          ? ""
          : json["Veh_vehPlateId"] as String),
      vinId: VinID(
          (json["Veh_vin"] as String?) == null ? "" : json["vin"] as String),
      siteId: SiteID((json["Veh_siteId"] as String?) == null
          ? 0
          : int.parse(json["Veh_siteId"] as String)),
      dtId: DtID((json["Veh_vehDtId"] as String?) == null
          ? 0
          : int.parse(json["Veh_vehDtId"] as String)),
      userIdMod: UserID(json['Veh_userIdMod'] as int),
      dateTimeMod: DateTimeMod.fromInt(json['Veh_dateTimeMod'] as int),
      userIdRep: UserID(json['Veh_userIdRep'] as int),
      dateTimeRep: DateTimeMod.fromInt(json['Veh_dateTimeRep'] as int),
    );
  }

  Option<ValueFailure<dynamic>> get failureOption {
    return dateTimeMod.failureOrUnit
        .andThen(dateTimeRep.failureOrUnit)
        .andThen(vehId.failureOrUnit)
        .andThen(vehPlateId.failureOrUnit)
        .andThen(vinId.failureOrUnit)
        .andThen(siteId.failureOrUnit)
        .andThen(dtId.failureOrUnit)
        .andThen(siteId.failureOrUnit)
        .andThen(userIdMod.failureOrUnit)
        .andThen(userIdRep.failureOrUnit)
        .fold(
          (f) => some(f),
          (r) => none(),
        );
  }
}
