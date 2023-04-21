part of 'programming_status_bloc.dart';

@freezed
class ProgrammingStatusState with _$ProgrammingStatusState {
  const factory ProgrammingStatusState({
    required bool isConnected,
    required bool isProgrammed,
    required bool isVerified,
    required bool isWritten,
    required bool connectionFailed,
    required bool updateFailed,
    required bool verificationFailed,
    required bool writingFailed,
    required bool changeScreen,
    required bool homeScreen,
  }) = _ProgrammingStatusState;
  factory ProgrammingStatusState.initial() => const ProgrammingStatusState(
    isConnected: false,
    isProgrammed: false,
    isVerified: false,
    isWritten: false,
    connectionFailed: false,
    updateFailed: false,
    verificationFailed: false,
    writingFailed: false,
    changeScreen: false,
    homeScreen: false
  );
}
