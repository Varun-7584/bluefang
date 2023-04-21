// ignore_for_file: avoid_positional_boolean_parameters

part of 'programdatatracsettings_bloc.dart';

/// Event object for the programdatatracsettings_bloc. 
@freezed
class ProgramdatatracsettingsEvent with _$ProgramdatatracsettingsEvent {
  const factory ProgramdatatracsettingsEvent.initialized() = Initialized;
  factory ProgramdatatracsettingsEvent.hideFuelChanged(bool newValue) = _HideFuelChanged;
}
