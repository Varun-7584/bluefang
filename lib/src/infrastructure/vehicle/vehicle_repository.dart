import 'dart:developer';

import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/domain/vehicle/i_vehicle_repository.dart';
import 'package:bluefang/src/domain/vehicle/vehicle.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_failure.dart';
import 'package:bluefang/src/infrastructure/core/repository/i_cache.dart';
import 'package:bluefang/src/infrastructure/vehicle/vehicle_dtos.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton(as: IVehicleRepository)
class VehicleRepository implements IVehicleRepository {
  final ICache _localRepository;
  VehicleRepository(this._localRepository);

  @override
  Future<Either<VehicleFailure, dynamic>> add(
      {required Vehicle vehicle, bool commit = true}) async {
    try {
      
      log("Vehicle added to database: $vehicle");
      final vehicleDto = VehicleDto.fromDomain(vehicle);
      log("Vehicle DTO: $vehicleDto");
      final result = await _localRepository.insert(
          VehicleDBFields.tableName, vehicleDto.toJson(),
          commit: commit,
          conflictAlgorithm: ConflictAlgorithm.replace
      );
      final returnResult = result?.fold((l) => throw l, (r) => r);
      //log("Result: $returnResult");
      return right(returnResult);
    } catch (err) {
      log("Error adding vehicle to database: $err", name: "vehicle_repository.dart");
      return left(VehicleFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<VehicleFailure, Vehicle>> find({required DtID dtID}) async {
    try {
      final result = await _localRepository.query(
        VehicleDBFields.tableName,
        where: "${VehicleDBFields.dtId} = ?",
        whereArgs: [dtID.getOrCrash()],
      );
      final value = result.getOrElse(() => throw 'Error Getting Vehicle Value');
      final Vehicle vehicle = VehicleDto.fromJson(value[0]).toDomain();

      return right(vehicle);
    } catch (err) {
      log("Error finding vehicle in database: $err", name: "vehicle_repository.dart");
      return left(VehicleFailure.databaseError(err: err));
    }
  }

  @override
  /// Update the database entry for that specific vehicle. 
  /// 
  /// Will not insert if the vehicle doesn't already exist. 
  Future<Either<VehicleFailure, Unit>> update(
      {required Vehicle vehicle}) async {
    try {
      if (vehicle.vinId.getOrCrash().length == 1){
        log("VIN was 0; calculating fake VIN.", name: "vehicle_repository.dart");
      }
      final vehicleDto = VehicleDto.fromDomain(vehicle);
      final result = await _localRepository.update(
          VehicleDBFields.tableName, vehicleDto.toJson(),
          where: "${VehicleDBFields.dtId} = ?",
          whereArgs: [vehicleDto.dtId]
      );
      log(result.toString());
      //If there was an error, return the failure
      if (result?.isLeft() ?? true){
        return left(VehicleFailure.databaseError(err: result));
      }
      return right(unit);
    } catch (err) {
      log("Error updating vehicle in database: $err", name: "vehicle_repository.dart");
      return left(VehicleFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<VehicleFailure, Unit>> delete({required DtID dtID}) async {
    try {
      final deletionResult = await _localRepository.delete(
        VehicleDBFields.tableName,
        where: "${VehicleDBFields.dtId} = ?",
        whereArgs: [dtID.getOrCrash()],
      );
      return deletionResult?.fold((l) => left(VehicleFailure.databaseError(err: l)), (r) => right(unit)) ?? right(unit);
    } catch (err) {
      log("Error deleting vehicle from database: $err", name: "vehicle_repository.dart");
      return left(VehicleFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<VehicleFailure, KtList<Vehicle>>> fetchAll() async {
    try {
      final result = await _localRepository.query(VehicleDBFields.tableName);

      final list = result
          .map((jsonList) => jsonList.map((json) {
                final veh = VehicleDto.fromJson(json).toDomain();
                return veh;
              }).toImmutableList())
          .getOrElse(() {
            log("Error mapping vehicles to list. ", name: "vehicle_repository.dart");
        return throw 'Error while mapping to list';
      });

      return right(list);
    } catch (err) {
      log("Error getting vehicles from database: $err", name: "vehicle_repository.dart");
      return left(VehicleFailure.databaseError(err: err));
    }
  }
}
