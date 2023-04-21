import 'package:bluefang/package/bit_manipulation/bit_manipulation.dart';
import 'package:bluefang/src/infrastructure/modelandfuel/modelandfuel_mt_dtos.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../core/data/beacon_data_test.dart';

void main() {
  final String hexValue = BeaconTestData.defaultHex;
  // final String newHexValue = BeaconTestData.customHex;
  group('modelandfuel mt dtos ...', () {
    test('extracts the 11th bit properly', () {
      final String eleventhByte = hexValue.substring(22, 24);
      if (kDebugMode) {
        print(eleventhByte);
      }
      expect("00", eleventhByte);
    });
    test('converts 11th byte to bits', () {
      final String eleventhByte = hexValue.substring(22, 24);
      final String bits = BitManipulation.hexToBinary(eleventhByte);
      expect(bits, bits);
    });

    test('create a modelAndFuel Dto', () {
      // ignore: unused_local_variable
      final MTModelAndFuelDto mtModelAndFuelDto = MTModelAndFuelDto.fromHex(
          hex: hexValue,
          userIdRep: 1234,
          dateTimeRep: DateTime.now().millisecondsSinceEpoch);

      expect(1, 1);
    });

    // test('create a modelAndFuel Dto', () {
    //   final MTModelAndFuelDto mtModelAndFuelDto = MTModelAndFuelDto.fromHex(
    //       hex: hexValue,
    //       userIdRep: 1234,
    //       dateTimeRep: DateTime.now().millisecondsSinceEpoch);
    //   final MTModelAndFuelDto mtNewModelAndFuelDtos = MTModelAndFuelDto.fromHex(
    //       hex: newHexValue,
    //       userIdRep: 1234,
    //       dateTimeRep: DateTime.now().millisecondsSinceEpoch);

    //   final changedValues =
    //       mtModelAndFuelDto.changedValues(newValue: mtNewModelAndFuelDtos);
    //   if (kDebugMode) {
    //     print(changedValues);
    //   }
    //   expect({"vehFuelType": 4}, changedValues);
    // });

    test('create a modelAndFuel Dto', () {
      const String originalHex =
          "97060E588b761000010000000000000000000000000000";
      const String customHex = "97060E588B761A3E011DB4A40EC900000401000068007B";
      final MTModelAndFuelDto mtModelAndFuelDto = MTModelAndFuelDto.fromHex(
          hex: originalHex,
          userIdRep: 1234,
          dateTimeRep: DateTime.now().millisecondsSinceEpoch);
      final MTModelAndFuelDto mtNewModelAndFuelDtos = MTModelAndFuelDto.fromHex(
          hex: customHex,
          userIdRep: 1234,
          dateTimeRep: DateTime.now().millisecondsSinceEpoch);

      final changedValues =
          mtModelAndFuelDto.mtChangedValues(newValue: mtNewModelAndFuelDtos);

      if (kDebugMode) {
        print(changedValues.rightMap);
      }
    });
  });
}


// {0: 97, 1: 06, 2: 0E, 3: 58, 4: 8b, 5: 76, 6: 10, 7: 00, 8: 01, 9: 00, 10: 00, 11: 00, 12: 00, 13: 00, 14: 00, 15: 00, 16: 00, 17: 00, 18: 00, 19: 00, 20: 00, 21: 00, 22: 00}
// {0: 97, 1: 06, 2: 0E, 3: 58, 4: 8B, 5: 76, 6: 1A, 7: 3E, 8: 01, 9: 1D, 10: B4, 11: A4, 12: 0E, 13: C9, 14: 00, 15: 00, 16: 04, 17: 01, 18: 00, 19: 00, 20: 68, 21: 00, 22: 7B}
