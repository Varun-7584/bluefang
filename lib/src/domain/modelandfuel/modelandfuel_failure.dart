import 'package:freezed_annotation/freezed_annotation.dart';

part 'modelandfuel_failure.freezed.dart';

@freezed
class ModelAndFuelFailure with _$ModelAndFuelFailure {
  const factory ModelAndFuelFailure.databaseError({required dynamic err}) =
      _DatabaseError;
  const factory ModelAndFuelFailure.errorConvertingFromJSON(
      {required dynamic err}) = _ErrorConvertingFromJSON;
}
