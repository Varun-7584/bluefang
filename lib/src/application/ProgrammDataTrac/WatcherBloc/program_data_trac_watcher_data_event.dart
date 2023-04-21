part of 'program_data_trac_watcher_data_bloc.dart';

@freezed
class ProgramDataTracWatcherDataEvent with _$ProgramDataTracWatcherDataEvent {
  const factory ProgramDataTracWatcherDataEvent.watchAllStarted() =
      _WatchAllStarted;

  const factory ProgramDataTracWatcherDataEvent.sensorsRecieved(
    Either<ProgrammedDataTracFailure, KtList<ProgrammedDataTrac>>
        failureOrSensors,
  ) = _SensorRecieved;
}
