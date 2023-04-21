import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/domain/sensor/sensor.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sensor_dtos.freezed.dart';

@freezed
class SensorDto with _$SensorDto {
  const SensorDto._();

  const factory SensorDto({
    required int dtId,
    required String dtBtRaw,
    required int dtRpd,
    required int dtUom,
    required int dtLoBat,
    required int dtReprogrammable,
    required int dtLocked,
    required int dtSecure,
    required int dtModCount,
    required int dtFirmVerMsp,
    required int dtFirmVerBT5Ap,
    required int dtFirmVerBT5Sdk,
    required int userIdMod,
    required int userIdRep,
    required int dateTimeMod,
    required int dateTimeRep,
  }) = _SensorDto;

  factory SensorDto.fromDomain(Sensor sensor) {
    return SensorDto(
      dtId: sensor.dtId.getOrCrash(),
      dtBtRaw: sensor.dtBtRaw,
      dtRpd: sensor.dtRpd.getOrCrash(),
      dtUom: sensor.dtUom.getOrCrash(),
      dtLoBat: sensor.dtLoBat.getOrCrash(),
      dtReprogrammable: sensor.dtReprogrammable.getOrCrash(),
      dtLocked: sensor.dtLocked.getOrCrash(),
      dtSecure: sensor.dtSecure.getOrCrash(),
      dtModCount: sensor.dtModCount.getOrCrash(),
      dtFirmVerMsp: sensor.dtFirmVerMsp.getOrCrash(),
      dtFirmVerBT5Ap: sensor.dtFirmVerBT5Ap.getOrCrash(),
      dtFirmVerBT5Sdk: sensor.dtFirmVerBT5Sdk.getOrCrash(),
      userIdMod: sensor.userIdMod.getOrCrash(),
      userIdRep: sensor.userIdRep.getOrCrash(),
      dateTimeMod: sensor.dateTimeMod.getOrCrash(),
      dateTimeRep: sensor.dateTimeRep.getOrCrash(),
    );
  }

  Sensor toDomain() {
    return Sensor(
      dtBtRaw: dtBtRaw,
      dtId: DtID(dtId),
      dtIdHumanReadable: DtIDHumanReadable(dtId),
      dtRpd: DtRPD(dtRpd),
      dtUom: DtUOM(dtUom),
      dtLoBat: DtLoBat(dtLoBat),
      dtReprogrammable: DtReprogrammable(dtReprogrammable),
      dtLocked: DtLocked(dtLocked),
      dtSecure: DtSecure(dtSecure),
      dtModCount: DtModCount(dtModCount),
      dtFirmVerMsp: DtFirmVerMsp(dtFirmVerMsp),
      dtFirmVerBT5Ap: DtFirmVerBT5Ap(dtFirmVerBT5Ap),
      dtFirmVerBT5Sdk: DtFirmVerBT5Sdk(dtFirmVerBT5Sdk),
      userIdMod: UserID(userIdMod),
      userIdRep: UserID(userIdRep),
      dateTimeMod: DateTimeMod.fromInt(dateTimeMod),
      dateTimeRep: DateTimeMod.fromInt(dateTimeRep),
    );
  }

  factory SensorDto.fromJson(Map<String, dynamic> json) {
    return SensorDto(
      dtId: json['dtId'] as int,
      dtBtRaw: json['dtBtRaw'].toString(),
      dtRpd: json['dtRpd'] as int,
      dtUom: json['dtUom'] as int,
      dtLoBat: json['dtLoBat'] as int,
      dtReprogrammable: json['dtReprogrammable'] as int,
      dtLocked: json['dtLocked'] as int,
      dtSecure: json['dtSecure'] as int,
      dtModCount: json['dtModCount'] as int,
      dtFirmVerMsp: json['dtFirmVerMsp'] as int,
      dtFirmVerBT5Ap: json['dtFirmVerBT5Ap'] as int,
      dtFirmVerBT5Sdk: json['dtFirmVerBT5Sdk'] as int,
      userIdMod: json['userIdMod'] as int,
      userIdRep: json['userIdRep'] as int,
      dateTimeMod: json['dateTimeMod'] as int,
      dateTimeRep: json['dateTimeRep'] as int,
    );
  }

  Map<String, Object?> toJson() => {
        SensorDBFields.dtId: dtId,
        SensorDBFields.dtBtRaw: dtBtRaw,
        SensorDBFields.dtRpd: dtRpd,
        SensorDBFields.dtUom: dtUom,
        SensorDBFields.dtLoBat: dtLoBat,
        SensorDBFields.dtReprogrammable: dtReprogrammable,
        SensorDBFields.dtLocked: dtLocked,
        SensorDBFields.dtSecure: dtSecure,
        SensorDBFields.dtModCount: dtModCount,
        SensorDBFields.dtFirmVerMsp: dtFirmVerMsp,
        SensorDBFields.dtFirmVerBT5Ap: dtFirmVerBT5Ap,
        SensorDBFields.dtFirmVerBT5Sdk: dtFirmVerBT5Sdk,
        SensorDBFields.userIDMod: userIdMod,
        SensorDBFields.userIDRep: userIdRep,
        SensorDBFields.dateTimeMod: dateTimeMod,
        SensorDBFields.dateTimeRep: dateTimeRep,
      };
}

class SensorDBFields {
  static const String tableName = 'Sensor';
  static const String primaryKey = 'dtId';
  static const String dtId = 'dtId';
  static const String dtBtRaw = 'dtBtRaw';
  static const String dtRpd = 'dtRpd';
  static const String dtUom = 'dtUom';
  static const String dtLoBat = 'dtLoBat';
  static const String dtReprogrammable = 'dtReprogrammable';
  static const String dtLocked = 'dtLocked';
  static const String dtSecure = 'dtSecure';
  static const String dtModCount = 'dtModCount';
  static const String dtFirmVerMsp = 'dtFirmVerMsp';
  static const String dtFirmVerBT5Ap = 'dtFirmVerBT5Ap';
  static const String dtFirmVerBT5Sdk = 'dtFirmVerBT5Sdk';
  static const String userIDMod = 'userIdMod';
  static const String userIDRep = 'userIdRep';
  static const String dateTimeMod = 'dateTimeMod';
  static const String dateTimeRep = 'dateTimeRep';
}
