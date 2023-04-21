import 'package:freezed_annotation/freezed_annotation.dart';

part 'bluetooth_failure.freezed.dart';

@freezed
abstract class BluetoothFailure with _$BluetoothFailure {
  const factory BluetoothFailure.cancelledByUser() = CancelledByUser;
  const factory BluetoothFailure.deviceNotFound() = DeviceNotFound;
  const factory BluetoothFailure.errorProgrammingDataTrac() =
      ErrorProgrammingDataTrac;
  const factory BluetoothFailure.powerIsNotOn() = PowerIsNotOn;
}
