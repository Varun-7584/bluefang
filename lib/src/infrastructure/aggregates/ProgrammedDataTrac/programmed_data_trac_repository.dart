// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/i_program_datatrac_repo.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac_failures.dart';
import 'package:bluefang/src/domain/distance/i_distance_repository.dart';
import 'package:bluefang/src/domain/modelandfuel/i_modelandfuel_repository.dart';
import 'package:bluefang/src/domain/sensor/i_sensor_repository.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/domain/site/i_site_repository.dart';
import 'package:bluefang/src/domain/vehicle/i_vehicle_repository.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_transformers.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
// ignore: implementation_imports
import 'package:kt_dart/src/collection/kt_list.dart';

@LazySingleton(as: IProgrammedDataTracRepository)
class ProgammedDataTracRepository implements IProgrammedDataTracRepository {
  final IVehicleRepository _vehicleRepository;
  final ISensorRepository _sensorRepository;
  final ISiteRepository _siteRepository;
  final IModelAndFuelRepository _modelAndFuelRepository;
  final IDistanceRepository _distanceRepository;

  ProgammedDataTracRepository(
    this._distanceRepository,
    this._modelAndFuelRepository,
    this._sensorRepository,
    this._siteRepository,
    this._vehicleRepository,
  );

  @override
  Future<Either<ProgrammedDataTracFailure, Unit>> add(
      {required ProgrammedDataTrac programmedDataTrac}) async {
    try {
      final vehicleResult = await _vehicleRepository.add(vehicle: programmedDataTrac.vehicle);
      final sensorResult = await _sensorRepository.add(sensor: programmedDataTrac.sensor);
      final siteResult = await _siteRepository.add(site: programmedDataTrac.site);
      final modelResult = await _modelAndFuelRepository.add(
          modelAndFuel: programmedDataTrac.modelAndFuel);
      final distanceResult = await _distanceRepository.add(distance: programmedDataTrac.distance);

      if (vehicleResult.isLeft()){
        return left(ProgrammedDataTracFailure.databaseError(err: vehicleResult));
      } 
      else if (sensorResult.isLeft()){
        return left(ProgrammedDataTracFailure.databaseError(err: sensorResult));
      }
      else if (siteResult.isLeft()){
        return left(ProgrammedDataTracFailure.databaseError(err: siteResult));
      }
      else if (modelResult.isLeft()){
        return left(ProgrammedDataTracFailure.databaseError(err: modelResult));
      }
      else if (distanceResult.isLeft()){
        return left(ProgrammedDataTracFailure.databaseError(err: distanceResult));
      }

      return right(unit);
    } catch (err) {
      return left(ProgrammedDataTracFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<ProgrammedDataTracFailure, Unit>> delete(
      {required DtID dtID}) async {
    try {
      final vehicleResult = await _vehicleRepository.delete(dtID: dtID);
      final sensorResult = await _sensorRepository.delete(dtID: dtID);
      final distanceResult = await _distanceRepository.delete(dtID: dtID);
      if (vehicleResult.isRight() && sensorResult.isRight() && distanceResult.isRight()){
        return right(unit);
      }
      else if (vehicleResult.isLeft()){
        return left(ProgrammedDataTracFailure.databaseError(err: vehicleResult.getOrElse(() => unit)));
      }
      else if (sensorResult.isLeft()){
        return left(ProgrammedDataTracFailure.databaseError(err: sensorResult.getOrElse(() => unit)));
      }
      else if (distanceResult.isLeft()){
        return left(ProgrammedDataTracFailure.databaseError(err: distanceResult.getOrElse(() => unit)));
      }
      else {
        return left(const ProgrammedDataTracFailure.databaseError(err: "Failed to delete data trac for unknown reasons."));
      }
    } catch (err) {
      return left(ProgrammedDataTracFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<ProgrammedDataTracFailure, ProgrammedDataTrac>> find(
      {required DtID dtID}) async {
    try {
      // Vehicle
      final vehicleResult = await _vehicleRepository.find(dtID: dtID);

      final vehicle =
          vehicleResult.getOrElse(() => throw 'Error finding vehicle');

      // Sensor
      final sensorResult = await _sensorRepository.find(dtID: dtID);
      final sensor = sensorResult
          .getOrElse(() => throw Error.safeToString('Error Finding Sensor'));
      // Distance
      final distanceResult = await _distanceRepository.find(dtID: dtID);
      final distance =
          distanceResult.getOrElse(() => throw 'Error finding distance');
      // Model and Fuel
      final modelAndFuelResult =
          await _modelAndFuelRepository.find(vinID9: getVinID9(vehicle.vinId));
      final modelAndFuel = modelAndFuelResult
          .getOrElse(() => throw 'Error finding modelAndFuel');
      // Site
      final siteResult = await _siteRepository.find(siteID: vehicle.siteId);
      final site = siteResult.getOrElse(() => throw 'Error finding site');

      final progammedDataTrac = ProgrammedDataTrac(
          vehicle: vehicle,
          sensor: sensor,
          site: site,
          distance: distance,
          modelAndFuel: modelAndFuel);
      return right(progammedDataTrac);
    } catch (err) {
      return left(ProgrammedDataTracFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<ProgrammedDataTracFailure, Unit>> update(
      {required ProgrammedDataTrac programmedDataTrac}) async {
    try {
      final vehicleResult = await _vehicleRepository.update(vehicle: programmedDataTrac.vehicle);
      final sensorResult = await _sensorRepository.update(sensor: programmedDataTrac.sensor);
      final siteResult = await _siteRepository.update(site: programmedDataTrac.site);
      final modelResult = await _modelAndFuelRepository.update(
          modelAndFuel: programmedDataTrac.modelAndFuel);
      final distanceResult = await _distanceRepository.update(distance: programmedDataTrac.distance);
      if (vehicleResult.isLeft()){
        return left(ProgrammedDataTracFailure.databaseError(err: vehicleResult));
      } 
      else if (sensorResult.isLeft()){
        return left(ProgrammedDataTracFailure.databaseError(err: sensorResult));
      }
      else if (siteResult.isLeft()){
        return left(ProgrammedDataTracFailure.databaseError(err: siteResult));
      }
      else if (modelResult.isLeft()){
        return left(ProgrammedDataTracFailure.databaseError(err: modelResult));
      }
      else if (distanceResult.isLeft()){
        return left(ProgrammedDataTracFailure.databaseError(err: distanceResult));
      }
      return right(unit);
    } catch (err) {
      log("Database error programming datatrac: $err");
      return left(ProgrammedDataTracFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<ProgrammedDataTracFailure, KtList<ProgrammedDataTrac>>>
      findAll() async {
    throw UnimplementedError();
  }

  @override
  Future<Either<ProgrammedDataTracFailure, Unit>> upsert() async {
    try {
      return right(unit);
    }
    catch (err){
      return left(ProgrammedDataTracFailure.databaseError(err: err));
    }

  }
}
