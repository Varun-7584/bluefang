import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // ANCHOR Validate Int Range
  group('ValidateIntRange', () {
    const int min = -2;
    const int max = 10;
    test('should return a failure if value is less than min', () {
      // arrange
      const int input = -5;
      final Either<ValueFailure<int>, int> testInt =
          validateIntRange(input: input, min: min, max: max);
      expect(testInt.isLeft(), true);
    });

    test('should return a failure if value is less greater than max', () {
      // arrange
      const int input = 11;
      final Either<ValueFailure<int>, int> testInt =
          validateIntRange(input: input, min: min, max: max);
      expect(testInt.isLeft(), true);
    });

    test('should return a valid value for integer within the range', () {
      // arrange
      const int input = 10;
      final Either<ValueFailure<int>, int> testInt =
          validateIntRange(input: input, min: min, max: max);
      expect(testInt.isRight(), true);
    });
  });
// ANCHOR Validate DateTime
  group('validateDateTime', () {
    test('should return a failure for values in the future', () {
      final DateTime valueInFuture =
          DateTime.now().add(const Duration(minutes: 5));
      final Either<ValueFailure<int>, int> result =
          validateDateTime(valueInFuture);
      expect(result.isLeft(), true);
    });

    test(
        'should return a failure for values in the past greater than 3700 days',
        () {
      final DateTime valueInPast =
          DateTime.now().subtract(const Duration(days: 3701));
      final Either<ValueFailure<int>, int> result =
          validateDateTime(valueInPast);
      expect(result.isLeft(), true);
    });

    test(
        'should return a valid value for value for date within 10 years to present moment',
        () {
      final DateTime valueInPast = DateTime.now();
      final Either<ValueFailure<int>, int> result =
          validateDateTime(valueInPast);
      // final a = result.fold((l) => l, (r) => r);
      expect(result.isRight(), true);
    });
  });

// ANCHOR Validate DateTime Int
  group('validateDateTimeInt', () {
    test('should return a failure for values in the future', () {
      final int valueInFuture =
          DateTime.now().add(const Duration(days: 2)).millisecondsSinceEpoch ~/
              1000;
      final Either<ValueFailure<int>, int> result =
          validateDateTimeInt(valueInFuture);
      expect(result.isLeft(), true);
    });

    test(
        'should return a failure for values in the past greater than 4000 days',
        () {
      final int valueInPast = DateTime.now()
              .add(const Duration(days: 40001))
              .millisecondsSinceEpoch ~/
          1000;
      final Either<ValueFailure<int>, int> result =
          validateDateTimeInt(valueInPast);
      expect(result.isLeft(), true);
    });

    test(
        'should return a valid value for value for date within 10 years to 1 day in future',
        () {
      final int presentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final Either<ValueFailure<int>, int> result =
          validateDateTimeInt(presentTime);
      expect(result.isRight(), true);
    });
  });

  // ANCHOR Validate ASCII Characters 32-126
  group('Validate ASCII Characters 32-126', () {
    test('should return true when the characters is between 32-126 ', () {
      // arrange
      const String input = "W - 34291";
      final Either<ValueFailure<String>, String> testString =
          validateASCII_32To126(input);
      expect(testString.isRight(), true);
    });
    test('should return true when the characters are not between 32-126 ', () {
      // arrange
      const String input = "W=34291";
      final Either<ValueFailure<String>, String> testString =
          validateASCII_32To126(input);
      expect(testString.isLeft(), true);
    });
  });
}
