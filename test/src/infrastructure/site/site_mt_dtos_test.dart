import 'package:bluefang/src/infrastructure/site/site_mt_dtos.dart';
import 'package:flutter_test/flutter_test.dart';

import '../core/data/beacon_data_test.dart';

void main() {
  group('Sensor', () {
    final String hex = BeaconTestData.customHex;
    test('create sensor dtos', () {
      final datetimeMod = DateTime.now().microsecondsSinceEpoch;
      final MTSiteDto mtSensorDtos =
          MTSiteDto.fromHex(hex: hex, userIdMod: 12, dateTimeRep: datetimeMod);
      final MTSiteDto newSensorDtos = MTSiteDto.fromHex(
          hex: hex, userIdMod: 1234, dateTimeRep: datetimeMod);
      final changedValue = mtSensorDtos.changedValues(newValue: newSensorDtos);
      expect({
        "userIdMod": [12, 1234]
      }, changedValue);
    });
  });
}
