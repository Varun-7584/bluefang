import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/core/mt_mixin.dart';
import 'package:bluefang/src/domain/distance/distance.dart';
import 'package:bluefang/src/domain/modelandfuel/model_and_fuel.dart';
import 'package:bluefang/src/domain/sensor/sensor.dart';
import 'package:bluefang/src/domain/site/site.dart';
import 'package:bluefang/src/domain/vehicle/vehicle.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'program_datatrac.freezed.dart';

@freezed
class ProgrammedDataTrac with _$ProgrammedDataTrac, MTMixin {
  ProgrammedDataTrac._();
  factory ProgrammedDataTrac({
    required Vehicle vehicle,
    required Sensor sensor,
    required Site site,
    required Distance distance,
    required ModelAndFuel modelAndFuel,
  }) = _ProgrammedDataTrac;

  ///Creates an empty ProgrammedDataTrac. 
  ///
  ///This calls the constructors to create an empty copy of each of the objects within a programmed data trac. 
  factory ProgrammedDataTrac.empty() => ProgrammedDataTrac(
        vehicle: Vehicle.empty(),
        sensor: Sensor.empty(),
        site: Site.empty(),
        distance: Distance.empty(),
        modelAndFuel: ModelAndFuel.empty(),
      );

  @override
  List<Object> get mtTracked => [
        "Veh_vehId",
        "Veh_siteId",
        "Veh_vehPlateId",
        "Veh_vinId",
        "MF_vehFuelType",
        "MF_vehFuelCapacity",
        "sensor_dtRpd",
        "sensor_dtUom",
        "sensor_dtModCount"
      ];

  /// Takes a [ProgrammedDataTrac] and compares it to the values in this object.
  ///
  /// Returns a map of the differences between the two objects using the names of the values as keys.
  /// e. g. if vehicle.vehId is different from the passed-in datatrac's vehId, the value of the passed-in datatrac's vehId will be stored in the map under "vehId".
  Map<String, dynamic> compareToDataTrac(
      ProgrammedDataTrac programmedDataTrac2) {
    final Map<String, dynamic> differences = {};

    if (vehicle.vehId.getOrCrash() !=
        programmedDataTrac2.vehicle.vehId.getOrCrash()) {
      differences["vehId"] = programmedDataTrac2.vehicle.vehId.getOrCrash();
    }
    if (vehicle.siteId.getOrCrash() !=
        programmedDataTrac2.vehicle.siteId.getOrCrash()) {
      differences["siteId"] = programmedDataTrac2.vehicle.siteId.getOrCrash();
    }
    if (vehicle.vehPlateId.getOrCrash() !=
        programmedDataTrac2.vehicle.vehPlateId.getOrCrash()) {
      differences["vehPlateId"] =
          programmedDataTrac2.vehicle.vehPlateId.getOrCrash();
    }
    if (vehicle.vinId.getOrCrash() !=
        programmedDataTrac2.vehicle.vinId.getOrCrash()) {
      differences["vinId"] = programmedDataTrac2.vehicle.vinId.getOrCrash();
    }

    if (modelAndFuel.vehFuelType.getOrCrash() !=
        programmedDataTrac2.modelAndFuel.vehFuelType.getOrCrash()) {
      differences["vehFuelType"] =
          programmedDataTrac2.modelAndFuel.vehFuelType.getOrCrash();
    }
    if (modelAndFuel.vehFuelCapacity.getOrCrash() !=
        programmedDataTrac2.modelAndFuel.vehFuelCapacity.getOrCrash()) {
      differences["vehFuelCapacity"] =
          programmedDataTrac2.modelAndFuel.vehFuelCapacity.getOrCrash();
    }

    if (sensor.dtRpd.getOrCrash() !=
        programmedDataTrac2.sensor.dtRpd.getOrCrash()) {
      differences["dtRpd"] = programmedDataTrac2.sensor.dtRpd.getOrCrash();

      //Can't set the miles if the revs are 0 - it automatically 0s them anyways. 
      if (programmedDataTrac2.sensor.dtRpd.getOrCrash() != 0){
        // The DataTrac expects the RPD and the LifeDistance to be changed together; the app allows changing them separately, but they have to both be sent at the same time
        differences["dtLifeMiles"] = programmedDataTrac2.distance.dtLifeMiles.getOrCrash();
      }
    }
    if (sensor.dtUom.getOrCrash() !=
        programmedDataTrac2.sensor.dtUom.getOrCrash()) {
      differences["dtUom"] = programmedDataTrac2.sensor.dtUom.getOrCrash();
    }
    if (sensor.dtModCount.getOrCrash() !=
        programmedDataTrac2.sensor.dtModCount.getOrCrash()) {
      differences["dtModCount"] =
          programmedDataTrac2.sensor.dtModCount.getOrCrash();
    }

    if (distance.dtLifeMiles.getOrCrash() != programmedDataTrac2.distance.dtLifeMiles.getOrCrash()){
      differences["dtLifeMiles"] = programmedDataTrac2.distance.dtLifeMiles.getOrCrash();
      // The DataTrac expects the RPD and the LifeDistance to be changed together; the app allows changing them separately, but they have to both be sent at the same time
      //However, if the revs are 0, then miles are automatically set to 0
      if (programmedDataTrac2.sensor.dtRpd.getOrCrash() != 0){
        differences["dtRpd"] = programmedDataTrac2.sensor.dtRpd.getOrCrash();
      }
    }

    return differences;
  }

  @override
  Map<String, Object?> toJson() => {
        'vehicle': vehicle.toJson(),
        'sensor': sensor.toJson(),
        'modelAndFuel': modelAndFuel.toJson(),
        'distance': distance.toJson(),
        'site': site.toJson(),
      };

  factory ProgrammedDataTrac.fromJson(Map<String, dynamic> json) {
    return ProgrammedDataTrac(
      vehicle: Vehicle.fromJson(json),
      sensor: Sensor.fromJson(json),
      site: Site.fromJson(json),
      distance: Distance.fromJson(json),
      modelAndFuel: ModelAndFuel.fromJson(json),
    );
  }

  Option<ValueFailure<dynamic>> get failureOption {
    return sensor.failureOption
        .andThen(vehicle.failureOption)
        .andThen(site.failureOption)
        .andThen(distance.failureOption)
        .andThen(modelAndFuel.failureOption);
  }

  String formattedToString() {
    return "ProgrammedDataTrac(\n ***vehicle: $vehicle\n ***sensor: $sensor\n ***modelAndFuel: $modelAndFuel\n ***distance: $distance\n ***site: $site\n) //End ProgrammedDataTrac\n";
  }
}
