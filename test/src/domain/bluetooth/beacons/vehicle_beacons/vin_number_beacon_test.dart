import 'package:bluefang/src/domain/bluetooth/beacons/factory/beacon_factory.dart';

import 'package:bluefang/src/domain/bluetooth/beacons/vehicle_beacons/vin_number_beacon.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MT Sensor class test', () {
    test('returns all the changed values ', () {
      final BeaconFactory beaconFactory = BeaconFactory();
      final VinNumberBeacon beacon = beaconFactory
          .createBeaconsFromHex("97060E588B7641566E62626A9146B8905D261648", 0)
          .getOrElse(() => throw "Error creating beacons") as VinNumberBeacon;
      final VinNumberBeacon changedBeacon = beaconFactory
          .createBeaconsFromHex("97060E588B7641566E62626A9146B8905D261648", 0)
          .getOrElse(() => throw "Error creating beacons") as VinNumberBeacon;
      final changedValues = beacon.mtChangedValues(newValue: changedBeacon);
      expect(changedValues.rightMap, {});
    });
  });
}

// 11: A4
// 12: 27
// 13: 10
