import 'package:bluefang/src/domain/distance/distance.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'distance_failure.dart';

abstract class IDistanceRepository {
  // create
  Future<Either<DistanceFailure, Unit>> add({required Distance distance});
  // read
  Future<Either<DistanceFailure, Distance>> find({required DtID dtID});
  // update
  Future<Either<DistanceFailure, Unit>> update({required Distance distance});
  // delete
  Future<Either<DistanceFailure, Unit>> delete({required DtID dtID});
  // find all
  Future<Either<DistanceFailure, KtList<Distance>>> fetchAll();

  Future<Either<DistanceFailure, Unit>> updateDateTimeRep(DtID dtID);
}
