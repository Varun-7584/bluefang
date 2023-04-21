import 'package:bluefang/package/bit_manipulation/bit_manipulation.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('bit manipulation ...', () {
    const String hexInput = "64138628E4566E62626A9146B8905D2616484524C0";
    const String expectedResult =
        "65 66 67 68 49 50 51 53 70 89 66 56 70 74 49 49 75 66 48 55 50 56 54 50";
    test("Should translate from 6 to 8 bit ASCII", () {
      expect(BitManipulation.getASCIIValuesForBeaconPiece(hexInput),
          expectedResult);
    });
  });
}
