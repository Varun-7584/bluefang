// ignore_for_file: avoid_print, prefer_const_constructors
import 'dart:developer';

import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/i_program_datatrac_repo.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac_failures.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
part 'editvehicle_event.dart';
part 'editvehicle_state.dart';

part 'editvehicle_bloc.freezed.dart';

/// Handles the bloc for the EditVehicle screen.
/// Uses [HydratedBloc] to persist the state between app restarts and power cycles.
/// Takes [EditVehicleEvent]s and returns [EditVehicleState].

@injectable
class EditVehicleBloc extends Bloc<EditVehicleEvent, EditVehicleState> {
  // ignore: unused_field
  final IProgrammedDataTracRepository _programmedDataTracRepository;

  EditVehicleBloc(this._programmedDataTracRepository)
      : super(EditVehicleState.initial()) {
    on<Initialized>((event, emit) async {
      log("Initializing EditVehicleBloc");
      if (state.programmedDataTrac.vehicle.vehId == ProgrammedDataTrac.empty().vehicle.vehId){
        emit(state.copyWith(
          isEditing: true,
          programmedDataTrac: event.programmedDataTrac,
          isInitialized: true
        ));
      }
    });

    on<VehicleNumberChanged>((event, emit) async {
      emit(
        state.copyWith(
          programmedDataTrac: state.programmedDataTrac.copyWith(
            vehicle: state.programmedDataTrac.vehicle.copyWith(
              vehId: VehID(event.vehicleNumberStr),
            ),
          ),
        )
      );
    });

    on<VinNumberChanged>((event, emit) {
      emit(state.copyWith(
        programmedDataTrac: state.programmedDataTrac.copyWith(
          vehicle: state.programmedDataTrac.vehicle.copyWith(
            vinId: VinID(event.vinNumberStr),
          ),
        ),
      ));
    });

    on<VehicleLicensePlateNumberChanged>((event, emit) async {
      log("License plate number changed.");
      emit(state.copyWith(
        programmedDataTrac: state.programmedDataTrac.copyWith(
          vehicle: state.programmedDataTrac.vehicle.copyWith(
            vehPlateId: VehPlateID(event.vehLicensePlateStr),
          ),
        ),
      ));
    });

    on<FuelTypeChanged>((event, emit) async {
      emit(state.copyWith(
        programmedDataTrac: state.programmedDataTrac.copyWith(
          modelAndFuel: state.programmedDataTrac.modelAndFuel.copyWith(
            vehFuelType: VehFuelType(event.fuelTypeInt),
          ),
        ),
      ));
    });

    on<FuelCapacityChanged>((event, emit) async {
      emit(state.copyWith(
        programmedDataTrac: state.programmedDataTrac.copyWith(
          modelAndFuel: 
            state.programmedDataTrac.modelAndFuel.copyWith(
              vehFuelCapacity: VehFuelCapacity(event.fuelCapacityDouble),
          ),
        ),
      ));
    });

    on<VehicleModelYearChanged>((event, emit) async {
      emit(state.copyWith(
        programmedDataTrac: state.programmedDataTrac.copyWith(
          modelAndFuel: 
            state.programmedDataTrac.modelAndFuel.copyWith(
              vehYear: VehYear(event.vehicleModelYear),
          ),
        ),
      ));
    });

    on<PresetDistanceChanged>((event, emit) async {
      emit(state.copyWith(
        programmedDataTrac: state.programmedDataTrac.copyWith(
          distance: 
            state.programmedDataTrac.distance.copyWith(
              dtLifeMiles: DtLifeMiles(event.newDistance),
          ),
        ),
      ));
    });

    on<UomChanged>((event, emit) async {
      emit(state.copyWith(
        programmedDataTrac: state.programmedDataTrac.copyWith(
          sensor: 
            state.programmedDataTrac.sensor.copyWith(
              dtUom: DtUOM(event.newUom),
          ),
        ),
      ));
    });

    on<IsSubmittingChanged>((event, emit) async {
      emit(state.copyWith(isSubmitting: !state.isSubmitting));
    });

    on<ChangedValues>((event, emit) async{
      emit(state.copyWith(changedValuesMap: event.valuesChanged));
    });

  }

}
