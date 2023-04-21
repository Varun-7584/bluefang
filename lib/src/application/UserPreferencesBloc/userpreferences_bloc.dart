// ignore_for_file: prefer_const_constructors, unnecessary_statements, avoid_void_async, avoid_print

// ignore: unused_import
import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'userpreferences_event.dart';
part 'userpreferences_state.dart';
part 'userpreferences_bloc.freezed.dart';

@injectable
@Singleton()

/// Needs to remain a HydratedBloc even though SharedPreferences is doing most of the work. It won't update the checkbow displays correctly otherwise.
class UserPreferencesBloc
    extends HydratedBloc<UserPreferencesEvent, UserPreferencesState> {
  //Intialized in _Started event handler
  SharedPreferences? prefs;
  String prefix = "sync";

  /// Event handler for the user preferences.
  ///
  /// These are set in several places in the app, usually settings screens.
  UserPreferencesBloc() : super(UserPreferencesState.initial()) {
    on<_Started>((event, emit) async {
      //This isn't sticking once execution leaves this method, but pref is now initialized inside this method
      prefs = await SharedPreferences.getInstance();
      emit(UserPreferencesState(
          fuelUOM: prefs?.getInt("$prefix-fuelUOM") ?? 0,
          atfUOM: prefs?.getInt("$prefix-atfUOM") ?? 0,
          oilUOM: prefs?.getInt("$prefix-oilUOM") ?? 0,
          coolantUOM: prefs?.getInt("$prefix-coolantUOM") ?? 0,
          enableFuelField: prefs?.getBool("$prefix-enableFuelField") ?? false,
          enableLicensePlateField:
              prefs?.getBool("$prefix-enableLicensePlateField") ?? false,
          enableAtfField: prefs?.getBool("$prefix-enableAtfField") ?? true,
          enableCoolantField:
              prefs?.getBool("$prefix-enableCoolantField") ?? true,
          enableOilField: prefs?.getBool("$prefix-enableOilField") ?? true,
          enableDefField: prefs?.getBool("$prefix-enableDefField") ?? true));
    });

    on<FuelUomChanged>((event, emit) async {
      prefs ??= await SharedPreferences.getInstance();
      prefs?.setInt("$prefix-fuelUOM", event.uomIndex);
      emit(state.copyWith(
        fuelUOM: event.uomIndex,
      ));
    });
    on<CoolantUomChanged>((event, emit) async {
      prefs ??= await SharedPreferences.getInstance();
      prefs?.setInt("$prefix-coolantUOM", event.uomIndex);
      emit(state.copyWith(
        coolantUOM: event.uomIndex,
      ));
    });
    on<AtfUomChanged>((event, emit) async {
      prefs ??= await SharedPreferences.getInstance();
      prefs?.setInt("$prefix-atfUOM", event.uomIndex);
      emit(state.copyWith(
        atfUOM: event.uomIndex,
      ));
    });
    on<OilUomChanged>((event, emit) async {
      prefs ??= await SharedPreferences.getInstance();
      prefs?.setInt("$prefix-oilUOM", event.uomIndex);
      emit(state.copyWith(
        oilUOM: event.uomIndex,
      ));
    });
    on<EnableFuelInfo>((event, emit) async {
      prefs ??= await SharedPreferences.getInstance();
      prefs?.setBool("$prefix-enableFuelField", event.value);
      emit(state.copyWith(
        enableFuelField: event.value,
      ));
    });
    on<EnableLicensePlateInfo>((event, emit) async {
      prefs ??= await SharedPreferences.getInstance();
      prefs?.setBool("$prefix-enableLicensePlateField", event.value);
      emit(state.copyWith(
        enableLicensePlateField: event.value,
      ));
    });
    on<EnableAtfInfo>((event, emit) async {
      prefs ??= await SharedPreferences.getInstance();
      prefs?.setBool("$prefix-enableAtfField", event.value);
      emit(state.copyWith(
        enableAtfField: event.value,
      ));
    });
    on<EnableCoolantInfo>((event, emit) async {
      prefs ??= await SharedPreferences.getInstance();
      prefs?.setBool("$prefix-enableCoolantField", event.value);
      emit(state.copyWith(
        enableCoolantField: event.value,
      ));
    });
    on<EnableOilInfo>((event, emit) async {
      prefs ??= await SharedPreferences.getInstance();
      prefs?.setBool("$prefix-enableOilField", event.value);
      emit(state.copyWith(
        enableOilField: event.value,
      ));
    });
    on<EnableDefInfo>((event, emit) async {
      prefs ??= await SharedPreferences.getInstance();
      prefs?.setBool("$prefix-enableDefField", event.value);
      emit(state.copyWith(
        enableDefField: event.value,
      ));
    });
  }

  @override

  /// Handles retrieving data from the hydrated bloc
  UserPreferencesState? fromJson(Map<String, dynamic> json) {
    return UserPreferencesState(
      fuelUOM:
          (json["fuelUOM"] as int?) ?? prefs?.getInt("$prefix-fuelUOM") ?? 0,
      coolantUOM: (json["coolantUOM"] as int?) ??
          prefs?.getInt("$prefix-coolantUOM") ??
          0,
      atfUOM: (json["atfUOM"] as int?) ?? prefs?.getInt("$prefix-atfUOM") ?? 0,
      oilUOM: (json["oilUOM"] as int?) ?? prefs?.getInt("$prefix-oilUOM") ?? 0,
      enableFuelField: (json["enableFuelField"] as bool?) ??
          (prefs?.getBool("$prefix-enableFuelField")) ??
          true,
      enableLicensePlateField: (json["enableLicensePlateField"] as bool?) ??
          (prefs?.getBool("$prefix-enableLicensePlateField")) ??
          true,
      enableAtfField: (json["enableAtfField"] as bool?) ??
          (prefs?.getBool("$prefix-enableAtfField")) ??
          true,
      enableCoolantField: (json["enableCoolantField"] as bool?) ??
          (prefs?.getBool("$prefix-enableCoolantField")) ??
          true,
      enableOilField: (json["enableOilField"] as bool?) ??
          (prefs?.getBool("$prefix-enableOilField")) ??
          true,
      enableDefField: (json["enableDefField"] as bool?) ??
          (prefs?.getBool("$prefix-enableDefField")) ??
          true,
    );
  }

  @override

  /// Handles storing data in the hydrated bloc
  Map<String, dynamic>? toJson(UserPreferencesState state) {
    //Store information in shared_preferences as well
    prefs?.setInt("$prefix-fuelUOM", state.fuelUOM);
    prefs?.setInt("$prefix-coolantUOM", state.coolantUOM);
    prefs?.setInt("$prefix-atfUOM", state.atfUOM);
    prefs?.setInt("$prefix-oilUOM", state.oilUOM);
    prefs?.setBool("$prefix-enableFuelField", state.enableFuelField);
    prefs?.setBool(
        "$prefix-enableLicensePlateField", state.enableLicensePlateField);
    prefs?.setBool("$prefix-enableAtfField", state.enableAtfField);
    prefs?.setBool("$prefix-enableCoolantField", state.enableCoolantField);
    prefs?.setBool("$prefix-enableOilField", state.enableOilField);
    prefs?.setBool("$prefix-enableDefField", state.enableDefField);

    return {
      "fuelUOM": state.fuelUOM,
      "coolantUOM": state.coolantUOM,
      "atfUOM": state.atfUOM,
      "oilUOM": state.oilUOM,
      "enableFuelField": state.enableFuelField,
      "enableLicensePlateField": state.enableLicensePlateField,
      "enableAtfField": state.enableAtfField,
      "enableCoolantField": state.enableCoolantField,
      "enableOilField": state.enableOilField,
      "enableDefField": state.enableDefField,
    };
  }
}
