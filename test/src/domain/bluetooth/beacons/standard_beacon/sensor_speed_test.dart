import 'package:bluefang/src/domain/bluetooth/beacons/standard_beacon/sensor_speed.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('check speed calculatoin', () {
    final SensorSpeed speed = SensorSpeed(DtRPD(500), 160);
    final output = speed.getSpeed();
    expect(output, 72);
  });
  test('lower bounds for rotational frequency', () {
    final SensorSpeed speed = SensorSpeed(DtRPD(500), 0);
    final output = speed.getSpeed();
    expect(output, 0);
  });
  test('upper bounds for both dtRPD and frequency ', () {
    final SensorSpeed speed = SensorSpeed(DtRPD(1999), 1023);
    final output = speed.getSpeed();
    expect(output, 115.15);
  });
  test('smaller dtrpd', () {
    final SensorSpeed speed = SensorSpeed(DtRPD(0), 2);
    final output = speed.getSpeed();
    expect(output, 0);
  });
}
