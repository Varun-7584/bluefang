import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac.dart';
import 'package:bluefang/src/infrastructure/distance/distance_dtos.dart';
import 'package:bluefang/src/infrastructure/modelandfuel/modelandfuel_dtos.dart';
import 'package:bluefang/src/infrastructure/sensor/sensor_dtos.dart';
import 'package:bluefang/src/infrastructure/site/site_dtos.dart';
import 'package:bluefang/src/infrastructure/vehicle/vehicle_dtos.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'programmed_data_trac_dtos.freezed.dart';

@freezed
class ProgrammedDataTracDto with _$ProgrammedDataTracDto {
  /// Creates an object, usually used to parse database responses.
  const ProgrammedDataTracDto._();
  const factory ProgrammedDataTracDto({
    required VehicleDto vehicle,
    required SensorDto sensor,
    required ModelAndFuelDto modelAndFuel,
    required DistanceDto distance,
    required SiteDto site,
  }) = _ProgrammedDataTracDto;

  factory ProgrammedDataTracDto.fromDomain(
      ProgrammedDataTrac programmedDataTrac) {
    return ProgrammedDataTracDto(
      vehicle: VehicleDto.fromDomain(programmedDataTrac.vehicle),
      sensor: SensorDto.fromDomain(programmedDataTrac.sensor),
      modelAndFuel: ModelAndFuelDto.fromDomain(programmedDataTrac.modelAndFuel),
      distance: DistanceDto.fromDomain(programmedDataTrac.distance),
      site: SiteDto.fromDomain(programmedDataTrac.site),
    );
  }

  ProgrammedDataTrac toDomain() {
    return ProgrammedDataTrac(
      vehicle: vehicle.toDomain(),
      sensor: sensor.toDomain(),
      site: site.toDomain(),
      distance: distance.toDomain(),
      modelAndFuel: modelAndFuel.toDomain(),
    );
  }

  factory ProgrammedDataTracDto.fromJson(Map<String, dynamic> json) {
    return ProgrammedDataTracDto(
        vehicle: json['vehicle'] as VehicleDto,
        sensor: json['sensor'] as SensorDto,
        modelAndFuel: json[' modelAndFuel'] as ModelAndFuelDto,
        distance: json['distance'] as DistanceDto,
        site: json['site'] as SiteDto);
  }

  Map<String, Object?> toJson() => {
        'vehicle': vehicle.toJson(),
        'sensor': sensor.toJson(),
        'modelAndFuel': modelAndFuel.toJson(),
        'distance': distance.toJson(),
        'site': site.toJson(),
      };
}
