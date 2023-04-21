import 'package:bluefang/src/domain/bluetooth/beacons/factory/beacon_factory.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/standard_beacon/standard_beacon.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test factory constructor', () {
    test('creates a factory', () {
      const String standardBeaconHex =
          "97060E588B761A12020002410014020000230000200202";
      final BeaconFactory beaconFactory = BeaconFactory();
      final beacon = beaconFactory.createBeaconsFromHex(standardBeaconHex, 0);
      final StandardBeacon sb = beacon
          .getOrElse(() => throw "Error creating beacons") as StandardBeacon;

      expect(sb, sb);
    });
  });
}
