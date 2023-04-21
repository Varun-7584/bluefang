import 'dart:developer';

import 'package:bluefang/src/domain/modelandfuel/i_modelandfuel_repository.dart';
import 'package:bluefang/src/domain/modelandfuel/model_and_fuel.dart';
import 'package:bluefang/src/domain/modelandfuel/modelandfuel_failure.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
import 'package:bluefang/src/infrastructure/core/repository/i_cache.dart';
import 'package:bluefang/src/infrastructure/modelandfuel/modelandfuel_dtos.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton(as: IModelAndFuelRepository)
class ModelAndFuelRepository implements IModelAndFuelRepository {
  final ICache _localRepository;
  ModelAndFuelRepository(this._localRepository);
  @override
  Future<Either<ModelAndFuelFailure, Unit>> add(
      {required ModelAndFuel modelAndFuel}) async {
    try {
      final modelAndFuelDto = ModelAndFuelDto.fromDomain(modelAndFuel);

      // Does not insert if the VIN9 already has an entry
      final result = await _localRepository.insert(
          ModelAndFuelDBFields.tableName, modelAndFuelDto.toJson(),
          //Ignore so new vehicles don't overwrite existing model values
          conflictAlgorithm: ConflictAlgorithm.ignore
      );
      
      //If there was an error, return the failure
      if (result?.isLeft() ?? true){
        log("Error inserting into the Model And Fuels table: $result", name: "modelandfuelrepository.dart");
        return left(ModelAndFuelFailure.databaseError(err: result));
      }
      return right(unit);
    } catch (err) {
      log("Tried to add modelAndFuel: $modelAndFuel", name: "modelandfuel_repository.dart");
      log("Error inserting model and fuel into database: $err", name: "modelandfuel_repository.dart");
      return left(ModelAndFuelFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<ModelAndFuelFailure, ModelAndFuel>> find(
      {required VinID9 vinID9}) async {
    try {
      final result = await _localRepository.query(
        ModelAndFuelDBFields.tableName,
        where: "${ModelAndFuelDBFields.primaryKey} = ?",
        whereArgs: [vinID9.getOrCrash()],
      );
      final value = result.getOrElse(() => throw 'Error Getting Vehicle Value');
      final ModelAndFuel modelAndFuel =
          ModelAndFuelDto.fromJson(value[0]).toDomain();
      return right(modelAndFuel);
    } catch (err) {
      log("Database error: $err");
      return left(ModelAndFuelFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<ModelAndFuelFailure, Unit>> update(
      {required ModelAndFuel modelAndFuel}) async {
    try {
      final modelAndFuelDto = ModelAndFuelDto.fromDomain(modelAndFuel);
      final result = await _localRepository.update(
        //Don't try to update the primary key because it causes a UNIQUE constraint violation.
        ModelAndFuelDBFields.tableName, modelAndFuelDto.toJson()..remove(ModelAndFuelDBFields.vinId9),
        where: "${ModelAndFuelDBFields.vinId9} = ?",
        whereArgs: [modelAndFuel.vinId9.getOrCrash()]
      );
      //If there was an error, return the failure
      if (result?.isLeft() ?? true){
        return left(ModelAndFuelFailure.databaseError(err: result));
      }
      return right(unit);
    } catch (err) {
      log("Tried to update modelAndFuel: $modelAndFuel", name: "modelandfuel_repository.dart");
      return left(ModelAndFuelFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<ModelAndFuelFailure, Unit>> delete(
      {required VinID9 vinID9}) async {
    try {
      await _localRepository.delete(
        ModelAndFuelDBFields.tableName,
        where: "${ModelAndFuelDBFields.primaryKey} = ?",
        whereArgs: [vinID9.getOrCrash()],
      );
      return right(unit);
    } catch (err) {
      return left(ModelAndFuelFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<ModelAndFuelFailure, KtList<ModelAndFuel>>> fetchAll() async {
    try {
      final result =
          await _localRepository.query(ModelAndFuelDBFields.tableName);

      final list = result
          .map((jsonList) => jsonList.map((json) {
                final veh = ModelAndFuelDto.fromJson(json).toDomain();
                return veh;
              }).toImmutableList())
          .getOrElse(() {
        return throw 'Error while mapping to list';
      });

      return right(list);
    } catch (err) {
      return left(ModelAndFuelFailure.databaseError(err: err));
    }
  }
}
