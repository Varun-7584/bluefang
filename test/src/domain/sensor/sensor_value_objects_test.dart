import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart' as matcher;

void main() {
  // ANCHOR DtID
  group('DtID', () {
    test('error when maximum length is greater than 10 digits', () {
      const value = 12345678901;
      final dtID = DtID(value).getValueOrError();
      expect(dtID, const matcher.TypeMatcher<InvalidRange>());
    });

    test('should return value when less than 10 characters and not empty', () {
      const value = 123;
      final dtID = DtID(value).getValueOrError();
      expect(dtID, value);
    });
  });
  // ANCHOR DtRPD
  group('DtRPD', () {
    test('should return error when value is negative (less than 0) ', () {
      const value = -1;
      final dtRPD = DtRPD(value).getValueOrError();
      expect(dtRPD, const matcher.TypeMatcher<InvalidRange>());
    });

    test('should return error when value is above 1999', () {
      const value = 2000;
      final dtRPD = DtRPD(value).getValueOrError();
      expect(dtRPD, const matcher.TypeMatcher<InvalidRange>());
    });

    test('should return value when less than 1999', () {
      const value = 1999;
      final dtRPD = DtRPD(value).getValueOrError();
      expect(dtRPD, value);
    });
  });

  // ANCHOR DtUOM
  group('DtUOM', () {
    test('error when value is negative (less than 0) ', () {
      const value = -1;
      final dtUOM = DtUOM(value).getValueOrError();
      expect(dtUOM, const matcher.TypeMatcher<InvalidRange>());
    });

    test('error when value is above 2', () {
      const value = 3;
      final dtUOM = DtUOM(value).getValueOrError();
      expect(dtUOM, const matcher.TypeMatcher<InvalidRange>());
    });

    test('should return value when between 0 and 2', () {
      const value = 2;
      final dtUOM = DtUOM(value).getValueOrError();
      expect(dtUOM, value);
    });
  });

  // ANCHOR DtLoBat
  group('DtLoBat', () {
    test('error when value is negative (less than 0) ', () {
      const value = -1;
      final dtLoBat = DtLoBat(value).getValueOrError();
      expect(dtLoBat, const matcher.TypeMatcher<InvalidRange>());
    });

    test('error when value is above 2', () {
      const value = 2;
      final dtLoBat = DtLoBat(value).getValueOrError();
      expect(dtLoBat, const matcher.TypeMatcher<InvalidRange>());
    });

    test('should return value when either 0 or 1', () {
      const value = 0;
      final dtLoBat = DtLoBat(value).getValueOrError();
      expect(dtLoBat, value);
    });
  });

  // ANCHOR dtReprogrammable
  group('dtreprogrammable', () {
    test('error when value is negative (less than 0) ', () {
      const value = -1;
      final dtreprogrammable = DtReprogrammable(value).getValueOrError();
      expect(dtreprogrammable, const matcher.TypeMatcher<InvalidRange>());
    });

    test('error when value is above 2', () {
      const value = 2;
      final dtreprogrammable = DtReprogrammable(value).getValueOrError();
      expect(dtreprogrammable, const matcher.TypeMatcher<InvalidRange>());
    });

    test('should return value when either 0 or 1', () {
      const value = 0;
      final dtreprogrammable = DtReprogrammable(value).getValueOrError();
      expect(dtreprogrammable, value);
    });
  });

  // ANCHOR DtLocked
  group('DtLocked', () {
    test('error when value is negative (less than 0) ', () {
      const value = -1;
      final dtLocked = DtLocked(value).getValueOrError();
      expect(dtLocked, const matcher.TypeMatcher<InvalidRange>());
    });

    test('error when value is above 2', () {
      const value = 2;
      final dtLocked = DtLocked(value).getValueOrError();
      expect(dtLocked, const matcher.TypeMatcher<InvalidRange>());
    });

    test('should return value when either 0 or 1', () {
      const value = 0;
      final dtLocked = DtLocked(value).getValueOrError();
      expect(dtLocked, value);
    });
  });

  // ANCHOR DtLifeMiles
  group('DtLifeMiles', () {
    test('error when value is negative (less than 0) ', () {
      const value = -1;
      final dtLifeMiles = DtLifeMiles(value).getValueOrError();
      expect(dtLifeMiles, const matcher.TypeMatcher<InvalidRange>());
    });

    test('error when value is above 16777215', () {
      const value = 16777216;
      final dtLifeMiles = DtLifeMiles(value).getValueOrError();
      expect(dtLifeMiles, const matcher.TypeMatcher<InvalidRange>());
    });

    test('should return value when between 0 and 16777215', () {
      const value = 245;
      final dtLifeMiles = DtLifeMiles(value).getValueOrError();
      expect(dtLifeMiles, value);
    });
  });
}
