part of 'programdatatracsettings_bloc.dart';

@freezed
class ProgramdatatracsettingsState with _$ProgramdatatracsettingsState {
  const factory ProgramdatatracsettingsState({
    required bool hideLicensePlate,
    required bool hideFuelnfo,
  }) = _ProgramdatatracsettingsState;

  factory ProgramdatatracsettingsState.initial({
    required bool hideLicensePlate,
    required bool hideFuelInfo,
  }) => ProgramdatatracsettingsState(
    hideLicensePlate: hideLicensePlate,
    hideFuelnfo: hideFuelInfo
  );

  factory ProgramdatatracsettingsState.submitted({
    required bool hideLicensePlate,
    required bool hideFuelnfo,
  }) = _Submitted;
}
