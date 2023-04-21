// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part "demo_mode_event.dart";
part "demo_mode_state.dart";
part "demo_mode_bloc.freezed.dart";

@lazySingleton
class DemoModeBloc extends HydratedBloc<DemoModeEvent, DemoModeState> {
  bool rebooted = true;
  //Intialized in _Started event handler
  SharedPreferences? prefs;

  DemoModeBloc() : super(DemoModeState.initial()) {
    on<_Started>((event, emit) async {
      prefs ??= await SharedPreferences.getInstance();
      log("DemoModeBloc started.");
      emit(state.copyWith(isDemo: prefs?.getBool("demoMode") ?? false));
      log("state.isDemo: ${state.isDemo}");
      //rebooted = false;
    });
    on<_ValueChanged>((event, emit) async {
      prefs ??= await SharedPreferences.getInstance();
      await prefs?.setBool("demoMode", event.newValue);
      log("isDemo changed to ${event.newValue}");

      emit(state.copyWith(isDemo: event.newValue));
    });
  }

  @override
  DemoModeState? fromJson(Map<String, dynamic> json) {
    final bool demoMode = (json["demoMode"] as bool?) ?? false;
    //if (!rebooted){
    return DemoModeState(isDemo: demoMode);
    // }
    // else {
    //   return DemoModeState(isDemo: false);
    // }
  }

  @override
  Map<String, dynamic>? toJson(DemoModeState state) {
    prefs?.setBool("demoMode", state.isDemo);
    //if (state is! _Started){
    return {"demoMode": state.isDemo};
    // }
    // else {
    //   return {
    //     "demoMode":false
    //   };
    // }
  }
}
