import 'dart:developer';

import 'package:bluefang/src/domain/bluetooth/beacons/byte_mapping.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/factory/beacon_factory.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/factory/i_beacon_factory.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/i_beacon.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/standard_beacon/standard_beacon.dart';

import 'package:bluefang/src/domain/bluetooth/bluetooth_result.dart';
import 'package:dartz/dartz.dart';

class StandardBeaconFactory extends BeaconFactory implements IBeaconFactory {
  StandardBeaconFactory() : super();

  @override
  void registerFactory() {
    super.addToMap(BeaconType.standardBeacon, StandardBeaconFactory());
  }

  @override
  Either<dynamic, IBeacon> createBeacons(BFBluetoothScanResult scanResult) {
    try {
      final hexValue = bfScanResultToHex(scanResult);
      final Map<String, Object> jsonMap = incomingBeaconMapping(hexValue, 0);
      final StandardBeacon beacon = StandardBeacon.incoming(jsonMap);

      return right(beacon);
    } catch (err) {
      throw left(err);
    }
  }

  @override
  Either<dynamic, IBeacon> createBeaconsFromHex(
      String hex, int signalStrength) {
    try {
      final Map<String, Object> jsonMap =
          incomingBeaconMapping(hex, signalStrength);
      log("Incoming json: $jsonMap", name: "standard_beacon_factory.dart");
      final StandardBeacon beacon = StandardBeacon.incoming(jsonMap);
      return right(beacon);
    } catch (err) {
      throw left(err);
    }
  }

  Map<String, Object> incomingBeaconMapping(
      String hexValue, int signalStrength) {
    final byteMap = generateByteToHexMap(hexValue);
    final BeaconBytesRepresentation bytesRepresentation =
        BeaconBytesRepresentation(byteMap);

    return {
      'hexValue': hexValue,
      'dtId': bytesRepresentation.byteInterval(start: 2, end: 5),
      'beaconType': BeaconType.standardBeacon,
      'licensePlateBeaconEnabled': bytesRepresentation.partialBits(
          byteNumber: 6, startBit: 8, numberOfBits: 1),
      "vehicleBeaconEnabled": bytesRepresentation.partialBits(
          byteNumber: 7, startBit: 1, numberOfBits: 1),
      "vinBeaconEnabled": bytesRepresentation.partialBits(
          byteNumber: 7, startBit: 2, numberOfBits: 1),
      'manufacturerId': bytesRepresentation.byteInterval(start: 0, end: 1),
      'dtBtRaw':
          bytesRepresentation.byteInterval(start: 7, end: 20, parse: false) +
              bytesRepresentation.halfByte(
                  number: 20, side: ByteSide.firstHalf, parse: false),
      'dtLifeMilesHex':
          bytesRepresentation.byteInterval(start: 15, end: 17, parse: false),
      'dtLocked': bytesRepresentation.partialBits(
          byteNumber: 7, startBit: 4, numberOfBits: 1),
      'statusRPD':
          bytesRepresentation.byteInterval(start: 7, end: 10, parse: false) +
              bytesRepresentation.halfByte(
                  number: 11, side: ByteSide.firstHalf, parse: false) +
              bytesRepresentation.halfByte(
                  number: 20, side: ByteSide.firstHalf, parse: false),
      'companyId': bytesRepresentation.byteInterval(start: 18, end: 19),
      'fuelTypeAndCap':
          bytesRepresentation.byteInterval(start: 11, end: 13, parse: false),
      'siteIdHex':
          bytesRepresentation.byteInterval(start: 14, end: 14, parse: false),
      'motionBit': bytesRepresentation.partialBits(
          byteNumber: 6, startBit: 6, numberOfBits: 1),
      'dirValid': bytesRepresentation.partialBits(
          byteNumber: 6, startBit: 7, numberOfBits: 1),
      'rotationalFrequency': int.parse(
          bytesRepresentation.halfByte(
                  number: 20, side: ByteSide.secondHalf, parse: false) +
              bytesRepresentation.byteInterval(
                  start: 21, end: 21, parse: false),
          radix: 16),
      'rotationalAngle': bytesRepresentation.byteInterval(start: 22, end: 22),
      'directionOfRotation': bytesRepresentation.partialBits(
        byteNumber: 6,
        startBit: 5,
        numberOfBits: 1,
      ),
      'signalStrength': signalStrength,
      'dtRpd': int.parse(
          bytesRepresentation.byteInterval(start: 9, end: 9, parse: false) +
              bytesRepresentation.halfByte(
                  number: 10, side: ByteSide.firstHalf, parse: false),
          radix: 16),
    };
  }

