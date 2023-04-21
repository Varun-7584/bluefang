import 'package:bluefang/package/bit_manipulation/bit_manipulation.dart';
import 'package:bluefang/src/domain/core/mt_changed_values.dart';
import 'package:bluefang/src/domain/core/mt_mixin.dart';
import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/domain/sensor/sensor.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/infrastructure/sensor/sensor_dtos.dart';

class MTSensor with MTMixin {
  ParseStatus status;
  String statusRPD;
  String dtBtRaw;
  DtReprogrammable dtReprogrammable;
  DtLocked dtLocked;
  DtSecure dtSecure;
  DtLoBat dtLoBat;
  DtUOM dtUom;
  DtModCount dtModCount;
  DtRPD dtRpd;
  DtFirmVerMsp dtFirmVerMsp;
  DtFirmVerBT5Ap dtFirmVerBT5Ap;
  DtFirmVerBT5Sdk dtFirmVerBT5Sdk;
  UserID userIdMod;
  DateTimeMod dateTimeMod;

  MTSensor._({
    required this.status,
    required this.statusRPD,
    required this.dtBtRaw,
    required this.dtReprogrammable,
    required this.dtLocked,
    required this.dtSecure,
    required this.dtLoBat,
    required this.dtUom,
    required this.dtModCount,
    required this.dtRpd,
    required this.dtFirmVerMsp,
    required this.dtFirmVerBT5Ap,
    required this.dtFirmVerBT5Sdk,
    required this.userIdMod,
    required this.dateTimeMod,
  });

  factory MTSensor.incoming(Map<String, Object> json) {
    return MTSensor._(
      status: ParseStatus.unparsedBeacon,
      statusRPD: json["statusRPD"].toString(),
      dtBtRaw: json["dtBtRaw"].toString(),
      dtReprogrammable: DtReprogrammable(0),
      dtLocked: DtLocked(int.parse(json["dtLocked"].toString())),
      dtSecure: DtSecure(0),
      dtLoBat: DtLoBat(0),
      dtUom: DtUOM(0),
      dtModCount: DtModCount(0),
      dtRpd: DtRPD(int.parse(json["dtRpd"].toString())),
      dtFirmVerMsp: DtFirmVerMsp(0),
      dtFirmVerBT5Ap: DtFirmVerBT5Ap(0),
      dtFirmVerBT5Sdk: DtFirmVerBT5Sdk(0),
      userIdMod: UserID(0),
      dateTimeMod: DateTimeMod.now(),
    );
  }

  factory MTSensor.existingValuesFromDB(Sensor sensor) {
    return MTSensor._(
      status: ParseStatus.parsedBeacon,
      statusRPD: "",
      dtBtRaw: sensor.dtBtRaw,
      dtReprogrammable: sensor.dtReprogrammable,
      dtLocked: sensor.dtLocked,
      dtSecure: sensor.dtSecure,
      dtLoBat: sensor.dtLoBat,
      dtUom: sensor.dtUom,
      dtModCount: sensor.dtModCount,
      dtRpd: sensor.dtRpd,
      dtFirmVerMsp: sensor.dtFirmVerMsp,
      dtFirmVerBT5Ap: sensor.dtFirmVerBT5Ap,
      dtFirmVerBT5Sdk: sensor.dtFirmVerBT5Sdk,
      userIdMod: sensor.userIdMod,
      dateTimeMod: sensor.dateTimeMod,
    );
  }

  void _parseObject() {
    if (status == ParseStatus.unparsedBeacon) {
      final String seventhByteHex = statusRPD.substring(0, 2);
      final String eighthByteHex = statusRPD.substring(2, 4);
      final String eleventhByteHex = "${statusRPD[8]}0";
      final String eleventhByteBinary =
          BitManipulation.hexToBinary(eleventhByteHex);
      final String dtRpdHex = statusRPD.substring(4, 7);
      final String seventhByteBinary =
          BitManipulation.hexToBinary(seventhByteHex);
      final String twentyByteHex = statusRPD.substring(9, 10);

      statusRPD = statusRPD;
      dtBtRaw = dtBtRaw;
      dtRpd = DtRPD(int.parse(dtRpdHex, radix: 16));
      dtUom = DtUOM(int.parse(seventhByteBinary.substring(6, 8), radix: 2));
      dtLoBat = DtLoBat(int.parse(seventhByteBinary.substring(5, 6), radix: 2));
      dtReprogrammable = DtReprogrammable(
          int.parse(seventhByteBinary.substring(2, 3), radix: 2));
      dtLocked =
          DtLocked(int.parse(seventhByteBinary.substring(3, 4), radix: 2));
      dtSecure =
          DtSecure(int.parse(seventhByteBinary.substring(4, 5), radix: 2));
      dtModCount = DtModCount(int.parse(eighthByteHex, radix: 16));
      dtFirmVerMsp = DtFirmVerMsp(int.parse(twentyByteHex, radix: 16));
      dtFirmVerBT5Ap =
          DtFirmVerBT5Ap(int.parse(statusRPD.substring(7, 8), radix: 16));
      dtFirmVerBT5Sdk = DtFirmVerBT5Sdk(
          int.parse(eleventhByteBinary.substring(0, 3), radix: 2));
      userIdMod = userIdMod;
      dateTimeMod = dateTimeMod;
    }
  }

  MTChangedValues parseAndGetChangedValues({required MTSensor newValue}) {
    if (newValue.statusRPD != statusRPD) {
      _parseObject();
      newValue._parseObject();
      final MTChangedValues changedValues = mtChangedValues(newValue: newValue);
      return changedValues;
    } else {
      return MTChangedValues.empty();
    }
  }

  @override
  List<Object> get mtTracked => toJson().keys.toList();

  @override
  Map<String, Object?> toJson() => {
        SensorDBFields.dtRpd: dtRpd.getOrCrash(),
        SensorDBFields.dtUom: dtUom.getOrCrash(),
        SensorDBFields.dtLoBat: dtLoBat.getOrCrash(),
        SensorDBFields.dtReprogrammable: dtReprogrammable.getOrCrash(),
        SensorDBFields.dtLocked: dtLocked.getOrCrash(),
        SensorDBFields.dtSecure: dtSecure.getOrCrash(),
        SensorDBFields.dtModCount: dtModCount.getOrCrash(),
        SensorDBFields.dtFirmVerMsp: dtFirmVerMsp.getOrCrash(),
        SensorDBFields.dtFirmVerBT5Ap: dtFirmVerBT5Ap.getOrCrash(),
        SensorDBFields.dtFirmVerBT5Sdk: dtFirmVerBT5Sdk.getOrCrash(),
        SensorDBFields.userIDMod: userIdMod.getOrCrash(),
        SensorDBFields.dateTimeMod: dateTimeMod.getOrCrash(),
      };
}

enum ParseStatus { parsedBeacon, unparsedBeacon }
