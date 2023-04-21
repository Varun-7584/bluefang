// ignore_for_file: avoid_print, prefer_const_constructors, avoid_bool_literals_in_conditional_expressions
import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
part 'programdatatracsettings_event.dart';
part 'programdatatracsettings_state.dart';
part 'programdatatracsettings_bloc.freezed.dart';

/// Handles the bloc for the Programdatatracsettings screen.
///
/// Takes [ProgramdatatracsettingsEvent]s and returns [ProgramdatatracsettingsState].
@injectable
class ProgramdatatracsettingsBloc extends HydratedBloc<
    ProgramdatatracsettingsEvent, ProgramdatatracsettingsState> {
  ProgramdatatracsettingsBloc()
      : super(ProgramdatatracsettingsState.initial(
          hideLicensePlate: false,
          hideFuelInfo: false,
        )) {
    on<Initialized>((event, emit) async {
      emit(ProgramdatatracsettingsState(
          hideLicensePlate: false, hideFuelnfo: false));
    });
    on<_HideFuelChanged>((event, emit) {
      log("New value of hideFuelInfo: ${event.newValue}",
          name: "ProgramdatatracsettingsBloc.on<_HideFuelChanged>");
      emit(ProgramdatatracsettingsState.submitted(
          hideLicensePlate: state.hideLicensePlate,
          hideFuelnfo: event.newValue));
    });
  }

  @override
  ProgramdatatracsettingsState? fromJson(Map<String, dynamic> json) {
    log(json.toString(), name: "programdatatracsettings_bloc.fromJson");
    return ProgramdatatracsettingsState(
        hideLicensePlate: (json["hideLicensePlate"] as bool?) ?? false,
        hideFuelnfo: (json["hideFuelInfo"] as bool?) ?? false);
  }

  @override
  // TODO look into the esline issue.
  // ignore: body_might_complete_normally_nullable
  Map<String, dynamic>? toJson(ProgramdatatracsettingsState state) {
    if (state is _Submitted) {
      log(state.toString(), name: "programdatatracsettings_bloc.toJson");
      return {
        "hideLicensePlate": state.hideLicensePlate,
        "hideFuelInfo": state.hideFuelnfo,
      };
    }
  }
}
