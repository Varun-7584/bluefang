import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/core/mt_mixin.dart';
import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_and_fuel.freezed.dart';

@freezed
class ModelAndFuel with _$ModelAndFuel, MTMixin {
  ModelAndFuel._();
  factory ModelAndFuel(
      {required VinID9 vinId9,
      required VehModelID vehModelId,
      required VehMake vehMake,
      required VehYear vehYear,
      required Byte vehType,
      required Byte vehBody,
      required VehFuelType vehFuelType,
      required VehFuelCapacity vehFuelCapacity,
      required Byte vehOilType,
      required Byte vehOilVisc,
      required Byte vehCoolantType,
      required Byte vehAtfType,
      required VehLength vehLength,
      required VehClass vehClass,
      required ImgPath vehCustomJpg,
      required ImgPath vehStockJpg,
      required UserID userIdMod,
      required DateTimeMod dateTimeMod,
      required UserID userIdRep,
      required DateTimeMod dateTimeRep}) = _ModelAndFuel;

  factory ModelAndFuel.empty() => ModelAndFuel(
        vinId9: VinID9('0'), // Default correct vinID9
        vehModelId: VehModelID('Default'),
        vehMake: VehMake(0),
        vehYear: VehYear(01),
        vehType: Byte(0),
        vehBody: Byte(255),
        vehFuelType: VehFuelType(255),
        vehFuelCapacity: VehFuelCapacity(0),
        vehOilType: Byte(0),
        vehOilVisc: Byte(0),
        vehCoolantType: Byte(0),
        vehAtfType: Byte(0),
        vehLength: VehLength(0),
        vehClass: VehClass(1),
        vehCustomJpg: ImgPath('/assets/images/VehicleStockImages/0.JPG'),
        vehStockJpg: ImgPath('/assets/images/VehicleStockImages/0.JPG'),
        userIdMod: UserID(0),
        dateTimeMod: DateTimeMod(DateTime.now()),
        userIdRep: UserID(0),
        dateTimeRep: DateTimeMod(DateTime.now()),
      );
  @override
  List<Object> get mtTracked => [
        "MF_vehFuelType,MF_vehFuelCapacity,MF_vehOilType,MF_vehOilVisc,MF_vehCoolantType,MF_vehAtfType,"
  ];
  
  /// Converts the current ModelAndFuel object to JSON. 
  /// 
  /// If any of the values are invalid, the method will throw an error and stop. 
  @override
  Map<String, Object?> toJson() => {
        'MF_vinId9': vinId9.getOrCrash(),
        'MF_vehModelId': vehModelId.getOrCrash(),
        'MF_vehMake': vehMake.getOrCrash(),
        'MF_vehYear': vehYear.getOrCrash(),
        'MF_vehType': vehType.getOrCrash(),
        'MF_vehBody': vehBody.getOrCrash(),
        'MF_vehFuelType': vehFuelType.getOrCrash(),
        'MF_vehFuelCapacity': vehFuelCapacity.getOrCrash(),
        'MF_vehOilType': vehOilType.getOrCrash(),
        'MF_vehOilVisc': vehOilVisc.getOrCrash(),
        'MF_vehCoolantType': vehCoolantType.getOrCrash(),
        'MF_vehAtfType': vehAtfType.getOrCrash(),
        'MF_vehLength': vehLength.getOrCrash(),
        'MF_vehClass': vehLength.getOrCrash(),
        'MF_vehCustomJpg': vehCustomJpg.getOrCrash(),
        'MF_vehStockJpg': vehStockJpg.getOrCrash(),
        'MF_userIdMod': userIdMod.getOrCrash(),
        'MF_dateTimeMod': dateTimeMod.getOrCrash(),
        'MF_userIdRep': userIdRep.getOrCrash(),
        'MF_dateTimeRep': dateTimeRep.getOrCrash(),
      };

  /// Creates a new ModelAndFuel object from a map representing a JSON string. 
  /// 
  /// Cannot handle any of the JSON fields having incorrect types. 
  factory ModelAndFuel.fromJson(Map<String, dynamic> json) {
    return ModelAndFuel(
      vinId9: VinID9(json['MF_vinId9'] as String),
      vehModelId: VehModelID(json['MF_vehModelId'] as String),
      vehMake: VehMake(json['MF_vehMake'] as int),
      vehYear: VehYear(json['MF_vehYear'] as int),
      vehType: Byte(json['MF_vehType'] as int),
      vehBody: Byte(json['MF_vehBody'] as int),
      vehFuelType: VehFuelType(json['MF_vehFuelType'] as int),
      vehFuelCapacity: VehFuelCapacity(json['MF_vehFuelCapacity'] as int),
      vehOilType: Byte(json['MF_vehOilType'] as int),
      vehOilVisc: Byte(json['MF_vehOilVisc'] as int),
      vehCoolantType: Byte(json['MF_vehCoolantType'] as int),
      vehAtfType: Byte(json['MF_vehAtfType'] as int),
      vehLength: VehLength(json['MF_vehLength'] as double),
      vehClass: VehClass(json['MF_vehClass'] as int),
      vehCustomJpg: ImgPath(json['MF_vehCustomJpg'] as String),
      vehStockJpg: ImgPath(json['MF_vehStockJpg'] as String),
      userIdMod: UserID(json['Veh_userIdMod'] as int),
      dateTimeMod: DateTimeMod.fromInt(json['Veh_dateTimeMod'] as int),
      userIdRep: UserID(json['Veh_userIdRep'] as int),
      dateTimeRep: DateTimeMod.fromInt(json['Veh_dateTimeRep'] as int),
    );
  }

  Option<ValueFailure<dynamic>> get failureOption {
    return vinId9.failureOrUnit
        .andThen(vehModelId.failureOrUnit)
        .andThen(vehMake.failureOrUnit)
        .andThen(vehYear.failureOrUnit)
        .andThen(vehType.failureOrUnit)
        .andThen(vehBody.failureOrUnit)
        .andThen(vehFuelType.failureOrUnit)
        .andThen(vehFuelCapacity.failureOrUnit)
        .andThen(vehOilType.failureOrUnit)
        .andThen(vehOilVisc.failureOrUnit)
        .andThen(vehCoolantType.failureOrUnit)
        .andThen(vehAtfType.failureOrUnit)
        .andThen(vehLength.failureOrUnit)
        .andThen(vehClass.failureOrUnit)
        .andThen(vehCustomJpg.failureOrUnit)
        .andThen(vehStockJpg.failureOrUnit)
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
