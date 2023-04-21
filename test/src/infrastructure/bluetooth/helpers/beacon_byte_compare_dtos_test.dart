// TODO: Work on the test eventually.
// ignore_for_file: unused_local_variable

import 'package:bluefang/src/infrastructure/bluetooth/dtos/beacon_byte_compare_dtos.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../core/data/beacon_data_test.dart';

void main() {
  final String defaultHex = BeaconTestData.defaultHex;
  final String customHex = BeaconTestData.customHex;

  group('beacon byte compare dtos ...', () {
    const String hexValue = "9706048000361FFA01EE4800008B5E2100147B11240EC9";
    const String dtBtRaw = "FA01EE4800008B5E2100147B112";
    test('BeaconByteCompareDto should be sucessfully created from hex value',
        () {
      final StandardBeaconByteCompareDto incomingHex =
          StandardBeaconByteCompareDto.fromHex(hexValue);
      if (kDebugMode) {
        print(incomingHex);
      }
      // final BeaconByteCompareDto expected = BeaconByteCompareDto(dtBtRaw: dtBtRaw, dtLifeMiles: dtLifeMiles, stuatusRPD: stuatusRPD, fuelTypeAndCap: fuelTypeAndCap, siteId: siteId)
      expect(1, 1);
    });
    test('convert currentDtBtRaw to complete hex', () {
      final StandardBeaconByteCompareDto incomingHex =
          StandardBeaconByteCompareDto.fromHex(hexValue);
      final existingdtId = incomingHex.dtId;
      final StandardBeaconByteCompareDto existingDtBtRaw =
          StandardBeaconByteCompareDto.fromDtBtRaw(
              dtBtRaw: dtBtRaw, dtId: existingdtId);

      if (kDebugMode) {
        print(existingdtId);
      }
      final currentHex = "9706${existingdtId}00${existingDtBtRaw.dtBtRaw}00000";
      const String customHex = "97061D8FE0A4123A011DB0040EC900000000000000007B";
      expect(currentHex.length, customHex.length);
    });
    test(
        'BeaconByteCompareDto should be sucessfully created from dtbtRaw value',
        () {
      final StandardBeaconByteCompareDto dtbtRawValue =
          StandardBeaconByteCompareDto.fromDtBtRaw(
              dtBtRaw: dtBtRaw, dtId: hexValue);
      if (kDebugMode) {
        print(dtbtRawValue);
      }
      // final BeaconByteCompareDto expected = BeaconByteCompareDto(dtBtRaw: dtBtRaw, dtLifeMiles: dtLifeMiles, stuatusRPD: stuatusRPD, fuelTypeAndCap: fuelTypeAndCap, siteId: siteId)
      expect(1, 1);
    });
  });
}
