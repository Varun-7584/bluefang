import 'package:bluefang/src/domain/distance/distance.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('creation of empty distance entity', () {
    final Distance distance = Distance.empty();
    expect(distance.failureOption, const None());
  });
}
