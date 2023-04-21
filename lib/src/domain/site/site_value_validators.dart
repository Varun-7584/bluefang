import 'package:bluefang/src/domain/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

Either<ValueFailure<int>, int> validateSite(int input) {
  if (input >= 0 && input <= 250 || input == 255) {
    return right(input);
  } else {
    return left(ValueFailure.invalidSite(failedValue: input));
  }
}

Either<ValueFailure<KtList<T>>, KtList<T>> validateMaxListLength<T>(
  KtList<T> input,
  int maxLength,
) {
  if (input.size <= maxLength) {
    return right(input);
  } else {
    return left(ValueFailure.listTooLong(
      failedValue: input,
      max: maxLength,
    ));
  }
}
