// ignore_for_file: prefer_const_constructors

part of 'demo_mode_bloc.dart';

@freezed
class DemoModeState with _$DemoModeState {
  const factory DemoModeState({
    required bool isDemo,
  }) = _DemoModeState;
  factory DemoModeState.initial() => DemoModeState(isDemo: false);
}
