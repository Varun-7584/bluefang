import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart' as matcher;

void main() {
  // ANCHOR UserID
  group('UserID', () {
    test('error when value is negative (less than 0) ', () {
      const value = -1;
      final userID = UserID(value).getValueOrError();
      expect(userID, const matcher.TypeMatcher<InvalidRange>());
    });
    test('error when value is above 65536', () {
      const value = 65537;
      final userID = UserID(value).getValueOrError();
      expect(userID, const matcher.TypeMatcher<InvalidRange>());
    });
    test('should return value when between 0 and 65536', () {
      const value = 65536;
      final userID = UserID(value).getValueOrError();
      expect(userID, value);
    });
  });

  // ANCHOR DateTimeMod
  group('DateTimeMod', () {
    test(
        'should return an error if the date is more than 3 minutes in the future',
        () {
      final DateTime tenMinsFromNow =
          DateTime.now().add(const Duration(minutes: 4));
      final dateTimeMod = DateTimeMod(tenMinsFromNow).getValueOrError();

      expect(dateTimeMod, const matcher.TypeMatcher<InvalidDateTime>());
    });
    test(
        'should return an error if the date is more than 3700 days (10 years) before',
        () {
      final DateTime tenYearAgo =
          DateTime.now().subtract(const Duration(days: 3700));
      final dateTimeMod = DateTimeMod(tenYearAgo).getValueOrError();

      expect(dateTimeMod, const matcher.TypeMatcher<InvalidDateTime>());
    });

    test('should return a value for present date in utc', () {
      final DateTime currentTime = DateTime.now();
      final dateTimeMod = DateTimeMod(currentTime);
      expect(dateTimeMod, const matcher.TypeMatcher<DateTimeMod>());
    });

    test('should return a value for present date in utc', () {
      final int currentTime = DateTime.now().millisecondsSinceEpoch;
      final dateTimeMod = DateTimeMod.fromInt(currentTime);
      expect(dateTimeMod, const matcher.TypeMatcher<DateTimeMod>());
    });
  });
}
