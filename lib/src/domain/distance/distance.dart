import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/core/mt_mixin.dart';
import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'distance.freezed.dart';

@freezed
class Distance with _$Distance, MTMixin {
  Distance._();

  factory Distance({
    required DtID dtId,
    required DtLifeMiles dtLifeMiles,
    required GpsLon gpsLon,
    required GpsLat gpsLat,
    required UserID userIdMod,
    required DateTimeMod dateTimeMod,
    required UserID userIdRep,
    required DateTimeMod dateTimeRep,
  }) = _Distance;

  /// Creates an empty object of type Distance and fills it with default values.
  factory Distance.empty() => Distance(
        dtId: DtID(0),
        dtLifeMiles: DtLifeMiles(0),
        gpsLon: GpsLon(0),
        gpsLat: GpsLat(0),
        userIdMod: UserID(0),
        dateTimeMod: DateTimeMod.now(),
        userIdRep: UserID(0),
        dateTimeRep: DateTimeMod.now(),
      );

  @override
  // TODO: implement mtTracked
  List<Object> get mtTracked => ["Distance_dtLifeMiles"];

  /// Creates a json object to represent this Distance object and returns it as a Map<String, dynamic>.
  ///
  /// Throws errors if any of the values are invalid.
  @override
  Map<String, Object?> toJson() => {
        'Distance_dtId': dtId.getOrCrash(),
        'Distance_dtLifeMiles': dtLifeMiles.getOrCrash(),
        'Distance_gpsLon': gpsLon.getOrCrash(),
        'Distance_gpsLat': gpsLat.getOrCrash(),
        'Distance_userIdMod': userIdMod.getOrCrash(),
        'Distance_dateTimeMod': dateTimeMod.getOrCrash(),
      };

  /// Takes a map representation of a json object and returns a Distance object.
  ///
  /// Currently cannot handle the json object being null or any of the values being null.
  factory Distance.fromJson(Map<String, dynamic> json) {
    return Distance(
      dtId: DtID(json['Distance_dtId'] as int),
      dtLifeMiles: DtLifeMiles('Distance_dtLifeMiles' as int),
      gpsLon: GpsLon(json['Distance_gpsLon'] as double),
      gpsLat: GpsLat(json['Distance_gpsLat'] as double),
      userIdMod: UserID(json['Distance_userIdMod'] as int),
      dateTimeMod: DateTimeMod.fromInt(json['Distance_dateTimeMod'] as int),
      userIdRep: UserID(json['Distance_userIdRep'] as int),
      dateTimeRep: DateTimeMod.fromInt(json['Distance_dateTimeRep'] as int),
    );
  }

  Option<ValueFailure<dynamic>> get failureOption {
    return dtId.failureOrUnit
        .andThen(dtLifeMiles.failureOrUnit)
        .andThen(gpsLat.failureOrUnit)
        .andThen(gpsLon.failureOrUnit)
        .andThen(userIdMod.failureOrUnit)
        .andThen(dateTimeMod.failureOrUnit)
        .andThen(userIdRep.failureOrUnit)
        .andThen(dateTimeRep.failureOrUnit)
        .fold(
          (f) => some(f),
          (r) => none(),
        );
  }
}
