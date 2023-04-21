import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/core/value_objects.dart';

import 'package:dartz/dartz.dart';

class BFDeviceIdentifier extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory BFDeviceIdentifier(String input) {
    return BFDeviceIdentifier._(processDeviceId(input));
  }
  const BFDeviceIdentifier._(this.value);
}

Either<ValueFailure<String>, String> processDeviceId(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return right('Not Found');
  }
}
