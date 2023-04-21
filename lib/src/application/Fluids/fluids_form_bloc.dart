// ignore_for_file: avoid_print, prefer_const_constructors
import 'dart:developer';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac_failures.dart';
import 'package:bluefang/src/domain/modelandfuel/model_and_fuel.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
part 'fluids_form_event.dart';
part 'fluids_form_state.dart';

part 'fluids_form_bloc.freezed.dart';

/// Handles the bloc for the Programdatatracform screen.
/// Uses [HydratedBloc] to persist the state between app restarts and power cycles.
/// Takes [FluidsformEvent]s and returns [FluidsformState].

@injectable
class FluidsformBloc extends HydratedBloc<FluidsformEvent, FluidsformState> {
  ProgrammedDataTrac? theDataTrac;
  Either<ProgrammedDataTracFailure, ProgrammedDataTrac>? response;
  FluidsformState? newState;

  FluidsformBloc() : super(FluidsformState.initial()) {
    on<Initialized>((event, emit) async {
      log("Initializing.", name: "fluids_form_bloc");
      emit(state.copyWith(modelAndFuel: event.modelAndFuel, vehId: event.vehId));
      log("State.modelAndFuel: ${state.modelAndFuel}");
    });
    on<OilViscosityChanged>((event, emit) async {
      emit(state.copyWith(oilVisc: event.oilViscosity));
    });
    on<FuelQuantityChanged>((event, emit) async {
      emit(state.copyWith(fuelQuantity: event.fuelQuantity));
    });
    on<OilQuantityChanged>((event, emit) async {
      emit(state.copyWith(oilQuantity: event.oilQuantity));
    });
    on<CoolantQuantityChanged>((event, emit) async {
      emit(state.copyWith(coolantQuantity: event.coolantQuantity));
    });
    on<AtfQuantityChanged>((event, emit) async {
      emit(state.copyWith(atfQuantity: event.atfQuantity));
    });
    on<DefQuantityChanged>((event, emit) async {
      emit(state.copyWith(defQuantity: event.defQuantity));
    });
    on<OilTypeChanged>((event, emit) async {
      emit(state.copyWith(oilType: event.oilType));
    });
    on<CoolantTypeChanged>((event, emit) async {
      emit(state.copyWith(coolantType: event.coolantType));
    });
    on<AtfTypeChanged>((event, emit) async {
      emit(state.copyWith(atfType: event.atfType));
    });
    on<DefTypeChanged>((event, emit) async {
      emit(state.copyWith(defType: event.defType));
    });
  }

  /// Takes a [Map]<String, dynamic> and returns a [FluidsformState].
  ///
  /// The returned state could be null.
  ///
  /// If any of the values retrieved from the database are null, it uses the default values instead.
  /// Any errors are logged along with the stack trace.
  @override
  // TODO Look into this ES-lint issue.
  // ignore: body_might_complete_normally_nullable
  FluidsformState? fromJson(Map<String, dynamic> json) {
    FluidsformState stateToReturn = FluidsformState.initial();
    log("fromJson", name: "fluids_form_bloc.dart");
    try {
      log(json.toString(), name: "fluids_form_bloc.dart");
      stateToReturn = //ProgramdatatracformState.initial();
      FluidsformState(
        isEditing: true,
        isSubmitting: false,
        showErrorMessages: false,
        oilType: (json["oilType"] as int?) ?? 0,
        oilVisc: (json["oilVisc"] as int?) ?? 0,
        coolantType: (json["coolantType"] as int?) ?? 0,
        coolantQuantity: (json["coolantQuantity"] as double?) ?? 0.0,
        atfType: (json["atfType"] as int?) ?? 0,
        atfQuantity: (json["atfQuantity"] as double?) ?? 0.0,
        defType: (json["defType"] as int?) ?? 0,
        defQuantity: (json["defQuantity"] as double?) ?? 0.0,
        fuelType: (json["fuelType"] as int?) ?? 0,
        fuelQuantity: (json["fuelQuantity"] as double?) ?? 0.0,
        oilQuantity: (json["atfQuantity"] as double?) ?? 0.0,
        modelAndFuel: (json["modelAndFuel"] as ModelAndFuel?) ?? ModelAndFuel.empty(),
        vehId: (json["vehId"] as String?) ?? "21",
      );

      log("State pulled from hydrated bloc: $stateToReturn",
          name: "fluids_form_bloc.dart");
      return stateToReturn;
    } catch (e, stack) {
      log("Error creating initial state.", name: "fluids_form_bloc.dart");
      log(e.toString(), name: "fluids_form_bloc.dart");
      log(stack.toString(), name: "fluids_form_bloc.dart");
    }
  }

  /// Takes a [ProgramdatatracformState][state] and stores it in the cache memory.
  ///
  /// [author] Bailie Livingston.
  ///
  /// If a value returns an error, stores null instead of a value. Otherwise, stores a string representation of the value. Logs the stored values.
  ///
  /// If an error is thrown, it catches the error and logs it.
  @override
  // TODO Look into the above eslint issue.
  // ignore: body_might_complete_normally_nullable
  Map<String, dynamic>? toJson(FluidsformState state) {
    if (state.isSubmitting == true) {
      log("State being stored: $state",
          name: "fluids_form_bloc.dart");
      try {
        final Map<String, dynamic> theMap = {
          "oilType": state.oilType,
          "oilVisc": state.oilVisc,
          "coolantType": state.coolantType,
          "coolantQuantity": state.coolantQuantity,
          "atfType": state.atfType,
          "atfQuantity": state.atfQuantity,
          "defType": state.defType,
          "defQuantity": state.defQuantity,
          "fuelType": state.fuelType,
          "fuelQuantity": state.fuelQuantity,
          "oilQuantity": state.oilQuantity,
          "modelAndFuel": state.modelAndFuel,
          "vehId": state.vehId,
        };
        log("Storing state.", name: 'fluids_form_bloc.dart');
        log("Stored state: $theMap", name: 'fluids_form_bloc.dart');
        return theMap;
      } catch (e) {
        log("Error: $e", name: "fluids_form_bloc.dart");
        log("State failed to be stored: state",
            name: "fluids_form_bloc.dart");
      }
    }
  }
}
