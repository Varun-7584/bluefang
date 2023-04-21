import 'package:bluefang/src/domain/bluetooth/bluetooth_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'core/bf_advertisement_data.dart';
import 'core/bf_bluetooth_device.dart';

part 'bluetooth_result.freezed.dart';

@freezed
class BFBluetoothScanResult with _$BFBluetoothScanResult {
  const BFBluetoothScanResult._();

  const factory BFBluetoothScanResult({
    required BFBluetoothDevice device,
    required BFAdvertisementData advertisementData,
    required int rssi,
  }) = _BFBluetoothScanResult;

  factory BFBluetoothScanResult.create(
      {required List<int> listOfBeacon, String? name}) {
    return BFBluetoothScanResult(
        device: BFBluetoothDevice(
            id: BFDeviceIdentifier('1687'), name: name ?? 'Stemco DTSVT'),
        advertisementData: BFAdvertisementData(
            localName: '',
            // ignore: avoid_redundant_argument_values
            txPowerLevel: null,
            connectable: true,
            manufacturerData: {1687: listOfBeacon},
            serviceData: {},
            serviceUuids: []),
        rssi: -60);
  }

  // Empty beacon denotes an invalid beacon.
  factory BFBluetoothScanResult.nonStemcoBeacon() {
    return BFBluetoothScanResult(
        device: BFBluetoothDevice(
            id: BFDeviceIdentifier('-1'), name: 'EmptyBeacon'),
        advertisementData: const BFAdvertisementData(
            localName: '',
            // ignore: avoid_redundant_argument_values
            txPowerLevel: null,
            connectable: true,
            manufacturerData: {-1: []},
            serviceData: {},
            serviceUuids: []),
        rssi: -60);
  }
}
