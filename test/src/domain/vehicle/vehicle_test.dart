import 'package:bluefang/src/domain/vehicle/vehicle.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('creation of empty vehilce entity', () {
    final Vehicle vehicle = Vehicle.empty();
    expect(vehicle.failureOption, const None());
  });
}
