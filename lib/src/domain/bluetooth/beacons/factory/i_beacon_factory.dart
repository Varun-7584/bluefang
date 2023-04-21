import 'package:bluefang/src/domain/bluetooth/beacons/i_beacon.dart';
import 'package:bluefang/src/domain/bluetooth/bluetooth_result.dart';
import 'package:dartz/dartz.dart';

abstract class IBeaconFactory {
  void registerFactory() {}
  Either<dynamic, IBeacon> createBeacons(BFBluetoothScanResult scanResult);
  Either<dynamic, IBeacon> createBeaconsFromHex(String hex, int signalStrength);
}
