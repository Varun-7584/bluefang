import 'package:bluefang/package/bit_manipulation/bit_manipulation.dart';
import 'package:bluefang/src/domain/core/mt_mixin.dart';
import 'package:bluefang/src/infrastructure/sensor/sensor_dtos.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sensor_mt_dtos.freezed.dart';

@freezed
class MTSensorDto with _$MTSensorDto, MTMixin {
  MTSensorDto._();
  factory MTSensorDto({
    required int dtId,
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
    required int dateTimeMod,
  }) = _MTSensorDto;

  factory MTSensorDto.fromHex(
      {required String hex, required int userIdMod, required int dateTimeMod}) {
    final String seventhByteHex = hex.substring(14, 16);
    final eleventhByteHex = hex.substring(22, 24);
    final String seventhByte = BitManipulation.hexToBinary(seventhByteHex);
    final String eleventhByte = BitManipulation.hexToBinary(eleventhByteHex);

    return MTSensorDto(
      dtId: int.parse(hex.substring(4, 12),
          radix:
              16), // Here we are getting values for 2-5 Bytes. Which in hex is from [4, 12)
      dtRpd: int.parse(hex.substring(18, 21),
          radix:
              16), // Similar to the one above we are extracting the bits. See the Standard Beacon Documentation for more information on the bytes.
      dtUom: int.parse(seventhByte.substring(6, 8),
          radix:
              2), // Here we are extracting the last 2 bits of the seventh byte
      dtLoBat: int.parse(seventhByte.substring(5, 6), radix: 2),
      dtReprogrammable: int.parse(seventhByte.substring(2, 3), radix: 2),
      dtLocked: int.parse(seventhByte.substring(3, 4), radix: 2),
      dtSecure: int.parse(seventhByte.substring(4, 5), radix: 2),
      dtModCount: int.parse(
        hex.substring(16, 18),
        radix: 16,
      ),
      dtFirmVerMsp: int.parse(hex.substring(40, 41), radix: 16),
      dtFirmVerBT5Ap: int.parse(hex.substring(21, 22), radix: 16),
      dtFirmVerBT5Sdk: int.parse(eleventhByte.substring(0, 3), radix: 2),
      userIdMod: userIdMod,
      dateTimeMod: dateTimeMod,
    );
  }

  factory MTSensorDto.fromJson(Map<String, Object?> json) {
    return MTSensorDto(
      dtId: int.parse(json["dtId"].toString()),
      dtRpd: int.parse(json["dtRpd"].toString()),
      dtUom: int.parse(json["dtUom"].toString()),
      dtLoBat: int.parse(json["dtLoBat"].toString()),
      dtReprogrammable: int.parse(json["dtReprogrammable"].toString()),
      dtLocked: int.parse(json["dtLocked"].toString()),
      dtSecure: int.parse(json["dtSecure"].toString()),
      dtModCount: int.parse(json["dtModCount"].toString()),
      dtFirmVerMsp: int.parse(json["dtFirmVerMsp"].toString()),
      dtFirmVerBT5Ap: int.parse(json["dtFirmVerBT5Ap"].toString()),
      dtFirmVerBT5Sdk: int.parse(json["dtFirmVerBT5Sdk"].toString()),
      userIdMod: 10,
      dateTimeMod: DateTime.now().millisecondsSinceEpoch,
    );
  }
  @override
  List<Object> get mtTracked => toJson().keys.toList();

  @override
  Map<String, Object?> toJson() => {
        SensorDBFields.dtId: dtId,
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
        SensorDBFields.dateTimeMod: dateTimeMod
      };
}
