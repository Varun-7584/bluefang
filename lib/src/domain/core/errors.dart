import 'package:bluefang/src/domain/core/failures.dart';
import 'package:dartz/dartz.dart';

class NotAuthenticatedError extends Error {}

class UnexpectedValueError<T> extends Error {
  final ValueFailure valueFailure;
  final Either<ValueFailure<T>, T> value;
  UnexpectedValueError(this.valueFailure, this.value);

  @override
  String toString() {
    final String explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating. ${StackTrace.current}';
    return Error.safeToString('$explanation Failure was : $valueFailure');
  }
}
