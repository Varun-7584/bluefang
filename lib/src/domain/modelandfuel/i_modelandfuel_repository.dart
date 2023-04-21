import 'package:bluefang/src/domain/modelandfuel/model_and_fuel.dart';
import 'package:bluefang/src/domain/modelandfuel/modelandfuel_failure.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

abstract class IModelAndFuelRepository {
  // create
  Future<Either<ModelAndFuelFailure, Unit>> add(
      {required ModelAndFuel modelAndFuel});
  // read
  Future<Either<ModelAndFuelFailure, ModelAndFuel>> find(
      {required VinID9 vinID9});
  // update
  Future<Either<ModelAndFuelFailure, Unit>> update(
      {required ModelAndFuel modelAndFuel});
  // delete
  Future<Either<ModelAndFuelFailure, Unit>> delete({required VinID9 vinID9});
  // Find all
  Future<Either<ModelAndFuelFailure, KtList<ModelAndFuel>>> fetchAll();
}
