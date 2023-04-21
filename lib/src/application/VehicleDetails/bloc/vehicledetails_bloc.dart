// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/i_program_datatrac_repo.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac_failures.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'vehicledetails_event.dart';
part 'vehicledetails_state.dart';
part 'vehicledetails_bloc.freezed.dart';

@injectable
/// Bloc handler for the Vehicle Details screen.
///
/// [author] Bailie Livingston.
/// Establishes the bloc to handle the [VehicledetailsEvent]s and [VehicledetailsState]s.
class VehicledetailsBloc
    extends Bloc<VehicledetailsEvent, VehicledetailsState> {
  final IProgrammedDataTracRepository _programmedDataTracRepository;

  Either<ProgrammedDataTracFailure, ProgrammedDataTrac>? response;
  ProgrammedDataTrac? theDataTrac;
  VehicledetailsState? newState;

  VehicledetailsBloc(this._programmedDataTracRepository)
      : super(VehicledetailsState.initial()) {
    /// Called when the bloc is created or initialized.
    on<_Started>((event, emit) async {
      try {
        response =
            await _programmedDataTracRepository.find(dtID: DtID(1771095780));
        response!.fold((Failure) {
          log("Failed to find datatrac.", name: 'vehicledetails_bloc.dart');
        }, (dataTrac) {
          theDataTrac = dataTrac;
        });

        if (theDataTrac == null) {
          log("**** The data trac was null! *****",
              name: "vehicledetails_bloc.dart");
        } else {
          newState = state.copyWith(
              programmedDataTrac: theDataTrac!, isLoading: false);
          emit(newState!);
        }
        //Catches anything, not just things that are a subtype of Exception.
      } catch (e, s) {
        log("Error finding datatrac.",
            name: "vehicledetails_bloc._Started", error: e, stackTrace: s);
      }
    });

    ///Triggered when a [VehicleDetailsEvent.displayVehicle()] call is issued.
    on<_FindVehicle>((event, emit) async {
      try {
        response =
            await _programmedDataTracRepository.find(dtID: event.dataTracID);
        response!.fold((Failure) {
          log("Failed to find datatrac. $Failure");
        }, (dataTrac) {
          theDataTrac = dataTrac;
        });

        if (theDataTrac == null) {
          log("**** The data trac was null! *****",
              name: "vehicledetails_bloc.dart");
        } else {
          newState = state.copyWith(
              programmedDataTrac: theDataTrac!, isLoading: false);
          emit(newState!);
        }
      } catch (e) {
        log("There was an error processing the DisplayVehicle event.",
            name: "vehicledetails_bloc.dart");
      }
    });
  }
}
