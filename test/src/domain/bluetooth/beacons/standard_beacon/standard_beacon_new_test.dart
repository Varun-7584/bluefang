import 'package:bluefang/src/domain/bluetooth/beacons/standard_beacon/standard_beacon.dart';
import 'package:bluefang/src/domain/distance/distance.dart';
import 'package:bluefang/src/domain/sensor/sensor.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('create a new standard beacon class', () {
    final Sensor sensor = Sensor.empty();
    final StandardBeacon standardBeaconNew =
        StandardBeacon.existingValuesFromDB(sensor);
    Distance distance = Distance.empty();
    distance = distance.copyWith(dtLifeMiles: DtLifeMiles(100));
    standardBeaconNew.mtDistance.updateFromDatabase(distance);

    expect(1, 1);
  });
}
