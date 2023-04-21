import 'package:bluefang/src/domain/bluetooth/beacons/factory/beacon_factory.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/vehicle_beacons/vehicle_number_beacon.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('vehicle number beacon factory ...', () {
    test("creates a licenseBeacon", () {
      const String hexValue = "9706048000363C8628E49669E8A6AAEC";
      final BeaconFactory beaconFactory = BeaconFactory();
      final VehicleNumberBeacon vehicleNumberBeacon = beaconFactory
          .createBeaconsFromHex(hexValue, 0) as VehicleNumberBeacon;
      if (kDebugMode) {
        print(vehicleNumberBeacon);
      }
      expect(1, 1);
    });
  });
}

// 8E49669E8A6AAEC
// 8628E49669E8A6AAEC
