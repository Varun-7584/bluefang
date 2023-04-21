import 'package:bluefang/src/domain/sensor/sensor.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('creation of empty sensor entity', () {
    final Sensor sensor = Sensor.empty();
    expect(sensor.failureOption, const None());
  });
}
