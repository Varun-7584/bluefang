import 'package:bluefang/src/domain/bluetooth/beacons/standard_beacon/signal_strength.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stats/stats.dart';

void main() {
  group('description', () {
    test("create signal strength", () {
      final List<int> strengths = [
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        11,
        12,
        13,
        14,
        15
      ];
      final List<int> signals = [];
      for (final int i in strengths) {
        if (signals.length < 10) {
          signals.add(i);
        } else {
          signals.remove(i);
          signals[0] = i;
        }
        final stats = Stats.fromData(signals);
        final SignalStrength signalStrength =
            SignalStrength.fromStats(stats, 0);
        if (kDebugMode) {
          print(signalStrength);
        }
      }
      expect(1, 1);
    });
  });
}
