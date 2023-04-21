import 'package:bluefang/src/domain/bluetooth/beacons/factory/beacon_factory.dart';

import 'package:bluefang/src/domain/bluetooth/beacons/standard_beacon/standard_beacon.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test factory constructor', () {
    test('creates a factory', () {
      final BeaconFactory beaconFactory = BeaconFactory();
      final StandardBeacon beacon = beaconFactory
          .createBeaconsFromHex(
              "97060E588B761A290A4B05A82328630003810020107B7B", 0)
          .getOrElse(() => throw "Error creating beacons") as StandardBeacon;
      final StandardBeacon changedBeacon = beaconFactory
          .createBeaconsFromHex(
              "97060E588B761A290A4B05A1037A630003810020107B7B", 0)
          .getOrElse(() => throw "Error creating beacons") as StandardBeacon;

      final changedValues = beacon.mtModelAndFuel
          .parseAndGetChangedValues(newValue: changedBeacon.mtModelAndFuel);

      expect(changedValues.rightMap["vehFuelType"], 1);
      expect(changedValues.rightMap["vehFuelCapacity"], 89.0);
    });
  });
}

// 11: A4
// 12: 27
// 13: 10
