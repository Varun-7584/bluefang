import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/core/mt_mixin.dart';
import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sensor.freezed.dart';

@freezed
class Sensor with _$Sensor, MTMixin {
  static String emptyDtBtRaw = "null";
  Sensor._();
  factory Sensor({
    required DtID dtId,
    required String dtBtRaw,
    required DtIDHumanReadable dtIdHumanReadable,
    required DtRPD dtRpd,
    required DtUOM dtUom,
    required DtLoBat dtLoBat,
    required DtReprogrammable dtReprogrammable,
    required DtLocked dtLocked,
    required DtSecure dtSecure,
    required DtModCount dtModCount,
    required DtFirmVerMsp dtFirmVerMsp,
    required DtFirmVerBT5Ap dtFirmVerBT5Ap,
    required DtFirmVerBT5Sdk dtFirmVerBT5Sdk,
    required UserID userIdMod,
    required UserID userIdRep,
    required DateTimeMod dateTimeMod,
    required DateTimeMod dateTimeRep,
  }) = _Sensor;

  /// Creates a new Sensor that represents a nonexistent sensor.
  ///
  /// [dtBtRaw] is set to "null" instead of a string of 0s (which is what the `Sensor.empty()` constructor does).
  factory Sensor.none() => Sensor(
        dtId: DtID(0),
        dtBtRaw: emptyDtBtRaw,
        dtIdHumanReadable: DtIDHumanReadable(0),
        dtRpd: DtRPD(0),
        dtUom: DtUOM(0),
        dtLoBat: DtLoBat(0),
        dtReprogrammable: DtReprogrammable(0),
        dtLocked: DtLocked(0),
        dtSecure: DtSecure(0),
        dtModCount: DtModCount(0),
        dtFirmVerMsp: DtFirmVerMsp(0),
        dtFirmVerBT5Ap: DtFirmVerBT5Ap(0),
        dtFirmVerBT5Sdk: DtFirmVerBT5Sdk(0),
        userIdMod: UserID(0),
        userIdRep: UserID(0),
        dateTimeMod: DateTimeMod.defaultDate(),
        dateTimeRep: DateTimeMod.defaultDate(),
      );

  /// Creates a new, empty Sensor.
  factory Sensor.empty() => Sensor(
        dtId: DtID(0),
        dtBtRaw: "000000000000000000000000000",
        dtIdHumanReadable: DtIDHumanReadable(0),
        dtRpd: DtRPD(0),
        dtUom: DtUOM(0),
        dtLoBat: DtLoBat(0),
        dtReprogrammable: DtReprogrammable(0),
        dtLocked: DtLocked(0),
        dtSecure: DtSecure(0),
        dtModCount: DtModCount(0),
        dtFirmVerMsp: DtFirmVerMsp(0),
        dtFirmVerBT5Ap: DtFirmVerBT5Ap(0),
        dtFirmVerBT5Sdk: DtFirmVerBT5Sdk(0),
        userIdMod: UserID(0),
        userIdRep: UserID(0),
        dateTimeMod: DateTimeMod.defaultDate(),
        dateTimeRep: DateTimeMod.defaultDate(),
      );
  @override
  List<Object> get mtTracked => [
        "sensor_dtRpd,sensor_dtUom,sensor_dtLoBat,sensor_dtReprogrammable,sensor_dtLocked,sensor_dtSecure,sensor_dtModCount,sensor_dtFirmVerMsp,sensor_dtFirmVerBT5Ap,sensor_dtFirmVerBT5Sdk"
      ];