  Map<String, Object> beaconMapping(String hexValue) {
    final byteMap = generateByteToHexMap(hexValue);

    final BeaconBytesRepresentation bytesRepresentation =
        BeaconBytesRepresentation(byteMap);

    return {
      'hexValue': hexValue,
      'manufacturerId': bytesRepresentation.byteInterval(start: 0, end: 1),
      'dtId': bytesRepresentation.byteInterval(start: 2, end: 5),
      'beaconType':
          bytesRepresentation.halfByte(number: 6, side: ByteSide.firstHalf),
      'directionOfRotation': bytesRepresentation.partialBits(
        byteNumber: 6,
        startBit: 5,
        numberOfBits: 1,
      ),
      'motionBit': bytesRepresentation.partialBits(
          byteNumber: 6, startBit: 6, numberOfBits: 1),
      'dirValid': bytesRepresentation.partialBits(
          byteNumber: 6, startBit: 7, numberOfBits: 1),
      'licensePlateBeaconEnabled': bytesRepresentation.partialBits(
          byteNumber: 6, startBit: 8, numberOfBits: 1),
      "vehicleBeaconEnabled": bytesRepresentation.partialBits(
          byteNumber: 7, startBit: 1, numberOfBits: 1),
      "vinBeaconEnabled": bytesRepresentation.partialBits(
          byteNumber: 7, startBit: 2, numberOfBits: 1),
      "dtReprogrammable": bytesRepresentation.partialBits(
          byteNumber: 7, startBit: 3, numberOfBits: 1),
      "dtLocked": bytesRepresentation.partialBits(
          byteNumber: 7, startBit: 4, numberOfBits: 1),
      "dtSecure": bytesRepresentation.partialBits(
          byteNumber: 7, startBit: 5, numberOfBits: 1),
      "dtLoBat": bytesRepresentation.partialBits(
          byteNumber: 7, startBit: 6, numberOfBits: 1),
      "dtUom": bytesRepresentation.partialBits(
          byteNumber: 7, startBit: 7, numberOfBits: 2),
      'dtModCount': bytesRepresentation.byteInterval(start: 8, end: 8),
      'dtRpd': int.parse(
          bytesRepresentation.byteInterval(start: 9, end: 9, parse: false) +
              bytesRepresentation.halfByte(
                  number: 10, side: ByteSide.firstHalf, parse: false),
          radix: 16),
      'dtFirmVerBT5Ap':
          bytesRepresentation.halfByte(number: 10, side: ByteSide.secondHalf),
      'dtFirmVerBT5Sdk': bytesRepresentation.partialBits(
          byteNumber: 11, startBit: 1, numberOfBits: 3),
      'vehFuelType': bytesRepresentation.partialBits(
          byteNumber: 11, startBit: 4, numberOfBits: 5),
      'vehFuelCapacity': int.parse(
              bytesRepresentation.byteInterval(start: 12, end: 13)) /
          10, // Here we are dividing this by 10 because this value is a double and is emitted as number*10 from the beacon.
      'siteId': bytesRepresentation.byteInterval(start: 14, end: 14),
      'dtLifeMiles': bytesRepresentation.byteInterval(start: 15, end: 17),
      'companyId': bytesRepresentation.byteInterval(start: 18, end: 19),
      'dtFirmVerMsp':
          bytesRepresentation.halfByte(number: 20, side: ByteSide.firstHalf),
      'rotationalFrequency': int.parse(
          bytesRepresentation.halfByte(
                  number: 20, side: ByteSide.secondHalf, parse: false) +
              bytesRepresentation.byteInterval(
                  start: 21, end: 21, parse: false),
          radix: 16),
      'rotationalAngle': bytesRepresentation.byteInterval(start: 22, end: 22),
    };
  }
}
