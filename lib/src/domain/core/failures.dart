import 'package:freezed_annotation/freezed_annotation.dart';
part 'failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  // ANCHOR Core
  const factory ValueFailure.empty({required T failedValue}) = Empty<T>;

  const factory ValueFailure.invalidValue({required T failedValue}) =
      InvalidValue<T>;
  const factory ValueFailure.invalidMessageType() = InvalidMessageType<T>;

  const factory ValueFailure.invalidIntValue({required T failedValue}) =
      InvalidIntValue<T>;
  const factory ValueFailure.invalidUserID({required T failedValue}) =
      InvalidUserID<T>;
  const factory ValueFailure.invalidDateTime({required T failedValue}) =
      InvalidDateTime<T>;
  const factory ValueFailure.invalidRange(
      {required T failedValue,
      required int min,
      required int max}) = InvalidRange<T>;
  const factory ValueFailure.invalidDoubleRange(
      {required T failedValue,
      required double min,
      required double max}) = InvalidDoubleRange<T>;
  const factory ValueFailure.listTooLong({
    required T failedValue,
    required int max,
  }) = ListTooLong<T>;

// ANCHOR Vechile
  const factory ValueFailure.invalidVIN({required T failedValue}) =
      InvalidVIN<T>;
  const factory ValueFailure.invalidWMI({required T failedValue}) =
      InvalidWMI<T>;
  const factory ValueFailure.invalidUOM({required T failedValue}) =
      InvalidUOM<T>;
  // ANCHOR Site
  const factory ValueFailure.invalidSite({required T failedValue}) =
      InvalidSite<T>;

  const factory ValueFailure.exceedingLength(
      {required T failedValue, required int max}) = ExceedingLength<T>;

  // ANCHOR Database
  const factory ValueFailure.databaseError({required dynamic err}) =
      _DatabaseError;
}
