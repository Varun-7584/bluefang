// ignore_for_file: avoid_positional_boolean_parameters

part of "demo_mode_bloc.dart";

@freezed
class DemoModeEvent with _$DemoModeEvent {
  const factory DemoModeEvent.started() = _Started;
  const factory DemoModeEvent.valueChanged(bool newValue) = _ValueChanged;
}
