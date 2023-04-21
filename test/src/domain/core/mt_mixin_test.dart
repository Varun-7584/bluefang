import 'dart:core';
import 'package:bluefang/src/domain/core/mt_changed_values.dart';
import 'package:bluefang/src/domain/core/mt_mixin.dart';
import 'package:flutter/foundation.dart';

class TestClass with MTMixin {
  // field
  int first;
  int second;
  int third;

  TestClass(this.first, this.second, this.third);

  @override
  Map<String, Object?> toJson() {
    return {
      "1_first": first,
      "1_second": second,
      "1_third": third,
    };
  }

  @override
  // TODO: implement mtTracked
  List<Object> get mtTracked => toJson().keys.toList();
}

class Test2Class with MTMixin {
  // field
  int first;
  int second;
  int third;

  Test2Class(this.first, this.second, this.third);

  @override
  Map<String, Object?> toJson() {
    return {
      "2_first": first,
      "2_second": second,
      "2_third": third,
    };
  }

  @override
  List<Object> get mtTracked => ["2_first", "2_second", "2_third"];
}

class Aggregate with MTMixin {
  // field
  TestClass testClass;
  Test2Class test2Class;

  Aggregate(this.testClass, this.test2Class);
  @override
  Map<String, Object?> toJson() {
    final Map<String, Object?> finalJson = {};
    finalJson.addAll(testClass.toJson());
    finalJson.addAll(test2Class.toJson());
    return finalJson;
  }

  @override
  List<Object> get mtTracked => test2Class.mtTracked + testClass.mtTracked;
}

void main() {
  final TestClass class1Agg2 = TestClass(1, 2, 3);
  final TestClass class1Agg1 = TestClass(10, 20, 30);

  final MTChangedValues mtChangedValues =
      class1Agg1.mtChangedValues(newValue: class1Agg2, delimiter: "_");

  for (final element in mtChangedValues.changedParameter) {
    if (kDebugMode) {
      print(element.toString());
    }
  }

  // final Test2Class class2Agg1 = Test2Class(5, 1, 5);
  // final Test2Class class2Agg2 = Test2Class(50, 10, 50);

  // final Aggregate class1 = Aggregate(class1Agg1, class2Agg1);
  // final Aggregate class2 = Aggregate(class1Agg2, class2Agg2);

  // final ExtractChangedValuesFromObjects cv =
  //     ExtractChangedValuesFromObjects(currValue: class1, previousValue: class2);

  // final Map<Object, List<Object?>> finalJson = cv.changedValues();
}
