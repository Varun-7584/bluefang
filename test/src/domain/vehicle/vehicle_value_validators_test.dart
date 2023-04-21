import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('isValidVin', () {
    test('should return true. All valid VIN17 provided', () {
      const List<String> validVins = [
        "15GGD2718G1187367",
        "1G6DP567050158816",
        "1FMCU9H92DUA74748",
        "1FMZK02135G949761",
        "JM1BL1U84D1704790",
        "4T1BF1FKXEU800158",
        "1FTCR14U0VPB00782",
        "1G6DS5ED5B0130656",
        "JTHBJ46G172134823",
        "3VWCK21Y03M312809",
        "5YFBURHE3EP059848",
        "WMWMF73577TT82811",
        "1LNHL9DKXEG604241",
        "5FNYF3H51EB025016",
        "1G2ZF58B774218596",
        "1HGCR3F81EA003333",
        "3FAHP08Z18R229578",
        "5GZDV03LX6D132658",
        "YV1RH592462535485",
      ];
      final List<bool> expected = [];
      final List<bool> result = [];
      for (var i = 0; i < validVins.length; i++) {
        final bool res = isValidVin(validVins[i], VINTYPE.VIN17);
        result.add(res);
        expected.add(true);
      }

      expect(result, expected);
    });

    test('should return false. All invalid VIN17 provided', () {
      const List<String> validVins = [
        "1G6DP56Q050158816",
        "1FMCU9HI2DUAI4748",
        "1FMZK02O35G949761",
        "JM1BL1U84D170",
        "4T1BF1FKXEU8001F8",
        "1FTCR14U0VPB0Q782",
        "1G6DS5ED5B013I6F6",
        "JTHBJ46G17213Q8A3",
        "3VWCK21Y03MA1O809",
        "5YFBURHE3EP0AQ848",
        "WMWMF73577OT8Q811",
        "QLNHL9DKXEG603241",
        "5FNYI3H51EB025016",
        "1G2ZF58B@#\$JF74218596",
        "1HGCR3F81EO03333",
        "3FAHP08Z18RQ229578",
        "5GZDV03QEX6D132658",
        "YV1IH592462535485",
      ];
      final List<bool> expected = [];
      final List<bool> result = [];
      for (var i = 0; i < validVins.length; i++) {
        final bool res = isValidVin(validVins[i], VINTYPE.VIN17);
        result.add(res);
        expected.add(false);
      }

      expect(result, expected);
    });
    test('should return true for valid VIN9 vin', () {
      const List<String> validVins = [
        "15GGD271F",
        "1G1AK55Fip",
        "KNDJE7238-!@#7",
        "1G4GE5G30F",
        "JTEZU5JR0B",
        "1G6DP56705",
        "1G11CJSL1F",
        "4T1BF28B4Y"
      ];
      final List<bool> result = [];
      for (var i = 0; i < validVins.length; i++) {
        final bool res = isValidVin(validVins[i], VINTYPE.VIN9);
        result.add(res);
      }

      expect(result, [true, false, true, true, true, true, true, true]);
    });
  });

  // ANCHOR validateVIN
  group('validateVIN', () {
    test('VIN17: should return a failure if value is less than 17 characters)',
        () {
      // arrange
      const String input = "1G4GE5G30FF20076";
      final Either<ValueFailure<String>, String> testInt =
          validateVIN(input, VINTYPE.VIN17);
      expect(testInt.isLeft(), true);
    });

    test('VIN17: should return right if vin is valid', () {
      // arrange
      const String input = "1G4GE5G30FF20076";
      final Either<ValueFailure<String>, String> testInt =
          validateVIN(input, VINTYPE.VIN17);
      expect(testInt.isLeft(), true);
    });

    test('VIN9: should return a error if it is less than 9 characters.', () {
      // arrange
      const String input = "1G4GE530";
      final Either<ValueFailure<String>, String> testInt =
          validateVIN(input, VINTYPE.VIN9);
      expect(testInt.isLeft(), true);
    });

    test('VIN9: should return a right if it is a valid vin.', () {
      // arrange
      const String input = "1G4GE5G30";
      final Either<ValueFailure<String>, String> testInt =
          validateVIN(input, VINTYPE.VIN9);
      expect(testInt.isRight(), true);
    });
  });

  // ANCHOR validateVIN
  group('validateFuelUOM: ', () {
    test('should return a failure if value is less than min', () {
      // arrange
      const int input = -5;
      final Either<ValueFailure<int>, int> testInt = validateFuelUOM(input);
      expect(testInt.isLeft(), true);
    });

    test('should return a failure if value is less greater than max', () {
      // arrange
      const int input = 256;
      final Either<ValueFailure<int>, int> testInt = validateFuelUOM(input);
      expect(testInt.isLeft(), true);
    });

    test('should return a failure if its either 251,252,253 or 254', () {
      // arrange
      const int input = 254;
      final Either<ValueFailure<int>, int> testInt = validateFuelUOM(input);
      expect(testInt.isLeft(), true);
    });

    test('should return a valid value for integer within the range', () {
      // arrange
      const int input = 255;
      final Either<ValueFailure<int>, int> testInt = validateFuelUOM(input);
      expect(testInt.isRight(), true);
    });
  });
}
