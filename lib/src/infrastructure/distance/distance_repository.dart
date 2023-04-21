import 'dart:developer';

import 'package:bluefang/src/domain/distance/distance.dart';
import 'package:bluefang/src/domain/distance/distance_failure.dart';
import 'package:bluefang/src/domain/distance/i_distance_repository.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/infrastructure/core/repository/i_cache.dart';
import 'package:bluefang/src/infrastructure/distance/distance_dtos.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:sqflite/sql.dart';

@LazySingleton(as: IDistanceRepository)
class DistanceRepository implements IDistanceRepository {
  final ICache _localRepository;
  DistanceRepository(this._localRepository);

  @override
  Future<Either<DistanceFailure, Unit>> add(
      {required Distance distance}) async {
    try {
      final distanceDto = DistanceDto.fromDomain(distance);
      log("Distance dto: $distanceDto", name: "distance_repository.dart");
      final result = await _localRepository.insert(
          DistanceDBFields.tableName, distanceDto.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace,
      );
      if (result?.isLeft() ?? true){
        return left(DistanceFailure.databaseError(err: result));
      }
      return right(unit);
    } catch (err) {
      log("Error adding distance to database: $err", name: "distance_repository.dart");
      return left(DistanceFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<DistanceFailure, Distance>> find({required DtID dtID}) async {
    try {
      final result = await _localRepository.query(
        DistanceDBFields.tableName,
        where: "${DistanceDBFields.primaryKey} = ?",
        whereArgs: [dtID.getOrCrash()],
      );
      final value = result.getOrElse(() => throw 'Error Getting Vehicle Value');
      final Distance distance = DistanceDto.fromJson(value[0]).toDomain();
      return right(distance);
    } catch (err) {
      return left(DistanceFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<DistanceFailure, Unit>> update(
      {required Distance distance}) async {
    try {
      final distanceDto = DistanceDto.fromDomain(distance);
      final result = await _localRepository.update(
        //Updates based on the dtId, but doesn't try to update the DtId (this causes a UNIQUE constraint violation)
        DistanceDBFields.tableName, distanceDto.toJson()..remove(DistanceDBFields.dtId),
        where: " ${DistanceDBFields.primaryKey} = ${distanceDto.dtId}",);
      //If there was an error, return the failure
      if (result?.isLeft() ?? true){
        return left(DistanceFailure.databaseError(err: result));
      }
      return right(unit);
    } catch (err) {
      return left(DistanceFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<DistanceFailure, Unit>> delete({required DtID dtID}) async {
    try {
      final result = await _localRepository.delete(
        DistanceDBFields.tableName,
        where: "${DistanceDBFields.primaryKey} = ?",
        whereArgs: [dtID.getOrCrash()],
      );
      return result?.fold((l) => left(DistanceFailure.databaseError(err: l)), (r) => right(unit)) ?? right(unit);
    } catch (err) {
      return left(DistanceFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<DistanceFailure, Unit>> updateDateTimeRep(DtID dtID) async {
    try {
      final int dateTimeRep = DateTime.now().millisecondsSinceEpoch;
      final int dtIdValue = dtID.getOrCrash();

      final result = await _localRepository.update(DistanceDBFields.tableName,
          {DistanceDBFields.dateTimeRep: "$dateTimeRep"},
          where: " ${DistanceDBFields.primaryKey} = $dtIdValue",
          conflictAlgorithm: ConflictAlgorithm.replace);
      
      if (result?.isLeft() ?? true){
        log("Result: $result");
        return left(DistanceFailure.databaseError(err: result));
      }
      return right(unit);
    } catch (err) {
      return left(DistanceFailure.databaseError(err: err));
    }
  }

  @override
  Future<Either<DistanceFailure, KtList<Distance>>> fetchAll() async {
    try {
      final result = await _localRepository.query(DistanceDBFields.tableName);

      final list = result
          .map((jsonList) => jsonList.map((json) {
                final veh = DistanceDto.fromJson(json).toDomain();
                return veh;
              }).toImmutableList())
          .getOrElse(() {
        return throw 'Error while mapping to list';
      });

      return right(list);
    } catch (err) {
      return left(DistanceFailure.databaseError(err: err));
    }
  }
}
