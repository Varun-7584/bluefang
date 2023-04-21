// ignore_for_file: avoid_print, prefer_const_constructors, body_might_complete_normally_nullable
import 'dart:developer';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/i_program_datatrac_repo.dart';
import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/domain/modelandfuel/model_and_fuel.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/domain/site/site.dart';
import 'package:bluefang/src/domain/site/site_value_objects.dart';
import 'package:bluefang/src/domain/vehicle/vehicle.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'addvehicle_state.dart';
part 'addnewvehicle_event.dart';

part 'addvehicle_bloc.freezed.dart';

/// Handles the bloc for the Programdatatracform screen.
/// Uses [HydratedBloc] to persist the state between app restarts and power cycles.
/// Takes [ProgramdatatracformEvent]s and returns [ProgramdatatracformState].

@injectable
class AddVehicleBloc extends HydratedBloc<AddVehicleEvent, AddVehicleState> {
  // ignore: unused_field
  final IProgrammedDataTracRepository _programmedDataTracRepository;
  // Force the Hydrated Bloc to store the state as JSON data.
  bool forceToJson = false;

  AddVehicleBloc(this._programmedDataTracRepository)
      : super(AddVehicleState.initial()) {
    on<Initialized>((event, emit) async {
      emit(
        state.copyWith(isEditing: true, isSubmitting: false),
      );
    });

    on<VehicleNumberChanged>((event, emit) async {
      emit(state.copyWith(
        vehicle: state.vehicle.copyWith(
          vehId: VehID(event.vehicleNumberStr),
        ),
      ));
    });

    on<VinNumberChanged>((event, emit) {
      emit(state.copyWith(
        vehicle: state.vehicle.copyWith(
          vinId: VinID(event.vinNumberStr),
        ),
      ));
    });

    on<VehicleLicensePlateNumberChanged>((event, emit) async {
      log("License plate number changed.");
      emit(state.copyWith(
        vehicle: state.vehicle.copyWith(
          vehPlateId: VehPlateID(event.vehLicensePlateStr),
        ),
      ));
    });

    on<FuelTypeChanged>((event, emit) async {
      emit(state.copyWith(
        modelAndFuel: state.modelAndFuel.copyWith(
          vehFuelType: VehFuelType(event.fuelTypeInt),
        ),
      ));
    });

    on<FuelCapacityChanged>((event, emit) async {
      emit(state.copyWith(
        modelAndFuel: state.modelAndFuel.copyWith(
          vehFuelCapacity: VehFuelCapacity(event.fuelCapacityDouble),
        ),
      ));
    });

    on<VehicleModelYearChanged>((event, emit) async {
      emit(state.copyWith(
        modelAndFuel: state.modelAndFuel.copyWith(
          vehYear: VehYear(event.vehicleModelYear),
        ),
      ));
    });

    on<SiteChanged>((event, emit) async {
      emit(state.copyWith(
        vehicle: state.vehicle.copyWith(siteId: SiteID(event.siteIdInt)),
      ));
    });

    on<IsSubmittingChanged>((event, emit) async {
      emit(state.copyWith(isSubmitting: !state.isSubmitting));
    });

    on<ChangedValues>((event, emit) async {
      emit(state.copyWith(changedValuesMap: event.valuesChanged));
    });

    /// Writes the datatrac to the database or reprograms an existing one.
  }

