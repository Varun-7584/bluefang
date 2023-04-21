import 'package:bluefang/src/domain/aggregates/vehicleInfo/vehicle_info.dart';
import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

abstract class IVehicleInfoRepository {
  // read
  Future<Either<ValueFailure, KtList<VehicleInfo>>> findAll();
  // Find by vindId9
  Future<Either<ValueFailure, KtList<VehicleInfo>>> findByVinId9(
      {required VinID9 vinID9});
  Future<Either<ValueFailure, KtList<VehicleInfo>>> findAllActive();
}
