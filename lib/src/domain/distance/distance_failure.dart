import 'package:freezed_annotation/freezed_annotation.dart';

part 'distance_failure.freezed.dart';

@freezed
abstract class DistanceFailure with _$DistanceFailure {
  const factory DistanceFailure.databaseError({required dynamic err}) =
      _DatabaseError;
}
