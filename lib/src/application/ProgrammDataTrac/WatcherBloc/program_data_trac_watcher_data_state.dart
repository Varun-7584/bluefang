part of 'program_data_trac_watcher_data_bloc.dart';

@freezed
class ProgramDataTracWatcherDataState with _$ProgramDataTracWatcherDataState {
  const factory ProgramDataTracWatcherDataState.initial() = _Initial;
  const factory ProgramDataTracWatcherDataState.loadInProgress() =
      _LoadInProgress;
  const factory ProgramDataTracWatcherDataState.loadSuccess(
      KtList<ProgrammedDataTrac> programmedDataTrac) = _LoadSuccess;
  const factory ProgramDataTracWatcherDataState.loadFailure(
      ProgrammedDataTracFailure programmedDataTracFailure) = _LoadFailure;
}
