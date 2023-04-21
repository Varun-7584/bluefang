import 'package:bluefang/package/bit_manipulation/bit_manipulation.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/factory/i_beacon_factory.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/factory/license_plate_beacon_factory.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/factory/standard_beacon_factory.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/factory/vehicle_number_beacon_factory.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/factory/vin_number_beacon_factory.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/i_beacon.dart';
import 'package:bluefang/src/domain/bluetooth/bluetooth_result.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class BeaconFactory implements IBeaconFactory {
  bool _isInitialized = false;
  String hexValue = "";

  static final Map<BeaconType, IBeaconFactory> _beaconMap = {};

  void _initFactory() {
    if (!_isInitialized) {
      LicensePlateBeaconFactory().registerFactory();
      StandardBeaconFactory().registerFactory();
      VinNumberBeaconFactory().registerFactory();
      VehicleNumberBeaconFactory().registerFactory();

      _isInitialized = true;
    } else {
      throw Exception("BeaconFactory is already initialized");
    }
  }

  @override
  Either<dynamic, IBeacon> createBeacons(BFBluetoothScanResult scanResult) {
    if (_isInitialized) {
      hexValue = bfScanResultToHex(scanResult);

      final BeaconType beaconType = _getBeaconType(hexValue);
      if (_beaconMap.containsKey(beaconType)) {
        _isInitialized = false;
        return right(_beaconMap[beaconType]!
            .createBeaconsFromHex(hexValue, scanResult.rssi)
            .getOrElse(() => throw "Error creating beacons"));
      } else {
        // Log beacon of other type.
        return left(unit);
      }
    } else {
      _initFactory();
      return createBeacons(scanResult);
    }
  }

  @override
  Either<dynamic, IBeacon> createBeaconsFromHex(
      String hex, int signalStrength) {
    if (_isInitialized) {
      final BeaconType beaconType = _getBeaconType(hex);
      if (_beaconMap.containsKey(beaconType)) {
        _isInitialized = false;
        final IBeacon beacon = _beaconMap[beaconType]!
            .createBeaconsFromHex(hex, signalStrength)
            .getOrElse(() => throw "Error creating beacons");
        return right(beacon);
      }
      throw Exception("BeaconFactory of type [$beaconType] not registered!");
    } else {
      _initFactory();
      return createBeaconsFromHex(hex, signalStrength);
    }
  }

  Map<String, String> generateByteToHexMap(String hexValue) {
    final Map<String, String> byteMap = {};
    int byteNumber = 0;
    for (int i = 0; i < hexValue.length; i = i + 2) {
      byteMap.putIfAbsent(
          byteNumber.toString(), () => hexValue.substring(i, i + 2));
      byteNumber += 1;
    }
    return byteMap;
  }

  void addToMap(BeaconType beaconType, IBeaconFactory factoryMethod) {
    _beaconMap.putIfAbsent(beaconType, () => factoryMethod);
  }

  String bfScanResultToHex(BFBluetoothScanResult scanResult) {
    final Map<int, List<int>> mapOfBytes =
        scanResult.advertisementData.manufacturerData;
    final List<int> listOfBytes = mapOfBytes.entries.first.value;

    final String partialHexWithoutIdentifier =
        BitManipulation.listOfBytesToHex(listOfBytes);
    const String stemcoIdentifierNumber = "9706";
    final String completeHexDataFromBeacon =
        "$stemcoIdentifierNumber$partialHexWithoutIdentifier";
    // final processedHex =
    //     BitManipulation.processBeacon(completeHexDataFromBeacon);
    return completeHexDataFromBeacon;
  }

  BeaconType _getBeaconType(String hex) {
    final String hexType =
        hex[12]; //Hex type can be accessed from the 13th byte in the hex value.
    // Its value  can be one of 1, 3, 4, 5, or 6.
    final map = {
      "1": BeaconType.standardBeacon,
      "3": BeaconType.vehicleNumberBeacon,
      "4": BeaconType.vinNumberBeacon,
      "5": BeaconType.licensePlateNumberBeacon,
      "6": BeaconType.comboBeacon,
    };
    if (map.containsKey(hexType)) {
      return map[hexType]!;
    } else {
      throw "Unknown type: $hexType";
    }
  }

  @override
  void registerFactory() {
    // TODO: implement registerFactory
  }
}

enum BeaconType {
  standardBeacon,
  vehicleNumberBeacon,
  vinNumberBeacon,
  licensePlateNumberBeacon,
  comboBeacon
}
