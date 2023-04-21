// ignore_for_file: avoid_positional_boolean_parameters

part of 'programming_status_bloc.dart';

@freezed
class ProgrammingStatusEvent with _$ProgrammingStatusEvent {
  const factory ProgrammingStatusEvent.started(ProgrammedDataTrac dataTrac, Map<String, dynamic> changedValuesMap, bool isEditing, bool realPassword, bool wiping) = _Started;
  const factory ProgrammingStatusEvent.connected(bool isConnected) = _Connected;
  const factory ProgrammingStatusEvent.updated(bool isUpdated) = _Updated;
  const factory ProgrammingStatusEvent.verified(bool isVerified) = _Verified;
  const factory ProgrammingStatusEvent.connectionFailed() = _ConnectionFailed;
  const factory ProgrammingStatusEvent.updateFailed() = _UpdateFailed;
  const factory ProgrammingStatusEvent.verificationFailed() = _VerificationFailed;
}
