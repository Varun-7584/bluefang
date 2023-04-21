import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/domain/site/site_value_objects.dart';
import 'package:bluefang/src/domain/vehicle/vehicle.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_dtos.freezed.dart';

@freezed
class VehicleDto with _$VehicleDto {
  const VehicleDto._();

  /// Stores the information for a vehicle object.
  const factory VehicleDto({
    required String vehId,
    required String vehPlateId,
    required String vinId,
    required int siteId,
    required int dtId,
    required int userIdMod,
    required int dateTimeMod,
    required int userIdRep,
    required int dateTimeRep,
  }) = _VehicleDto;

  factory VehicleDto.fromDomain(Vehicle vehicle) {
    return VehicleDto(
        vehId: vehicle.vehId.getOrCrash(),
        vehPlateId: vehicle.vehPlateId.getOrCrash(),
        vinId: vehicle.vinId.getOrCrash(),
        siteId: vehicle.siteId.getOrCrash(),
        dtId: vehicle.dtId.getOrCrash(),
        userIdMod: vehicle.userIdMod.getOrCrash(),
        dateTimeMod: vehicle.dateTimeMod.getOrCrash(),
        userIdRep: vehicle.userIdRep.getOrCrash(),
        dateTimeRep: vehicle.dateTimeRep.getOrCrash());
  }

  Vehicle toDomain({bool bypassVinVerification = false}) {
    return Vehicle(
        vehId: VehID(vehId),
        vehPlateId: VehPlateID(vehPlateId),
        vinId: VinID(vinId, bypassVerification: bypassVinVerification),
        siteId: SiteID(siteId),
        dtId: DtID(dtId),
        userIdMod: UserID(userIdMod),
        dateTimeMod: DateTimeMod.fromInt(dateTimeMod),
        userIdRep: UserID(userIdRep),
        dateTimeRep: DateTimeMod.fromInt(dateTimeRep));
  }

  factory VehicleDto.fromJson(Map<String, dynamic> json) {
    return VehicleDto(
      vehId: json[VehicleDBFields.vehId].toString(),
      vehPlateId: json[VehicleDBFields.vehPlateId].toString(),
      vinId: json[VehicleDBFields.vinId].toString(),
      siteId: json[VehicleDBFields.siteId] as int,
      dtId: json[VehicleDBFields.dtId] as int,
      userIdMod: json[VehicleDBFields.userIdMod] as int,
      dateTimeMod: json[VehicleDBFields.dateTimeMod] as int,
      userIdRep: json[VehicleDBFields.userIdRep] as int,
      dateTimeRep: json[VehicleDBFields.dateTimeRep] as int,
    );
  }

  Map<String, Object?> toJson() => {
        VehicleDBFields.vehId: vehId,
        VehicleDBFields.vehPlateId: vehPlateId,
        VehicleDBFields.vinId: vinId,
        VehicleDBFields.siteId: siteId,
        VehicleDBFields.dtId: dtId,
        VehicleDBFields.userIdMod: userIdMod,
        VehicleDBFields.dateTimeMod: dateTimeMod,
        VehicleDBFields.userIdRep: userIdRep,
        VehicleDBFields.dateTimeRep: dateTimeRep,
      };
}

class VehicleDBFields {
  static const String tableName = 'Vehicle';
  static const String primaryKey = 'dtId';
  static const String vehId = 'vehId';
  static const String vehPlateId = 'vehPlateId';
  static const String vinId = 'vinId';
  static const String dtId = 'dtId';
  static const String siteId = 'siteId';
  static const String userIdMod = 'userIdMod';
  static const String dateTimeMod = 'dateTimeMod';
  static const String userIdRep = 'userIdRep';
  static const String dateTimeRep = 'dateTimeRep';
}
