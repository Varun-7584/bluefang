import 'package:bluefang/package/bit_manipulation/bit_manipulation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('convert hex to a list of bytes', () {
    const hex = "9706048000363C8628E49669E8A6AAEC";
    test('should convert hex to list of bytes', () {
      final data = BitManipulation.getPayloadFromVehBeacons(hex);

      expect(data, "ABCDEFGHIJKL");
    });
  });
}
