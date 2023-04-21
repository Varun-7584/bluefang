import 'package:bluefang/src/domain/bluetooth/bluetooth_result.dart';
import 'package:bluefang/src/domain/bluetooth/bluetooth_value_objects.dart';
import 'package:bluefang/src/domain/bluetooth/core/bf_advertisement_data.dart';
import 'package:bluefang/src/domain/bluetooth/core/bf_bluetooth_device.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bfbluetoothscanresult_dtos.freezed.dart';

// This class is responsible for converting the ScanResult class to BFScanResult class.
// The reason we are doing this is we want to loosely depend on ScanResult class in our app
// In future if we use some other package and get the data in other way. We will only be required to change this class.
// So, fromScanResults function will be something else.
// To Learn more about Data Transfer Objects:
@freezed
class BFBluetoothScanResultDtos with _$BFBluetoothScanResultDtos {
  const BFBluetoothScanResultDtos._();

  const factory BFBluetoothScanResultDtos({
    required String id,
    required String name,
    required String localName,
    int? txPowerLevel,
    required bool connectable,
    required Map<int, List<int>> manufacturerData,
    required Map<String, List<int>> serviceData,
    required List<String> serviceUuids,
    required int rssi,
  }) = _BFBluetoothScanResultDtos;

  factory BFBluetoothScanResultDtos.fromScanResults(ScanResult scanResult) {
    return BFBluetoothScanResultDtos(
      id: scanResult.device.id.id,
      name: scanResult.device.name,
      localName: scanResult.advertisementData.localName,
      txPowerLevel: scanResult.advertisementData.txPowerLevel,
      connectable: scanResult.advertisementData.connectable,
      manufacturerData: scanResult.advertisementData.manufacturerData,
      serviceData: scanResult.advertisementData.serviceData,
      serviceUuids: scanResult.advertisementData.serviceUuids,
      rssi: scanResult.rssi,
    );
  }

  BFBluetoothScanResult toDomain() {
    return BFBluetoothScanResult(
      device:
          BFBluetoothDevice(id: BFDeviceIdentifier(id.toString()), name: name),
      advertisementData: BFAdvertisementData(
          localName: localName,
          connectable: connectable,
          manufacturerData: manufacturerData,
          serviceData: serviceData,
          serviceUuids: serviceUuids),
      rssi: rssi,
    );
  }
}
