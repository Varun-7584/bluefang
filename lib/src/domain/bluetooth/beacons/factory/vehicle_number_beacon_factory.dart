import 'package:bluefang/src/domain/bluetooth/beacons/byte_mapping.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/factory/beacon_factory.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/factory/i_beacon_factory.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/i_beacon.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/vehicle_beacons/vehicle_number_beacon.dart';

import 'package:bluefang/src/domain/bluetooth/bluetooth_result.dart';
import 'package:dartz/dartz.dart';

class VehicleNumberBeaconFactory extends BeaconFactory
    implements IBeaconFactory {
  VehicleNumberBeaconFactory() : super();

  @override
  void registerFactory() {
    super
        .addToMap(BeaconType.vehicleNumberBeacon, VehicleNumberBeaconFactory());
  }

  @override
  Either<dynamic, IBeacon> createBeacons(BFBluetoothScanResult scanResult) {
    try {
      final hexValue = bfScanResultToHex(scanResult);
      final Map<String, String> jsonMap = beaconMapping(hexValue);
      final VehicleNumberBeacon beacon = VehicleNumberBeacon.fromJson(jsonMap);
      return right(beacon);
    } catch (err) {
      return left(err);
    }
  }

  @override
  Either<dynamic, IBeacon> createBeaconsFromHex(
      String hex, int signalStrength) {
    try {
      final Map<String, String> jsonMap = beaconMapping(hex);
      final VehicleNumberBeacon beacon = VehicleNumberBeacon.fromJson(jsonMap);
      return right(beacon);
    } catch (err) {
      throw left(err);
    }
  }

  Map<String, String> beaconMapping(String hexValue) {
    final byteMap = generateByteToHexMap(hexValue);
    final BeaconBytesRepresentation bytesRepresentation =
        BeaconBytesRepresentation(byteMap);

    return {
      'hexValue': hexValue,
      'manufacturerId': bytesRepresentation.byteInterval(start: 0, end: 1),
      'dtId': bytesRepresentation.byteInterval(
        start: 2,
        end: 5,
      ),
      'beaconType':
          bytesRepresentation.halfByte(number: 6, side: ByteSide.firstHalf),
      "stringLength":
          bytesRepresentation.halfByte(number: 6, side: ByteSide.secondHalf),
      "payload":
          bytesRepresentation.byteInterval(start: 7, end: 22, parse: false),
    };
  }
}
