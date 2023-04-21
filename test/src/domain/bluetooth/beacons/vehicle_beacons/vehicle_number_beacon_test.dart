import 'package:bluefang/src/domain/bluetooth/beacons/factory/beacon_factory.dart';

import 'package:bluefang/src/domain/bluetooth/beacons/vehicle_beacons/vehicle_number_beacon.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MT Sensor class test', () {
    test('returns all the changed values ', () {
      final BeaconFactory beaconFactory = BeaconFactory();
      final VehicleNumberBeacon beacon = beaconFactory
              .createBeaconsFromHex("9706048000363C8628E49669E8A6AAEC", 0)
              .getOrElse(() => throw "Error creating beacons")
          as VehicleNumberBeacon;
      final VehicleNumberBeacon changedBeacon = beaconFactory
              .createBeaconsFromHex("97060480003636CE1D728760", 0)
              .getOrElse(() => throw "Error creating beacons")
          as VehicleNumberBeacon;
      // ABCDEFGHIJKL to SAURAV
      final changedValues = beacon.mtChangedValues(newValue: changedBeacon);
      final changedValuesMap = {
        "hexValue": "97060480003636CE1D728760",
        "stringLength": '6',
        "vehicleNumber": "SAURAV"
      };

      expect(changedValues.rightMap, changedValuesMap);
    });
  });
}

// 11: A4
// 12: 27
// 13: 10
