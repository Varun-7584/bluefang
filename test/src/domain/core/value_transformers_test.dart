import 'package:bluefang/src/domain/core/value_transformers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('value_validators.', () {
    test('removes space characters from String', () {
      // arrange
      const string = "A Quick Brown Fox";
      final String result = removeSpaceCharacterFromString(string);
      expect(result, 'AQuickBrownFox');
    });

    test('removes special characters from String', () {
      // arrange
      // ignore: unnecessary_string_escapes
      const string = """A!\$@#%^&*()_+{:"?><|QuickBrown,.;'/\][=-Fox""";
      final String result = removeSpecialCharacters(string);
      expect(result, 'AQuickBrownFox');
    });
  });
}
