import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/domain/distance/distance.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'distance_dtos.freezed.dart';

@freezed
class DistanceDto with _$DistanceDto {
  const DistanceDto._();
  const factory DistanceDto({
    required int dtId,
    required int dtLifeMiles,
    required double gpsLat,
    required double gpsLon,
    required int userIdMod,
    required int dateTimeMod,
    required int userIdRep,
    required int dateTimeRep,
  }) = _DistanceDto;

  factory DistanceDto.fromDomain(Distance distance) {
    return DistanceDto(
      dtId: distance.dtId.getOrCrash(),
      dtLifeMiles: distance.dtLifeMiles.getOrCrash(),
      userIdMod: distance.userIdMod.getOrCrash(),
      dateTimeMod: distance.dateTimeMod.getOrCrash(),
      userIdRep: distance.userIdRep.getOrCrash(),
      dateTimeRep: distance.dateTimeRep.getOrCrash(),
      gpsLat: distance.gpsLat.getOrCrash(),
      gpsLon: distance.gpsLon.getOrCrash(),
    );
  }

  Distance toDomain() {
    return Distance(
      dtId: DtID(dtId),
      dtLifeMiles: DtLifeMiles(dtLifeMiles),
      gpsLat: GpsLat(gpsLat),
      gpsLon: GpsLon(gpsLon),
      userIdMod: UserID(userIdMod),
      dateTimeMod: DateTimeMod.fromInt(dateTimeMod),
      userIdRep: UserID(userIdRep),
      dateTimeRep: DateTimeMod.fromInt(dateTimeRep),
    );
  }

  factory DistanceDto.fromJson(Map<String, dynamic> json) {
    return DistanceDto(
      dtId: json['dtId'] as int,
      dtLifeMiles: json['dtLifeMiles'] as int,
      gpsLat: json['gpsLat'] as double,
      gpsLon: json['gpsLon'] as double,
      userIdMod: json['userIdMod'] as int,
      dateTimeMod: json['dateTimeMod'] as int,
      userIdRep: json['userIdRep'] as int,
      dateTimeRep: json['dateTimeRep'] as int,
    );
  }

  Map<String, Object?> toJson() => {
        'dtId': dtId,
        'dtLifeMiles': dtLifeMiles,
        'gpsLat': gpsLat,
        'gpsLon': gpsLon,
        'userIdMod': userIdMod,
        'dateTimeMod': dateTimeMod,
        'userIdRep': userIdRep,
        'dateTimeRep': dateTimeRep,
      };
}

class DistanceDBFields {
  static const tableName = 'Distance';
  static const primaryKey = dtId;
  static const dtId = 'dtId';
  static const dtLifeMiles = 'dtLifeMiles';
  static const userIdMod = 'userIdMod';
  static const gpsLat = 'gpsLat';
  static const gpsLon = 'gpsLon';
  static const dateTimeMod = 'dateTimeMod';
  static const userIDRep = 'userIdRep';
  static const dateTimeRep = 'dateTimeRep';
}
