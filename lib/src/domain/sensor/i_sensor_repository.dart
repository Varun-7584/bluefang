import 'package:bluefang/src/domain/sensor/sensor.dart';
import 'package:bluefang/src/domain/sensor/sensor_failure.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

abstract class ISensorRepository {
  // create
  Future<Either<SensorFailure, Unit>> add({required Sensor sensor});
  // read
  Future<Either<SensorFailure, Sensor>> find({required DtID dtID});
  // update
  Future<Either<SensorFailure, Unit>> update({required Sensor sensor});
  // delete
  Future<Either<SensorFailure, Unit>> delete({required DtID dtID});
  // find all
  Future<Either<SensorFailure, KtList<Sensor>>> fetchAll();

  /// Used to check if the beacon emitted is from a new sensor.
  /// Returns a string 'null' if the sensor is new.
  /// Returns DtID if the sensor exists in the database.
  Future<Either<SensorFailure, Sensor>> isNewSensor({required DtID dtID});

  Future<Either<SensorFailure, KtList<Sensor>>> getUnprogrammedSensors();

  Future<Either<SensorFailure, Unit>> updateDateTimeRep({required DtID dtID});
}
