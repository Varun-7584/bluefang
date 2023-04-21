import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_transformers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('normalizeVIN: ', () {
    test('should convert lowercase to uppercase', () {
      const String str = "abcd";
      final String normalizedString = normalizeVIN(str);
      expect(normalizedString, 'ABCD');
    });
    test('should remove all the special characters and spaces', () {
      // ignore: unnecessary_string_escapes
      const String str = """\$abcd!@#%&   *()_+/E.   ,\]['   ;_<>?187f🔖""";
      final String normalizedString = normalizeVIN(str);
      expect(normalizedString, 'ABCDE187F');
    });
  });
  group('getVinId9 from VinID: ', () {
    test('returns VINID9 from VINID', () {
      final VinID str = VinID('15GGD2718F1187367');
      final VinID9 expected = VinID9('15GGD271F');
      final VinID9 normalizedString = getVinID9(str);
      expect(normalizedString, expected);
    });
  });
}
