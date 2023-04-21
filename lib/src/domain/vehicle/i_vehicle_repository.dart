import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/domain/vehicle/vehicle.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';

abstract class IVehicleRepository {
  Future<Either<VehicleFailure, dynamic>> add({required Vehicle vehicle});
  Future<Either<VehicleFailure, Vehicle>> find({required DtID dtID});
  Future<Either<VehicleFailure, Unit>> update({required Vehicle vehicle});
  Future<Either<VehicleFailure, Unit>> delete({required DtID dtID});
  Future<Either<VehicleFailure, KtList<Vehicle>>> fetchAll();
}
