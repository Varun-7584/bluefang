import 'package:bluefang/src/domain/aggregates/vehicleInfo/vehicle_info.dart';
import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_info_dtos.freezed.dart';

@freezed
class VehicleInfoDto with _$VehicleInfoDto {
  const VehicleInfoDto._();
  const factory VehicleInfoDto({
    required String vehId,
    required int dtId,
    required String vinId9,
    required String vehCustomJpg,
    required String vehStockJpg,
    required int dtLifeMiles,
    required int dtUom,
    required String vehModelId,
    required int vehType,
    required String vehName,
    required int vehYear,
    required int sensorLastUpdated,
    required int sensorLastRead,
  }) = _VehicleInfoDto;

  factory VehicleInfoDto.fromDomain(VehicleInfo vehicleInfo) {
    return VehicleInfoDto(
      vehId: vehicleInfo.vehId.getOrCrash(),
      dtId: vehicleInfo.dtId.getOrCrash(),
      vinId9: vehicleInfo.vinId9.getOrCrash(),
      vehCustomJpg: vehicleInfo.vehCustomJpg.getOrCrash(),
      vehStockJpg: vehicleInfo.vehStockJpg.getOrCrash(),
      dtLifeMiles: vehicleInfo.dtLifeMiles.getOrCrash(),
      dtUom: vehicleInfo.dtUom.getOrCrash(),
      vehModelId: vehicleInfo.vehModel.getOrCrash(),
      vehType: vehicleInfo.vehType.getOrCrash(),
      vehName: vehicleInfo.vehName,
      vehYear: vehicleInfo.vehYear.getOrCrash(),
      sensorLastUpdated: vehicleInfo.sensorLastUpdated.getOrCrash(),
      sensorLastRead: vehicleInfo.sensorLastRead.getOrCrash(),
    );
  }

  VehicleInfo toDomain() {
    return VehicleInfo(
        vehId: VehID(vehId),
        dtId: DtID(dtId),
        vinId9: VinID9(vinId9),
        vehCustomJpg: ImgPath(vehCustomJpg),
        vehStockJpg: ImgPath(vehStockJpg),
        dtLifeMiles: DtLifeMiles(dtLifeMiles),
        dtUom: DtUOM(dtUom),
        vehModel: VehModelID(vehModelId),
        vehType: Byte(vehType),
        vehName: vehName,
        vehYear: VehYear(vehYear),
        sensorLastUpdated: DateTimeMod.fromInt(sensorLastUpdated),
        sensorLastRead: DateTimeMod.fromInt(sensorLastRead));
  }

  factory VehicleInfoDto.fromJson(Map<String, dynamic> json) {
    return VehicleInfoDto(
      vehId: json['vehId'].toString(),
      dtId: json['dtId'] as int,
      vinId9: json['vinId9'].toString(),
      vehCustomJpg: json['vehCustomJpg'].toString(),
      vehStockJpg: json['vehStockJpg'].toString(),
      dtLifeMiles: json['dtLifeMiles'] as int? ?? -1,
      dtUom: json['dtUom'] as int,
      vehModelId: json['vehModelId'].toString(),
      vehType: json['vehType'] as int,
      vehName: json['vehName'].toString(),
      vehYear: json['vehYear'] as int,
      sensorLastUpdated: json['dateTimeMod'] as int,
      sensorLastRead: json['dateTimeRep'] as int,
    );
  }

  Map<String, Object?> toJson() => {
        'vehId': vehId,
        'vinId9': vinId9,
        'vehCustomJpg': vehCustomJpg,
        'vehStockJpg': vehStockJpg,
        'dtLifeMiles': dtLifeMiles,
        'dtUom': dtUom,
        'vehModelId': vehModelId,
        'vehType': vehType,
        'vehName': vehName,
        'vehYear': vehYear,
        'dateTimeMod': sensorLastUpdated,
        'dateTimeRep': sensorLastRead,
      };
}
