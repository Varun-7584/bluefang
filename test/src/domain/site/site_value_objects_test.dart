import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/site/site_value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart' as matcher;

void main() {
  // ANCHOR SiteID
  group('SiteID', () {
    test('should return error when value is out of range ', () {
      const integer = -1;
      final siteID = SiteID(integer).getValueOrError();
      expect(siteID, const matcher.TypeMatcher<InvalidRange>());
    });

    test('should return error when value is out of range ', () {
      const integer = 256;
      final siteID = SiteID(integer).getValueOrError();
      expect(siteID, const matcher.TypeMatcher<InvalidRange>());
    });

    test('should return error value is between 251 to 254', () {
      const integer = 251;
      final siteID = SiteID(integer).getValueOrError();
      expect(siteID, const matcher.TypeMatcher<InvalidSite>());
    });

    test('should return valid site for valid siteID', () {
      const integer = 229;
      final siteID = SiteID(integer).getValueOrError();
      expect(siteID, integer);
    });
  });

  // LOGIN():
    // CheckValidation
    // Check User exist
    // Verify User.

  // ANCHOR SiteName
  group('SiteName', () {
    test('should return error when value is empty', () {
      const str = "";
      final siteName = SiteName(str).getValueOrError();
      expect(siteName, const matcher.TypeMatcher<Empty>());
    });

    test('should return site name for valid sitename', () {
      const str = "SiteName";
      final siteName = SiteName(str).getValueOrError();
      expect(siteName, str);
    });
  });
}
