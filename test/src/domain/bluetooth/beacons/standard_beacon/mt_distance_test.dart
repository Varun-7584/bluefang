import 'package:bluefang/src/domain/bluetooth/beacons/factory/beacon_factory.dart';

import 'package:bluefang/src/domain/bluetooth/beacons/standard_beacon/standard_beacon.dart';
import 'package:bluefang/src/domain/location/bf_location_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MT Sensor class test', () {
    test('returns all the changed values ', () {
      final BeaconFactory beaconFactory = BeaconFactory();
      final StandardBeacon beacon = beaconFactory
          .createBeaconsFromHex(
              "97060E588b761000010000000000000000000000000000", 0)
          .getOrElse(() => throw "Error creating beacons") as StandardBeacon;
      final StandardBeacon changedBeacon = beaconFactory
          .createBeaconsFromHex(
              "97060E588B761A3D0A4B05A1037A630003810020507B7B", 0)
          .getOrElse(() => throw "Error creating beacons") as StandardBeacon;
      changedBeacon.mtDistance
          .updateGPSData(BFLocationData(latitude: 9, longitude: 9));
      final changedValues = beacon.mtDistance
          .parseAndGetChangedValues(newValue: changedBeacon.mtDistance);
      final expectedChangedValues = {
        "dtLifeMiles": 897,
        "gpsLat": 9.0,
        "gpsLon": 9.0,
      };
      expect(changedValues.rightMap, expectedChangedValues);
    });
  });
}

// 11: A4
// 12: 27
// 13: 10
