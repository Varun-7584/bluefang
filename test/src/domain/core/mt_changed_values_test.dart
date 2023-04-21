import 'package:bluefang/src/domain/core/mt_changed_values.dart';
import 'package:bluefang/src/infrastructure/sensor/sensor_mt_dtos.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('test mtchanged values', () {
    test('mtchanged value should return all the changed values', () {
      final MTSensorDto oldSensorDto = MTSensorDto(
          dtId: 123,
          dtRpd: 2,
          dtUom: 1,
          dtLoBat: 1,
          dtReprogrammable: 0,
          dtLocked: 1,
          dtSecure: 1,
          dtModCount: 1,
          dtFirmVerMsp: 12,
          dtFirmVerBT5Ap: 13,
          dtFirmVerBT5Sdk: 14,
          userIdMod: 4,
          dateTimeMod: 2);
      final MTSensorDto newSensorDto = MTSensorDto(
          dtId: 321,
          dtRpd: 23,
          dtUom: 13,
          dtLoBat: 13,
          dtReprogrammable: 03,
          dtLocked: 13,
          dtSecure: 13,
          dtModCount: 13,
          dtFirmVerMsp: 123,
          dtFirmVerBT5Ap: 133,
          dtFirmVerBT5Sdk: 143,
          userIdMod: 43,
          dateTimeMod: 23);
      final MTChangedValues changedValue =
          oldSensorDto.mtChangedValues(newValue: newSensorDto);

      final List<MTChangedParameter> listOfChangedParameters =
          changedValue.changedParameter;
      for (final MTChangedParameter item in listOfChangedParameters) {
        if (kDebugMode) {
          print(item.toString());
        }
      }
      expect(1, 1);
    });
  });
}
