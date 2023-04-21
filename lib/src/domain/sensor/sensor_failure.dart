import 'package:freezed_annotation/freezed_annotation.dart';

part 'sensor_failure.freezed.dart';

@freezed
abstract class SensorFailure<T> with _$SensorFailure {
  const factory SensorFailure.insufficientPermission() =
      _InsufficientPermission;
  const factory SensorFailure.unableToUpdate() = _UnableToUpdate;
  const factory SensorFailure.databaseError({required T err}) =
      _DatabaseError<T>;
}
