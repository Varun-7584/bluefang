import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/domain/modelandfuel/model_and_fuel.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'modelandfuel_dtos.freezed.dart';

@freezed
class ModelAndFuelDto with _$ModelAndFuelDto {
  const ModelAndFuelDto._();

  const factory ModelAndFuelDto({
    required String vinId9,
    required String vehModelId,
    required int vehMake,
    required int vehYear,
    required int vehType,
    required int vehBody,
    required int vehFuelType,
    required int vehFuelCapacity,
    required int vehOilType,
    required int vehOilVisc,
    required int vehCoolantType,
    required int vehAtfType,
    required double vehLength,
    required int vehClass,
    required String vehCustomJpg,
    required String vehStockJpg,
    required int userIdMod,
    required int dateTimeMod,
    required int userIdRep,
    required int dateTimeRep,
  }) = _ModelAndFuelDto;

  factory ModelAndFuelDto.fromDomain(ModelAndFuel modelAndFuel) {
    return ModelAndFuelDto(
      vinId9: modelAndFuel.vinId9.getOrCrash(),
      vehModelId: modelAndFuel.vehModelId.getOrCrash(),
      vehMake: modelAndFuel.vehMake.getOrCrash(),
      vehYear: modelAndFuel.vehYear.getOrCrash(),
      vehType: modelAndFuel.vehType.getOrCrash(),
      vehBody: modelAndFuel.vehBody.getOrCrash(),
      vehFuelType: modelAndFuel.vehFuelType.getOrCrash(),
      vehFuelCapacity: modelAndFuel.vehFuelCapacity.getOrCrash(),
      vehOilType: modelAndFuel.vehOilType.getOrCrash(),
      vehOilVisc: modelAndFuel.vehOilVisc.getOrCrash(),
      vehCoolantType: modelAndFuel.vehCoolantType.getOrCrash(),
      vehAtfType: modelAndFuel.vehAtfType.getOrCrash(),
      vehLength: modelAndFuel.vehLength.getOrCrash(),
      vehClass: modelAndFuel.vehClass.getOrCrash(),
      vehCustomJpg: modelAndFuel.vehCustomJpg.value.fold((l) => "0", (r) => r),
      vehStockJpg: modelAndFuel.vehStockJpg.value.fold((l) => "0", (r) => r),
      userIdMod: modelAndFuel.userIdMod.getOrCrash(),
      dateTimeMod: modelAndFuel.dateTimeMod.getOrCrash(),
      userIdRep: modelAndFuel.userIdRep.getOrCrash(),
      dateTimeRep: modelAndFuel.dateTimeRep.getOrCrash(),
    );
  }

  ModelAndFuel toDomain() {
    return ModelAndFuel(
      vinId9: VinID9(vinId9),
      vehModelId: VehModelID(vehModelId),
      vehMake: VehMake(vehMake),
      vehYear: VehYear(vehYear),
      vehType: Byte(vehType),
      vehBody: Byte(vehBody),
      vehFuelType: VehFuelType(vehFuelType),
      vehFuelCapacity: VehFuelCapacity(vehFuelCapacity),
      vehOilType: Byte(vehOilType),
      vehOilVisc: Byte(vehOilVisc),
      vehCoolantType: Byte(vehCoolantType),
      vehAtfType: Byte(vehAtfType),
      vehLength: VehLength(vehLength),
      vehClass: VehClass(vehClass),
      vehCustomJpg: ImgPath(vehCustomJpg),
      vehStockJpg: ImgPath(vehStockJpg),
      userIdMod: UserID(userIdMod),
      dateTimeMod: DateTimeMod.fromInt(dateTimeMod),
      userIdRep: UserID(userIdRep),
      dateTimeRep: DateTimeMod.fromInt(dateTimeRep),
    );
  }

  factory ModelAndFuelDto.fromJson(Map<String, dynamic> json) {
    try {
      return ModelAndFuelDto(
        vinId9: json['vinId9'].toString(),
        vehModelId: json['vehModelId'].toString(),
        vehMake: json['vehMake'] as int,
        vehYear: json['vehYear'] as int,
        vehType: json['vehType'] as int,
        vehBody: json['vehBody'] as int,
        vehFuelCapacity: json['vehFuelCapacity'] as int,
        vehOilType: json['vehOilType'] as int,
        vehOilVisc: json['vehOilVisc'] as int,
        vehCoolantType: json['vehCoolantType'] as int,
        vehAtfType: json['vehAtfType'] as int,
        vehLength: json['vehLength'] as double,
        vehClass: json['vehClass'] as int,
        vehCustomJpg: json['vehCustomJpg'].toString(),
        vehStockJpg: json['vehStockJpg'].toString(),
        userIdMod: json['userIdMod'] as int,
        dateTimeMod: json['dateTimeMod'] as int,
        userIdRep: json['userIdRep'] as int,
        dateTimeRep: json['dateTimeRep'] as int,
        vehFuelType: json['vehFuelType'] as int,
      );
    } catch (err) {
      throw '$err';
    }
  }

  Map<String, Object?> toJson() => {
        ModelAndFuelDBFields.vinId9: vinId9,
        'vehModelId': vehModelId,
        'vehMake': vehMake,
        'vehYear': vehYear,
        'vehType': vehType,
        'vehBody': vehBody,
        'vehFuelType': vehFuelType,
        'vehFuelCapacity': vehFuelCapacity,
        'vehOilType': vehOilType,
        'vehOilVisc': vehOilVisc,
        'vehCoolantType': vehCoolantType,
        'vehAtfType': vehAtfType,
        'vehLength': vehLength,
        'vehClass': vehClass,
        'vehCustomJpg': vehCustomJpg,
        'vehStockJpg': vehStockJpg,
        'userIdMod': userIdMod,
        'dateTimeMod': dateTimeMod,
        'userIdRep': userIdRep,
        'dateTimeRep': dateTimeRep,
      };
}

class VehCustomJpg {
}

class ModelAndFuelDBFields {
  static const tableName = 'Model_n_Fuel';
  static const primaryKey = vinId9;
  static const vinId9 = "vinId9";
  static const vehModelID = "vehModelId";
  static const vehMake = "vehMake";
  static const vehYear = "vehYear";
  static const vehType = "vehType";
  static const vehBody = "vehBody";
  static const vehFuelType = "vehFuelType";
  static const vehFuelCapacity = "vehFuelCapacity";
  static const vehOilType = "vehOilType";
  static const vehOilVisc = "vehOilVisc";
  static const vehCoolantType = "vehCoolantType";
  static const vehAtfType = "vehAtfType";
  static const vehLength = "vehLength";
  static const vehClass = "vehClass";
  static const vehCustomJpg = "vehCustomJpg";
  static const vehStockJpg = "vehStockJpg";
  static const userIDMod = 'userIDMod';
  static const dateTimeMod = 'dateTimeMod';
  static const userIDRep = 'userIDRep';
  static const dateTimeRep = 'dateTimeRep';
}
