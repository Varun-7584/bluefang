import 'dart:developer';

import 'package:bluefang/src/domain/sensor/i_sensor_repository.dart';
import 'package:bluefang/src/domain/sensor/sensor.dart';
import 'package:bluefang/src/domain/sensor/sensor_failure.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/infrastructure/core/repository/i_cache.dart';
import 'package:bluefang/src/infrastructure/sensor/sensor_dtos.dart';
import 'package:bluefang/src/infrastructure/vehicle/vehicle_dtos.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton(as: ISensorRepository)
class SensorRepository implements ISensorRepository {
  final ICache _localRepository;

  SensorRepository(this._localRepository);

  @override
  Future<Either<SensorFailure, Unit>> add({required Sensor sensor}) async {
    try {
      final sensorDto = SensorDto.fromDomain(sensor);

      // Insert the sensor into the database; if it already exists, replace it. (It should always already exist.)
      final result = await _localRepository.insert(
        SensorDBFields.tableName, sensorDto.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      //If there was an error, return the failure
      if (result?.isLeft() ?? true){
        return left(SensorFailure.databaseError(err: result));
      }
      return right(unit);
    } catch (err) {
      log("Error inserting sensor into database: $err", name: "sensor_repository.dart");
      return left(SensorFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<SensorFailure, Sensor>> find({required DtID dtID}) async {
    try {
      final result = await _localRepository.query(
        SensorDBFields.tableName,
        where: "${SensorDBFields.primaryKey} = ?",
        whereArgs: [dtID.getOrCrash()],
      );
      final value = result.getOrElse(() => throw 'Error Getting Sensor Value');
      final Sensor sensor = SensorDto.fromJson(value[0]).toDomain();

      return right(sensor);
    } catch (err) {
      return left(SensorFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<SensorFailure, Unit>> update({required Sensor sensor}) async {
    try {
      final sensorDto = SensorDto.fromDomain(sensor);
      final result = await _localRepository.update(
        //Don't try to update the primary key, just all the other fields. Otherwise it violates the UNIQUE constraint.
        SensorDBFields.tableName, sensorDto.toJson()..remove(SensorDBFields.dtId),
        conflictAlgorithm: ConflictAlgorithm.replace,
        where: "${SensorDBFields.primaryKey} = ?",
        whereArgs: [sensor.dtId.getOrCrash()]
      );
      //If there was an error, return the failure
      if (result?.isLeft() ?? true){
        return left(SensorFailure.databaseError(err: result));
      }
      return right(unit);
    } catch (err) {
      return left(SensorFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<SensorFailure, Unit>> delete({required DtID dtID}) async {
    try {
      final deletionResult = await _localRepository.delete(
        SensorDBFields.tableName,
        where: "${SensorDBFields.primaryKey} = ?",
        whereArgs: [dtID.getOrCrash()],
      );
      return deletionResult?.isRight() ?? true ? right(unit) : left(SensorFailure.databaseError(err: deletionResult?.getOrElse(() => unit)));
    } catch (err) {
      return left(SensorFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<SensorFailure, KtList<Sensor>>> fetchAll() async {
    try {
      final result = await _localRepository.query(SensorDBFields.tableName);

      final list = result
          .map((jsonList) => jsonList.map((json) {
                final veh = SensorDto.fromJson(json).toDomain();
                return veh;
              }).toImmutableList())
          .getOrElse(() {
        return throw 'Error while mapping to list';
      });

      return right(list);
    } catch (err) {
      return left(SensorFailure.databaseError(err: err));
    }
  }

  @override
  ///Returns a KtList containing all the unprogrammed, recently read (< 5 minutes) sensors. 
  ///
  ///If there is a failure retrieving the results from the database, it will return a SensorFailure. 
  Future<Either<SensorFailure, KtList<Sensor>>> getUnprogrammedSensors() async {
    try {
      final result = await _localRepository.rawQuery('SELECT ${SensorDBFields.tableName}.* FROM ${SensorDBFields.tableName} WHERE ${SensorDBFields.dtId} NOT IN (SELECT ${VehicleDBFields.dtId} FROM ${VehicleDBFields.tableName}) AND ${SensorDBFields.dateTimeRep} > ${DateTime.now().millisecondsSinceEpoch - const Duration(minutes: 5).inMilliseconds}');

      final list = result
          .map((jsonList) => jsonList.map((json) {
                final veh = SensorDto.fromJson(json).toDomain();
                return veh;
              }).toImmutableList())
          .getOrElse(() {
            log("Error while mapping unprogrammed sensors to list", name: "sensor_repository.dart");
        return throw 'Error while mapping to list';
      });

      return right(list);
    } catch (err) {
      log("Error retrieving unprogrammed sensors from database: $err", name: "sensor_repository.dart");
      return left(SensorFailure.databaseError(err: err));
    }
  }

  /// Returns a String of value 'null' is the sensor is not present in the database.
  /// Returns DtBtRaw if sensor is present.
  @override
  Future<Either<SensorFailure, Sensor>> isNewSensor(
      {required DtID dtID}) async {
    try {
      final result = await _localRepository.query(SensorDBFields.tableName,
          where: '${SensorDBFields.dtId} = ${dtID.getValueOrErrorString()}',
          limit: 1);
      final resultFromDB = result.getOrElse(
          () => throw Exception('Error getting result isNewSensor() method.'));

      if (resultFromDB.isEmpty) {
        return right(Sensor.none());
      } else {
        final Map<String, Object?> value = resultFromDB.first;
        // Gets the value of dtBtRaw which can either be null or a string.
        final Sensor sensor = SensorDto.fromJson(value).toDomain();
        // If the value is null, it means that it's not present in the db yet.
        // So, the value of isNewSensor is true and false if it's not null.
        return right(sensor);
      }
    } catch (err) {
      return left(SensorFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<SensorFailure, Unit>> updateDateTimeRep({required DtID dtID}) async {
    try {
      final result = await _localRepository.update(
        SensorDBFields.tableName,
        {SensorDBFields.dateTimeRep : DateTime.now().millisecondsSinceEpoch},
        where: "${SensorDBFields.dtId} = ${dtID.getOrCrash()}",
        conflictAlgorithm: ConflictAlgorithm.replace
      );

      if (result?.isLeft() ?? true){
        log("Left($result)", name: "sensor_repository.dart");
        return left(SensorFailure.databaseError(err: result));
      }
      log("$result");
      return right(unit);
    } catch (err) {
      return left(SensorFailure.databaseError(err: err));
    }
  }
}
