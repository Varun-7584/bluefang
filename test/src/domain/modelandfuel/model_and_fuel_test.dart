import 'package:bluefang/src/domain/modelandfuel/model_and_fuel.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('creation of empty distance entity', () {
    final ModelAndFuel modelAndFuel = ModelAndFuel.empty();
    expect(modelAndFuel.failureOption, const None());
  });
}
