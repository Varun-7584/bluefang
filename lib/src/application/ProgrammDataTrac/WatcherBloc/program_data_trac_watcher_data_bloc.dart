import 'package:bloc/bloc.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/i_program_datatrac_repo.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

part 'program_data_trac_watcher_data_event.dart';
part 'program_data_trac_watcher_data_state.dart';

part 'program_data_trac_watcher_data_bloc.freezed.dart';

@injectable
class ProgramDataTracWatcherDataBloc extends Bloc<
    ProgramDataTracWatcherDataEvent, ProgramDataTracWatcherDataState> {
  final IProgrammedDataTracRepository _programmedDataTracRepository;
  ProgramDataTracWatcherDataBloc(this._programmedDataTracRepository)
      : super(const _Initial()) {
    // ignore: void_checks
    on<ProgramDataTracWatcherDataEvent>((event, emit) async* {
      yield* event.map(
          watchAllStarted: (e) async* {
            yield await _programmedDataTracRepository.findAll();

            /// Just a placeholder. Ignore this.
          },
          sensorsRecieved: (e) async* {});
    });
  }
}