  /// Converts the current Sensor object to JSON.
  ///
  /// If any of the values are invalid, the method will throw an error and stop.
  @override
  Map<String, Object?> toJson() => {
        'sensor_dtId': dtId.getOrCrash(),
        'sensor_dtBtRaw': dtBtRaw,
        'sensor_dtIdHumanReadable': dtIdHumanReadable.getOrCrash(),
        'sensor_dtRpd': dtRpd.getOrCrash(),
        'sensor_dtUom': dtUom.getOrCrash(),
        'sensor_dtLoBat': dtLoBat.getOrCrash(),
        'sensor_dtReprogrammable': dtReprogrammable.getOrCrash(),
        'sensor_dtLocked': dtLocked.getOrCrash(),
        'sensor_dtSecure': dtSecure.getOrCrash(),
        'sensor_dtModCount': dtModCount.getOrCrash(),
        'sensor_dtFirmVerMsp': dtFirmVerMsp.getOrCrash(),
        'sensor_dtFirmVerBT5Ap': dtFirmVerBT5Ap.getOrCrash(),
        'sensor_dtFirmVerBT5Sdk': dtFirmVerBT5Sdk.getOrCrash(),
        'sensor_userIdMod': userIdMod.getOrCrash(),
        'sensor_userIdRep': userIdRep.getOrCrash(),
        'sensor_dateTimeMod': dateTimeMod.getOrCrash(),
        'sensor_dateTimeRep': dateTimeRep.getOrCrash(),
      };

  /// Takes a json map and returns a Sensor object built from it.
  ///
  /// Can handle some of the values being null, but not all.
  factory Sensor.fromJson(Map<String, dynamic> json) {
    return Sensor(
      dtId: DtID((json["sensor_dtId"] as String?) == null
          ? 0
          : int.parse(json["sensor_dtId"] as String)),
      dtBtRaw: json["sensor_dtBtRaw"].toString(),
      dtIdHumanReadable: DtIDHumanReadable(
          (json["sensor_dtId"] as String?) == null
              ? 0
              : int.parse(json["sensor_dtId"] as String)),
      dtRpd: DtRPD((json["sensor_dtRpd"] as String?) == null
          ? 0
          : int.parse(json["sensor_dtRpd"] as String)),
      dtUom: DtUOM((json["sensor_dtUom"] as String?) == null
          ? 0
          : int.parse(json["sensor_dtUom"] as String)),
      dtLoBat: DtLoBat(json['sensor_dtLoBat'] as int),
      dtReprogrammable:
          DtReprogrammable(json['sensor_dtReprogrammable'] as int),
      dtLocked: DtLocked(json['sensor_dtLocked'] as int),
      dtSecure: DtSecure(json['sensor_dtSecure'] as int),
      dtModCount: DtModCount(json['sensor_dtModCount'] as int),
      dtFirmVerMsp: DtFirmVerMsp(json['sensor_dtFirmVerMsp'] as int),
      dtFirmVerBT5Ap: DtFirmVerBT5Ap(json['sensor_dtFirmVerBT5Ap'] as int),
      dtFirmVerBT5Sdk: DtFirmVerBT5Sdk(json['sensor_dtFirmVerBT5Sdk'] as int),
      userIdMod: UserID(json['sensor_userIdMod'] as int),
      userIdRep: UserID(json['sensor_userIdRep'] as int),
      // TODO: Check how type of datetime value.
      dateTimeMod: DateTimeMod.fromInt(json['sensor_dateTimeMod'] as int),
      dateTimeRep: DateTimeMod.fromInt(json['sensor_dateTimeRep'] as int),
    );
  }

  Option<ValueFailure<dynamic>> get failureOption {
    return dateTimeMod.failureOrUnit
        .andThen(dtId.failureOrUnit)
        .andThen(dtRpd.failureOrUnit)
        .andThen(dtUom.failureOrUnit)
        .andThen(dtLoBat.failureOrUnit)
        .andThen(dtReprogrammable.failureOrUnit)
        .andThen(dtLocked.failureOrUnit)
        .andThen(dtSecure.failureOrUnit)
        .andThen(dtModCount.failureOrUnit)
        .andThen(dtFirmVerMsp.failureOrUnit)
        .andThen(dtFirmVerBT5Ap.failureOrUnit)
        .andThen(dtFirmVerBT5Sdk.failureOrUnit)
        .andThen(userIdMod.failureOrUnit)
        .andThen(userIdRep.failureOrUnit)
        .fold((f) => some(f), (_) => none());
  }
}
