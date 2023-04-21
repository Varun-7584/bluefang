import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/domain/distance/distance.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/infrastructure/distance/distance_mt_dtos.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../core/data/beacon_data_test.dart';

void main() {
  final String hexValue = BeaconTestData.defaultHex;
  // final String dtBtRaw = BeaconTestData.dtBtRaw;
  group('distance dtos ...', () {
    test('Successful creation of distance dtos from hex values', () {
      final MTDistanceDto mtDistanceDto = MTDistanceDto.fromHex(
          hexValue,
          40.20,
          42.20,
          123,
          123,
          DateTime.now().millisecondsSinceEpoch,
          DateTime.now().millisecondsSinceEpoch);
      if (kDebugMode) {
        print(mtDistanceDto);
      }
      expect(1, 1);
    });
    test('Successful creation of distance entity', () {
      final MTDistanceDto mtDistanceDto = MTDistanceDto.fromHex(
          hexValue,
          40.20,
          42.20,
          123,
          123,
          DateTime.now().millisecondsSinceEpoch,
          DateTime.now().millisecondsSinceEpoch);
      final Distance distance = Distance(
          dtId: DtID(mtDistanceDto.dtId),
          dtLifeMiles: DtLifeMiles(mtDistanceDto.dtLifeMiles),
          gpsLon: GpsLon(mtDistanceDto.gpsLon),
          gpsLat: GpsLat(mtDistanceDto.gpsLat),
          userIdMod: UserID(mtDistanceDto.userIdMod),
          dateTimeMod: DateTimeMod.fromInt(mtDistanceDto.dateTimeMod),
          userIdRep: UserID(mtDistanceDto.userIdRep),
          dateTimeRep: DateTimeMod.fromInt(mtDistanceDto.dateTimeRep));
      expect(const None(), distance.failureOption);
    });
  });
}
