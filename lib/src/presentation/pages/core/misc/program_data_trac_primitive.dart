import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac.dart';
import 'package:bluefang/src/domain/distance/distance.dart';
import 'package:bluefang/src/domain/modelandfuel/model_and_fuel.dart';
import 'package:bluefang/src/domain/sensor/sensor.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/domain/site/site.dart';
import 'package:bluefang/src/domain/vehicle/vehicle.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'program_data_trac_primitive.freezed.dart';

class FormProgramDT extends ValueNotifier<ProgramDTPrimitive> {
  FormProgramDT() : super(ProgramDTPrimitive.empty());
}

@freezed
class ProgramDTPrimitive with _$ProgramDTPrimitive {
  const ProgramDTPrimitive._();

  const factory ProgramDTPrimitive({
    required String vehicleNumber,
    required String vinId,
    required int vehicleYear,
    required int vehicleRevPerDistance,
    required String vehicleLicensePlate,
    required int vehDistance,
    required int vehDistanceUnits,
    required int siteId,
  }) = _ProgramDTPrimitive;

  factory ProgramDTPrimitive.empty() => const ProgramDTPrimitive(
      vehicleNumber: '',
      vehicleYear: 0,
      vehicleRevPerDistance: 0,
      vehicleLicensePlate: '',
      vehDistance: 0,
      vehDistanceUnits: 0,
      vinId: '',
      siteId: 0);

  factory ProgramDTPrimitive.fromDomain(ProgrammedDataTrac programmedDataTrac) {
    return ProgramDTPrimitive(
      vinId: programmedDataTrac.vehicle.vinId.getOrCrash(),
      vehicleNumber: programmedDataTrac.vehicle.vehId.getOrCrash(),
      vehicleYear: programmedDataTrac.modelAndFuel.vehYear.getOrCrash(),
      vehicleRevPerDistance: programmedDataTrac.sensor.dtRpd.getOrCrash(),
      vehicleLicensePlate: programmedDataTrac.vehicle.vehPlateId.getOrCrash(),
      vehDistance: programmedDataTrac.distance.dtLifeMiles.getOrCrash(),
      vehDistanceUnits: programmedDataTrac.sensor.dtUom.getOrCrash(),
      siteId: programmedDataTrac.site.siteId.getOrCrash(),
    );
  }

  ProgrammedDataTrac toDomain() {
    return ProgrammedDataTrac(
        vehicle: Vehicle.empty().copyWith(
            vehId: VehID(vehicleNumber),
            vehPlateId: VehPlateID(vehicleLicensePlate)),
        sensor: Sensor.none().copyWith(dtUom: DtUOM(vehDistanceUnits)),
        site: Site.empty(),
        distance:
            Distance.empty().copyWith(dtLifeMiles: DtLifeMiles(vehDistance)),
        modelAndFuel:
            ModelAndFuel.empty().copyWith(vehYear: VehYear(vehicleYear)));
  }
}
