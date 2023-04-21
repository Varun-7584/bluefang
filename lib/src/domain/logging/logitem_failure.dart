import 'package:freezed_annotation/freezed_annotation.dart';

part 'logitem_failure.freezed.dart';

@freezed
abstract class LogItemFailure<T> with _$LogItemFailure {
  const factory LogItemFailure.unableToUpdate() = _UnableToUpdate;
  const factory LogItemFailure.databaseError({required T err}) =
      _DatabaseError<T>;
}
