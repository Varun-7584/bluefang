import 'package:bluefang/src/infrastructure/sensor/sensor_mt_dtos.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import '../core/data/beacon_data_test.dart';

void main() {
  const String customHex = "97060E588B761A3E011DB4A40EC900000401000068007B";
  final String hexValue = BeaconTestData.defaultHex;
  // final String dtBtRaw = BeaconTestData.dtBtRaw;
  group('Successful creation of sensor dtos from hex values', () {
    test('check parsing for dtUom', () {
      final MTSensorDto sensorDto = MTSensorDto.fromHex(
          hex: customHex,
          userIdMod: 1234,
          dateTimeMod: DateTime.now().millisecondsSinceEpoch);
      expect(2, sensorDto.dtUom);
    });

    test('changed values test', () {
      final MTSensorDto sensorDto = MTSensorDto.fromHex(
          hex: hexValue,
          userIdMod: 1234,
          dateTimeMod: DateTime.now().millisecondsSinceEpoch);
      final MTSensorDto newSensorDto = MTSensorDto.fromHex(
          hex: customHex,
          userIdMod: 1234,
          dateTimeMod: DateTime.now().millisecondsSinceEpoch);
      final changedValues = sensorDto.mtChangedValues(newValue: newSensorDto);
      if (kDebugMode) {
        print(changedValues.rightMap);
      }
    });
  });
}
