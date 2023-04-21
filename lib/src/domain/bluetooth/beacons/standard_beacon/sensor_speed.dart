import 'dart:math';

import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';

class SensorSpeed {
  DtRPD dtRPD;
  int rotationalFrequency;
  SensorSpeed(this.dtRPD, this.rotationalFrequency);

  double getSpeed() {
    final int dtRpdValue = dtRPD.getOrCrash();
    if (dtRpdValue == 0 || rotationalFrequency <= 0) {
      return 0;
    }
    final double freq = rotationalFrequency * 0.0625;
    final double revPerHour = freq * 3600;
    final double speed = revPerHour / dtRpdValue;
    return _dp(speed, 2);
  }

  double _dp(double val, int places) {
    final num mod = pow(10.0, places);
    return (val * mod).round().toDouble() / mod;
  }
}
