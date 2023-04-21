import 'package:freezed_annotation/freezed_annotation.dart';

part 'bluetooth_repository_failure.freezed.dart';

@freezed
abstract class BluetoothRepositoryFailure with _$BluetoothRepositoryFailure {
  const factory BluetoothRepositoryFailure.errorParsingBeacons(String error) =
      ErrorParsingBeacons;
  const factory BluetoothRepositoryFailure.errorProcessingBeacons(
      String error) = ErrorProcessingBeacons;
  const factory BluetoothRepositoryFailure.errorEmittingBeacons(String error) =
      ErrorEmittingBeacons;
}
