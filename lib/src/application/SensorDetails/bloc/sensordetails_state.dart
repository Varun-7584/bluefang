part of 'sensordetails_bloc.dart';

@freezed
class SensordetailsState with _$SensordetailsState {
  const factory SensordetailsState({
    required bool showErrorMessages,
    required bool isLoading,
    required Sensor sensor,
    required Distance distance,
    required int rotationalFrequency,
    required double speed,
    required SignalStrength signalStrength,
    required int rotationalAngle,
    required String standardBeaconHex,
    required String vehicleBeaconHex,
    required String vinBeaconHex,
    required String licensePlateBeaconHex,
    required Option<Either<ProgrammedDataTracFailure, Unit>>
        saveFailureOrSuccessOption,
  }) = _SensordetailsState;

  factory SensordetailsState.initial() => SensordetailsState(
      showErrorMessages: false,
      isLoading: true,
      saveFailureOrSuccessOption: none(),
      sensor: Sensor.empty(),
      distance: Distance.empty(),
      rotationalFrequency: 0,
      speed: 0.0,
      signalStrength: SignalStrength.empty(),
      rotationalAngle: 0,
      standardBeaconHex: "N/A",
      vehicleBeaconHex: "N/A",
      vinBeaconHex: "N/A",
      licensePlateBeaconHex: "N/A");
}