  /// Takes a [Map]<String, dynamic> and returns a [AddVehicleState].
  ///
  /// The returned state could be null.
  ///
  /// If any of the values retrieved from the database are null, it uses the default values instead.
  /// Any errors are logged along with the stack trace.
  @override
  AddVehicleState? fromJson(Map<String, dynamic> json) {
    AddVehicleState stateToReturn = AddVehicleState.initial();
    //log("fromJson", name: "AddVehicle_bloc.dart");
    try {
      //log(json.toString(), name: "AddVehicle_bloc.dart");
      stateToReturn = AddVehicleState(
          isEditing: true,
          isSubmitting: false,
          showErrorMessages: false,
          modelAndFuel: ModelAndFuel(
            userIdMod: UserID(0),
            userIdRep: UserID(0),
            dateTimeMod: DateTimeMod(DateTime.now()),
            dateTimeRep: DateTimeMod(DateTime.now()),
            vinId9: VinID9(''),
            vehModelId: VehModelID(''),
            vehMake: VehMake(0),
            vehYear: VehYear((json["vehYear"] as String?) == null
                ? 01
                : int.parse(json["vehYear"] as String)),
            vehType: Byte(0),
            vehBody: Byte(255),
            vehFuelType: VehFuelType((json["vehFuelType"] as String?) == null
                ? 01
                : int.parse(json["vehFuelType"] as String)),
            vehFuelCapacity: VehFuelCapacity(
                (json["vehFuelCapacity"] as String?) == null
                    ? 0
                    : int.parse(json["vehFuelCapacity"] as String)),
            vehOilType: Byte(0),
            vehOilVisc: Byte(0),
            vehCoolantType: Byte(0),
            vehAtfType: Byte(0),
            vehLength: VehLength(0),
            vehClass: VehClass(0),
            vehCustomJpg: ImgPath(''),
            vehStockJpg: ImgPath(''),
          ),
          vehicle: Vehicle(
            userIdMod: UserID(0),
            userIdRep: UserID(0),
            dtId: DtID((json["vehDtId"] as String?) == null
                ? 0
                : int.parse(json["vehDtId"] as String)),
            vinId: VinID((json["vinId"] as String?) == null
                ? "00000000000000000"
                : json["vinId"] as String),
            vehId: VehID((json["vehId"] as String?) == null
                ? ""
                : json["vehId"] as String),
            dateTimeMod: DateTimeMod(DateTime.now()),
            dateTimeRep: DateTimeMod(DateTime.now()),
            siteId: SiteID((json["siteId"] as int?) ?? 0),
            vehPlateId: VehPlateID((json["vehPlateId"] as String?) == null
                ? ""
                : json["vehPlateId"] as String),
          ),
          site: Site.empty().copyWith(
            siteName: SiteName(json["siteName"] as String? ?? "Home Base Site"),
            siteId: SiteID((json["siteId"] as int?) ?? 0),
          ),
          storeInBloc: false,
          changedValuesMap: {});

      log("State pulled from hydrated bloc: $stateToReturn",
          name: "AddVehicle_bloc.dart");
      return stateToReturn;
    } catch (e, stack) {
      log("Error creating initial state.", name: "AddVehicle_bloc.dart");
      log(e.toString(), name: "AddVehicle_bloc.dart");
      log(stack.toString(), name: "AddVehicle_bloc.dart");
    }
  }

  /// Takes a [AddVehicleState][state] and stores it in the cache memory.
  ///
  /// [author] Bailie Livingston.
  ///
  /// If a value returns an error, stores null instead of a value. Otherwise, stores a string representation of the value. Logs the stored values.
  ///
  /// If an error is thrown, it catches the error and logs it.
  @override
  Map<String, dynamic>? toJson(AddVehicleState state) {
    //log("Is submitting? ${state.isSubmitting}; forceToJson? $forceToJson", name: "AddVehicle_bloc.dart");
    if (state.isSubmitting == true || forceToJson == true) {
      log("Is submitting: ${state.isSubmitting}; forceToJson: $forceToJson");
      //log("State being stored: $state",
      //name: "AddVehicle_bloc.dart");
      try {
        final Map<String, dynamic> theMap = {
          /// Vehicle
          'vehId': state.vehicle.vehId.getOrCrash(),
          'vehPlateId':
              state.vehicle.vehPlateId.value.fold((l) => null, (r) => r),
          'vinId': state.vehicle.vinId.value.fold((l) => null, (r) => r),

          /// Model and Fuel
          'vehYear': state.modelAndFuel.vehYear.value
              .fold((l) => null, (r) => r.toString()),
          'vehFuelCapacity': state.modelAndFuel.vehFuelCapacity.value
              .fold((l) => null, (r) => r.toString()),
          'vehFuelType': state.modelAndFuel.vehFuelType.value
              .fold((l) => null, (r) => r.toString()),

          /// Site
          "siteId": state.site.siteId.value.fold((l) => null, (r) => r),
          "siteName": state.site.siteName.value.fold((l) => null, (r) => r),
        };
        // log("Storing state.", name: 'AddVehicle_bloc.dart');
        // log("Stored state: $theMap", name: 'AddVehicle_bloc.dart');
        return theMap;
      } catch (e) {
        log("Error: $e", name: "AddVehicle_bloc.dart");
        log("State failed to be stored: $state", name: "AddVehicle_bloc.dart");
      }
    }
  }
}
