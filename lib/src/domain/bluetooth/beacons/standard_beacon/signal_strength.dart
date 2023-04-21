import 'dart:math';

import 'package:stats/stats.dart';

class SignalStrength {
  num currentValue;
  num lastRead;
  num maxValue;
  num average;
  num standardDeviation;
  List<int> sinals = [];
  SignalStrength({
    required this.currentValue,
    required this.lastRead,
    required this.maxValue,
    required this.standardDeviation,
    required this.average,
  });

  factory SignalStrength.empty() {
    return SignalStrength(
      currentValue: 0,
      lastRead: 0,
      maxValue: 0,
      standardDeviation: 0,
      average: 0,
    );
  }

  factory SignalStrength.fromStats(Stats stats, num lastRead) {
    return SignalStrength(
      currentValue: lastRead,
      lastRead: lastRead,
      maxValue: stats.max,
      standardDeviation: stats.standardDeviation,
      average: stats.average,
    );
  }

  SignalStrength getParsedData() {
    return SignalStrength(
      currentValue: _dp(currentValue, 2),
      lastRead: _dp(lastRead, 2),
      maxValue: _dp(maxValue, 2),
      standardDeviation: _dp(standardDeviation, 2),
      average: _dp(average, 2),
    );
  }

  // ignore: use_setters_to_change_properties
  void updateMax(num value) {
    maxValue = value;
  }

  double _dp(num val, int places) {
    final num mod = pow(10.0, places);
    return (val * mod).round().toDouble() / mod;
  }

  @override
  String toString() {
    return "Last Read: $lastRead , maxValue: $maxValue , standardDeviatoin: $standardDeviation, average: $average,";
  }
}
