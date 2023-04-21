import 'package:freezed_annotation/freezed_annotation.dart';
part 'vehicle_failure.freezed.dart';

@freezed
class VehicleFailure<T> with _$VehicleFailure {
  const factory VehicleFailure.unexpected() = _Unexpected;
  const factory VehicleFailure.databaseError({required T err}) =
      _DatabaseError<T>;
  const factory VehicleFailure.unableToUpdate() = _UnableToUpdate;
}
