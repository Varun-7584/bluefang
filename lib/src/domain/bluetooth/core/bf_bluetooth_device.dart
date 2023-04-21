import 'package:bluefang/src/domain/bluetooth/bluetooth_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bf_bluetooth_device.freezed.dart';

@freezed
class BFBluetoothDevice with _$BFBluetoothDevice {
  const BFBluetoothDevice._();
  const factory BFBluetoothDevice({
    required BFDeviceIdentifier id,
    required String name,
  }) = _BFBluetoothDevice;
}

enum BFBluetoothDeviceType { unknown, classic, le, dual }
