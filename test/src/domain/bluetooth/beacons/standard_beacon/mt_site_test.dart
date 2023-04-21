import 'package:bluefang/src/domain/bluetooth/beacons/factory/beacon_factory.dart';

import 'package:bluefang/src/domain/bluetooth/beacons/standard_beacon/standard_beacon.dart';
import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/domain/sensor/sensor.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("MTSite class test", () {
    test("creation from existing sensor", () {
      final Sensor sensor = Sensor(
        dtId: DtID(240683894),
        dtBtRaw: "290A4B05A82328C800038100201",
        dtIdHumanReadable: DtIDHumanReadable(240683894),
        dtRpd: DtRPD(0),
        dtUom: DtUOM(0),
        dtLoBat: DtLoBat(0),
        dtReprogrammable: DtReprogrammable(0),
        dtLocked: DtLocked(0),
        dtSecure: DtSecure(0),
        dtModCount: DtModCount(1),
        dtFirmVerMsp: DtFirmVerMsp(0),
        dtFirmVerBT5Ap: DtFirmVerBT5Ap(0),
        dtFirmVerBT5Sdk: DtFirmVerBT5Sdk(0),
        userIdMod: UserID(0),
        userIdRep: UserID(0),
        dateTimeMod: DateTimeMod.now(),
        dateTimeRep: DateTimeMod.now(),
      );

      final StandardBeacon existingStandardBeacon =
          StandardBeacon.existingValuesFromDB(sensor);
      final BeaconFactory beaconFactory = BeaconFactory();
      final StandardBeacon changedBeacon = beaconFactory
          .createBeaconsFromHex(
              "97060E588B761A290A4B05A82328630003810020107B7B", 0)
          .getOrElse(() => throw "Error creating beacons") as StandardBeacon;

      final changedValues = existingStandardBeacon.mtSite
          .parseAndGetChangedValues(newValue: changedBeacon.mtSite);
      expect(changedValues.rightMap, {"siteId": 99});
    });
  });
}

// 11: A4
// 12: 27
// 13: 10
