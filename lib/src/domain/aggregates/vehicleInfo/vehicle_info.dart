// Data needed to present
// Vehicle Number
// Vehicle Icons
// Vehicle Miles
// Vehicle Model
import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'vehicle_info.freezed.dart';

@freezed
class VehicleInfo with _$VehicleInfo {
  const VehicleInfo._();
  const factory VehicleInfo({
    required VehID vehId,
    required DtID dtId,
    required VinID9 vinId9,
    required ImgPath vehCustomJpg,
    required ImgPath vehStockJpg,
    required DtLifeMiles dtLifeMiles,
    required DtUOM dtUom,
    required VehModelID vehModel,
    required Byte vehType,
    required String vehName,
    required VehYear vehYear,
    required DateTimeMod sensorLastUpdated,
    required DateTimeMod sensorLastRead,
  }) = _VehicleInfo;

  Option<ValueFailure<dynamic>> get failureOption {
    return vehId.failureOrUnit
        .andThen(dtId.failureOrUnit)
        .andThen(vinId9.failureOrUnit)
        .andThen(vehCustomJpg.failureOrUnit)
        .andThen(vehStockJpg.failureOrUnit)
        .andThen(dtLifeMiles.failureOrUnit)
        .andThen(dtUom.failureOrUnit)
        .andThen(vehModel.failureOrUnit)
        .andThen(vehType.failureOrUnit)
        .andThen(vehYear.failureOrUnit)
        .andThen(sensorLastUpdated.failureOrUnit)
        .andThen(sensorLastRead.failureOrUnit)
        .fold((f) => some(f), (r) => none());
  }
}
