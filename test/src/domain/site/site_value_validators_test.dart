import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/site/site_value_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // ANCHOR validateVIN
  group('validateSite: ', () {
    test('should return a failure if value is less than min', () {
      // arrange
      const int input = -5;
      final Either<ValueFailure<int>, int> testInt = validateSite(input);
      expect(testInt.isLeft(), true);
    });

    test('should return a failure if value is less greater than max', () {
      // arrange
      const int input = 256;
      final Either<ValueFailure<int>, int> testInt = validateSite(input);
      expect(testInt.isLeft(), true);
    });

    test('should return a failure if its either 251,252,253 or 254', () {
      // arrange
      const int input = 254;
      final Either<ValueFailure<int>, int> testInt = validateSite(input);
      expect(testInt.isLeft(), true);
    });

    test('should return a valid value for integer within the range', () {
      // arrange
      const int input = 255;
      final Either<ValueFailure<int>, int> testInt = validateSite(input);
      expect(testInt.isRight(), true);
    });
  });
}
