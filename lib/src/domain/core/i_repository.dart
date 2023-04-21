import 'package:bluefang/src/domain/core/mt_changed_values.dart';
import 'package:bluefang/src/domain/core/repository_failures.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
import 'package:dartz/dartz.dart';

abstract class IRepository<T> {
  /// Definition for method to write changed values to the database
  Future<Either<RepositoryFailures, Unit>> scribeRoutine({
    required MTChangedValues changedFields,
    required String table,
    required String primaryId,
    required String primaryIdValue,
    required DtID dtID,
    required VehID vehID,
  });
}
