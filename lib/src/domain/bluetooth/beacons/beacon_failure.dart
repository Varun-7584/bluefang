import 'package:freezed_annotation/freezed_annotation.dart';
part 'beacon_failure.freezed.dart';

@freezed
class BeaconFailure with _$BeaconFailure {
  const factory BeaconFailure.bluetoothError({required dynamic err}) =
      _BluetoothError;
}
