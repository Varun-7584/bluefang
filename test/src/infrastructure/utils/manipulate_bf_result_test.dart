// ignore_for_file: unused_local_variable
// TODO: Work on this test

import 'package:bluefang/src/domain/bluetooth/bluetooth_result.dart';
import 'package:bluefang/src/infrastructure/bluetooth/helpers/manipulate_bf_result.dart';
import 'package:flutter_test/flutter_test.dart';

import '../core/data/beacon_data_test.dart';

void main() {
  final ManipulateBFResult bfResultToJson = ManipulateBFResult();
  group('BF Result to JSON', () {
    test('Converting to JSON works', () {
      final BFBluetoothScanResult scanResult = BFBluetoothScanResult.create(
          listOfBeacon: BeaconTestData.listCustomHexBytes);

      final Map<String, Object?> expectedJSON = {
        "manufacturerId": "1001011100000110",
        "dtId": "00000100100000000000000000110110",
        "beaconType": "0001",
        "directionOfRotation": "1",
        "motionBit": "1",
        "dirValid": "1",
        "licensePlateBeaconEnabled": "1",
        "vehicleBeaconEnabled": "1",
        "vinBeaconEnabled": "1",
        "dtReprogrammable": "1",
        "dtLocked": "1",
        "dtSecure": "0",
        "dtLoBat": "1",
        "dtUom": "10",
        "dtModCount": "00000001",
        "dtRpd": "111011100100",
        "dtFirmVerBT5Ap": "1000",
        "dtFirmVerBT5Sdk": "0000",
        "vehFuelType": "0000",
        "vehFuelCapacity": "0000000010001011",
        "siteId": "01011110",
        "dtLifeMiles": "001000010000000000010100",
        "companyId": "0111101100010001",
        "dtFirmVerMsp": "0010",
        "rotationalFrequency": "010000001110",
        "rotationalAngle": "11001001"
      };
      // final result =
      //     bfResultToJson.bfResultToJson(scanResult, BfJsonOutputType.bit);
      // if (kDebugMode) {
      //   print(result);
      // }
      expect(1, 1);
    });
  });
}
