// ignore_for_file: avoid_print, prefer_const_constructors
import 'dart:developer';

import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/i_program_datatrac_repo.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac_failures.dart';
import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/domain/distance/distance.dart';
import 'package:bluefang/src/domain/modelandfuel/model_and_fuel.dart';
import 'package:bluefang/src/domain/sensor/sensor.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/domain/site/site.dart';
import 'package:bluefang/src/domain/site/site_value_objects.dart';
import 'package:bluefang/src/domain/vehicle/vehicle.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_en.dart';
import 'package:bluefang/src/infrastructure/core/repository/i_cache.dart';
import 'package:bluefang/src/infrastructure/vehicle/vehicle_dtos.dart';
import 'package:bluefang/src/infrastructure/vinParsing/vin_dto.dart';
import 'package:bluefang/src/infrastructure/vinParsing/vin_parsing_repository.dart';
import 'package:custom_vin_decoder/vin_decoder.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'programdatatracform_bloc.freezed.dart';
part 'programdatatracform_event.dart';
part 'programdatatracform_state.dart';

/// Handles the bloc for the Programdatatracform screen.
/// Uses [HydratedBloc] to persist the state between app restarts and power cycles.
/// Takes [ProgramdatatracformEvent]s and returns [ProgramdatatracformState].
/// 
/// Requires a [IProgrammedDataTracRepository] to write the programmed datatrac to and a [VinParsingRepository] to pull relevant vehicle model information from.
@lazySingleton
class ProgramdatatracformBloc
    extends HydratedBloc<ProgramdatatracformEvent, ProgramdatatracformState> {
  final VinParsingRepository _vinParsingRepository;
  final ICache _localRepository;

  // Force the Hydrated Bloc to store the state as JSON data.
  bool forceToJson = false;

  /// Handles the bloc for the Programdatatracform screen.
  /// Uses [HydratedBloc] to persist the state between app restarts and power cycles.
  /// Takes [ProgramdatatracformEvent]s and returns [ProgramdatatracformState].
  ProgramdatatracformBloc(this._vinParsingRepository, this._localRepository)
      : super(ProgramdatatracformState.initial()) {
    on<Initialized>((event, emit) async {
      emit(event.initialProgramedDataTracOption.fold(() {
        log("Event DtID: ${event.dtID}");
        return state.copyWith(
            isEditing: false,
            showErrorMessages: true,
            programmedDataTrac: state.programmedDataTrac.copyWith(
              vehicle:
                  state.programmedDataTrac.vehicle.copyWith(dtId: event.dtID),
              sensor: state.programmedDataTrac.sensor.copyWith(
                  dtId: event.dtID,
                  dtIdHumanReadable:
                      DtIDHumanReadable(event.dtID.getOrCrash())),
              distance:
                  state.programmedDataTrac.distance.copyWith(dtId: event.dtID),
            ));
      }, (initialProgrammedDataTrac) {
        forceToJson = true;
        return state.copyWith(
            isEditing: true,
            isSubmitting: false,
            showErrorMessages: true,
            programmedDataTrac: initialProgrammedDataTrac);
      }));
      forceToJson = false;
    });

    on<VehicleNumberChanged>((event, emit) async {
      emit(state.copyWith(
        programmedDataTrac: state.programmedDataTrac.copyWith(
          vehicle: state.programmedDataTrac.vehicle.copyWith(
            vehId: VehID(event.vehicleNumberStr),
          ),
        ),
        saveFailureOrSuccessOption: none(),
      ));
    });

    on<VehicleModelYearChanged>((event, emit) async {
      emit(state.copyWith(
        programmedDataTrac: state.programmedDataTrac.copyWith(
          modelAndFuel: state.programmedDataTrac.modelAndFuel.copyWith(
            vehYear: VehYear(event.vehicleYearInt),
          ),
        ),
        saveFailureOrSuccessOption: none(),
      ));
    });

    on<VinNumberChanged>((event, emit) {
      emit(state.copyWith(
        programmedDataTrac: state.programmedDataTrac.copyWith(
          vehicle: state.programmedDataTrac.vehicle.copyWith(
            vinId: VinID(event.vinNumberStr),
          ),
        ),
        saveFailureOrSuccessOption: none(),
      ));
    });

    on<RevPerMilesChanged>((event, emit) async {
      log("New revs per dist: ${event.revPerMileInt}");
      emit(state.copyWith(
        programmedDataTrac: state.programmedDataTrac.copyWith(
          sensor: state.programmedDataTrac.sensor.copyWith(
            dtRpd: DtRPD(event.revPerMileInt),
          ),
        ),
        saveFailureOrSuccessOption: none(),
      ));
    });

    on<UomChanged>((event, emit) async {
      emit(state.copyWith(
        programmedDataTrac: state.programmedDataTrac.copyWith(
          sensor: state.programmedDataTrac.sensor.copyWith(
            dtUom: DtUOM(event.uomInt),
          ),
        ),
        saveFailureOrSuccessOption: none(),
      ));
    });

    on<PresetDistanceChanged>((event, emit) async {
      emit(state.copyWith(
        programmedDataTrac: state.programmedDataTrac.copyWith(
          distance: state.programmedDataTrac.distance.copyWith(
            dtLifeMiles: DtLifeMiles(event.presetDistanceInt),
          ),
        ),
        saveFailureOrSuccessOption: none(),
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
        saveFailureOrSuccessOption: none(),
      ));
    });

    on<FuelTypeChanged>((event, emit) async {
      emit(state.copyWith(
        programmedDataTrac: state.programmedDataTrac.copyWith(
          modelAndFuel: state.programmedDataTrac.modelAndFuel.copyWith(
            vehFuelType: VehFuelType(event.fuelTypeInt),
          ),
        ),
        saveFailureOrSuccessOption: none(),
      ));
    });
    on<FuelCapacityChanged>((event, emit) async {
      emit(state.copyWith(
        programmedDataTrac: state.programmedDataTrac.copyWith(
          modelAndFuel: state.programmedDataTrac.modelAndFuel.copyWith(
            vehFuelCapacity: VehFuelCapacity(event.fuelCapacityDouble),
          ),
        ),
        saveFailureOrSuccessOption: none(),
      ));
    });
    on<SiteChanged>((event, emit) async {
      emit(state.copyWith(
        programmedDataTrac: state.programmedDataTrac.copyWith(
          site: state.programmedDataTrac.site.copyWith(
            siteId: SiteID(event.siteIdInt),
          ),
        ),
        saveFailureOrSuccessOption: none(),
      ));
    });

    on<IsSubmittingChanged>((event, emit) async {
      emit(state.copyWith(isSubmitting: !state.isSubmitting));
    });

    /// Update the DtID for each piece of the datatrac
    on<DtIDChanged>((event, emit) async {});

    on<ChangedValues>((event, emit) async {
      emit(state.copyWith(changedValuesMap: event.valuesChanged));
    });

    /// Writes the datatrac to the database or reprograms an existing one.
    on<ProgramDataTrac>((event, emit) async {
      Option<ValueFailure<dynamic>> failure;
      failure = state.programmedDataTrac.failureOption;
      if (failure.isSome()) {
        emit(state.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          saveFailureOrSuccessOption: some(
            left(
              const ProgrammedDataTracFailure.invalidState(
                  err: 'Invalid Values'),
            ),
          ),
        ));
      } else {
        VIN? vin;
        VinID? vinId;
        VinID9? vin9;
        VinDTO? makeAndType;
        String modelId = "Unknown";
        int? year;
        if (state.programmedDataTrac.vehicle.vinId.getOrCrash().length > 1){
          log("Processing vin.");
          //Calculate VIN9 and fill out the rest of the model n fuel object
          vin = VIN(vin: state.programmedDataTrac.vehicle.vinId.getOrCrash(), extended: true);
          vin9 = VinID9.fromVinId(state.programmedDataTrac.vehicle.vinId.getOrCrash());
          VinDTO? makeAndType = await _vinParsingRepository.getMakeNoAndVehType(wmi: vin.wmi);
          //UPDATE to pull from NHTSA api
          makeAndType ??= VinDTO(vehType: ReferenceTableDataEN.vehTypeByName[(await vin.getVehicleTypeAsync())] ?? 0, makeNo: await vin.getMakeIdAsync());
          modelId = await vin.getModelAsync();
          year = vin.getYear() - 2000; 
          if (year < 1) {
            year = 01;
          }
        }

        if (state.programmedDataTrac.vehicle.vinId.getOrCrash().length == 1){
        log("VIN was 0; calculating fake VIN.", name: "programdatatracform_bloc.dart");
        final largestVin = await _localRepository.rawQuery("SELECT max(${VehicleDBFields.vinId}) FROM ${VehicleDBFields.tableName} WHERE ${VehicleDBFields.vinId} LIKE ${VinID.fakeWMI()}%");
        log("Largest vin: ${largestVin.getOrElse(() => [{VehicleDBFields.vinId : "None found"}])}");
        //if (largestVin.getOrElse(() => [{VehicleDBFields.vinId : null}]).first[VehicleDBFields.vinId] != null){
          final int incrementingChar = (int.tryParse((largestVin.getOrElse(() => [{VehicleDBFields.vinId : null}]).first[VehicleDBFields.vinId] as String? ?? "00000000000000000").substring(16)) ?? 0) + 1;
          final String wmi = (largestVin.getOrElse(() => [{VehicleDBFields.vinId : null}]).first[VehicleDBFields.vinId] as String?)?.substring(0, 3) ?? VinID.fakeWMI();
          //Fix to include the incrementing char in the pulled-from-db version, too
          vinId = VinID("$wmi$incrementingChar${(largestVin.getOrElse(() => [{VehicleDBFields.vinId : null}]).first[VehicleDBFields.vinId] as String?)?.substring(4, 16) ?? "000000000000"}$incrementingChar", bypassVerification: true); 
          log("Fake vin: $vin", name: "programdatatracform_bloc.dart");
          vin9 = VinID9.fromVinId(vinId.value.fold((l) => "000000000", (r) => r));
        //}
      }

        emit(state.copyWith(
          isSubmitting: true,
          programmedDataTrac: state.programmedDataTrac.copyWith(
            sensor: state.programmedDataTrac.sensor.copyWith(
              userIdMod: UserID(event.userIDInt),
              dateTimeMod: DateTimeMod.now(),
            ),
            modelAndFuel: state.programmedDataTrac.modelAndFuel.copyWith(
              vinId9: vin9 ?? VinID9.fromVinId(vinId?.value.fold((l) => "000000000", (r) => r) ?? "00000000000000000"),
              vehMake: VehMake(makeAndType?.makeNo ?? 0),
              vehType: Byte(makeAndType?.vehType ?? 0),
              vehModelId: VehModelID(modelId),
              vehYear: VehYear(year ?? state.programmedDataTrac.modelAndFuel.vehYear.getOrCrash()),
              dateTimeMod: DateTimeMod.now(),
            ),
            distance: state.programmedDataTrac.distance.copyWith(
              dateTimeMod: DateTimeMod.now(),

            ),
            vehicle: state.programmedDataTrac.vehicle.copyWith(
              dateTimeMod: DateTimeMod.now(),
              vinId: vin == null ? (vinId ?? VinID("00000000000000000")) : state.programmedDataTrac.vehicle.vinId
            ),
          ),
          saveFailureOrSuccessOption: none(),
        ));

        await Future.delayed(Duration(milliseconds: 500));
        emit(state.copyWith(
          isSubmitting: false,
          showErrorMessages: true,
        ));
      }
    });
  }

  /// Takes a [Map]<String, dynamic> and returns a [ProgramdatatracformState].
  ///
  /// The returned state could be null.
  ///
  /// If any of the values retrieved from the database are null, it uses the default values instead.
  /// Any errors are logged along with the stack trace.
  @override
  // TODO look into the above eslint issue.
  // ignore: body_might_complete_normally_nullable
  ProgramdatatracformState? fromJson(Map<String, dynamic> json) {
    ProgramdatatracformState stateToReturn = ProgramdatatracformState.initial();
    log("fromJson", name: "programdatatracform_bloc.dart");
    try {
      log(json.toString(), name: "programdatatracform_bloc.dart");
      stateToReturn = ProgramdatatracformState(

          ///
          isEditing: false,
          isSubmitting: false,
          showErrorMessages: false,
          saveFailureOrSuccessOption:
              ProgramdatatracformState.initial().saveFailureOrSuccessOption,
          programmedDataTrac: ProgrammedDataTrac(
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
              vehLength: VehLength(1),
              vehClass: VehClass(1),
              vehCustomJpg: ImgPath('0'),
              vehStockJpg: ImgPath('0'),
            ),
            distance: Distance(
              dtId: DtID((json["dtId"] as String?) == null
                  ? 0
                  : int.parse(json["dtId"] as String)),
              dateTimeMod: DateTimeMod(DateTime.now()),
              dateTimeRep: DateTimeMod(DateTime.now()),
              gpsLat: GpsLat(0),
              gpsLon: GpsLon(0),
              userIdMod: UserID(0),
              userIdRep: UserID(0),
              dtLifeMiles: DtLifeMiles((json["dtLifeMiles"] as String?) == null
                  ? 0
                  : int.parse(json["dtLifeMiles"] as String)),
            ),
            vehicle: Vehicle(
              userIdMod: UserID(0),
              userIdRep: UserID(0),
              dtId: DtID((json["dtId"] as String?) == null
                  ? 0
                  : int.parse(json["dtId"] as String)),
              vinId: VinID((json["vinId"] as String?) == null
                  ? "00000000000000000"
                  : json["vinId"] as String),
              vehId: VehID((json["vehId"] as String?) == null
                  ? ""
                  : json["vehId"] as String),
              dateTimeMod: DateTimeMod(DateTime.now()),
              dateTimeRep: DateTimeMod(DateTime.now()),
              siteId: SiteID((json["siteId"] as String?) == null
                  ? 0
                  : int.parse(json["siteId"] as String)),
              vehPlateId: VehPlateID((json["vehPlateId"] as String?) == null
                  ? ""
                  : json["vehPlateId"] as String),
            ),
            sensor: Sensor(
              dtSecure: DtSecure(0),
              dtBtRaw: "null",
              dtModCount: DtModCount(0),
              dtFirmVerBT5Ap: DtFirmVerBT5Ap(0),
              dtFirmVerBT5Sdk: DtFirmVerBT5Sdk(0),
              dtFirmVerMsp: DtFirmVerMsp(0),
              dtLocked: DtLocked(0),
              dtId: DtID((json["dtId"] as String?) == null
                  ? 0
                  : int.parse(json["dtId"] as String)),
              dtIdHumanReadable: DtIDHumanReadable(
                  (json["dtId"] as String?) == null
                      ? 0
                      : int.parse(json["dtId"] as String)),
              userIdMod: UserID(0),
              userIdRep: UserID(0),
              dtUom: DtUOM((json["distUom"] as String?) == null
                  ? 0
                  : int.parse(json["distUom"] as String)),
              dtLoBat: DtLoBat(0),
              // TODO: Figure out a better way to get this value
              dtReprogrammable: DtReprogrammable(0),
              dtRpd: DtRPD((json["dtRpd"] as String?) == null
                  ? 0
                  : int.parse(json["dtRpd"] as String)),
              dateTimeMod: DateTimeMod(DateTime.now()),
              dateTimeRep: DateTimeMod(DateTime.now()),
            ),
            site: Site(
              dateTimeMod: DateTimeMod(DateTime.now()),
              gpsLat: GpsLat(0),
              gpsLatTol: GpsLocTol(0),
              gpsLon: GpsLon(0),
              gpsLonTol: GpsLocTol(0),
              userIdMod: UserID(0),
              siteId: SiteID((json["siteId"] as String?) == null
                  ? 200
                  : int.parse(json["siteId"] as String)),
              siteName: SiteName((json["siteName"] as String?) == null
                  ? ""
                  : json["siteName"] as String),
            ),
          ),
          storeInBloc: false,
          changedValuesMap: {});

      log("State pulled from hydrated bloc: ${ProgramdatatracformState.formattedToString(stateToReturn)}",
          name: "programdatatracform_bloc.dart");
      // if (state.programmedDataTrac != ProgrammedDataTrac.empty()){
      //   log("Data trac was not empty; not returning state.");
      //   return null;
      // }
      return stateToReturn;
    } catch (e, stack) {
      log("Error creating initial state.",
          name: "programdatatracform_bloc.dart");
      log(e.toString(), name: "programdatatracform_bloc.dart");
      log(stack.toString(), name: "programdatatracform_bloc.dart");
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
  // TODO Look into the ESlint issue.
  // ignore: body_might_complete_normally_nullable
  Map<String, dynamic>? toJson(ProgramdatatracformState state) {
    //log("Is submitting? ${state.isSubmitting}; forceToJson? $forceToJson", name: "programdatatracform_bloc.dart");
    if (state.isSubmitting == true || forceToJson == true) {
      log("State being stored: ${ProgramdatatracformState.formattedToString(state)}",
          name: "programdatatracform_bloc.dart");
      try {
        final Map<String, dynamic> theMap = {
          /// Vehicle
          'vehId': state.programmedDataTrac.vehicle.vehId.getOrCrash(),
          'vehPlateId': state.programmedDataTrac.vehicle.vehPlateId.value
              .fold((l) => null, (r) => r),
          'vinId': state.programmedDataTrac.vehicle.vinId.value
              .fold((l) => null, (r) => r),

          'dateTimeRep': state.programmedDataTrac.vehicle.dateTimeRep.value
              .fold((l) => null, (r) => r.toString()),
          'dtLifeMiles': state.programmedDataTrac.distance.dtLifeMiles.value
              .fold((l) => null, (r) => r.toString()),

          /// Sensor
          'dtRpd': state.programmedDataTrac.sensor.dtRpd.value
              .fold((l) => null, (r) => r.toString()),
          'dtUom': state.programmedDataTrac.sensor.dtUom.value
              .fold((l) => null, (r) => r.toString()),
          'dtId': state.programmedDataTrac.sensor.dtId.value
              .fold((l) => null, (r) => r.toString()),

          /// Site
          'siteId': state.programmedDataTrac.site.siteId.value
              .fold((l) => null, (r) => r.toString()),
          'siteName': state.programmedDataTrac.site.siteName.value
              .fold((l) => null, (r) => r),

          /// Model and Fuel
          'vehYear': state.programmedDataTrac.modelAndFuel.vehYear.value
              .fold((l) => null, (r) => r.toString()),
          'vehFuelCapacity': state
              .programmedDataTrac.modelAndFuel.vehFuelCapacity.value
              .fold((l) => null, (r) => r.toString()),
          'vehFuelType': state.programmedDataTrac.modelAndFuel.vehFuelType.value
              .fold((l) => null, (r) => r.toString()),
        };
        // log("Storing state.", name: 'programdatatracform_bloc.dart');
        // log("Stored state: $theMap", name: 'programdatatracform_bloc.dart');
        return theMap;
      } catch (e) {
        log("Error: $e", name: "programdatatracform_bloc.dart");
        log("State failed to be stored: ${ProgramdatatracformState.formattedToString(state)}",
            name: "programdatatracform_bloc.dart");
      }
    }
  }
}
