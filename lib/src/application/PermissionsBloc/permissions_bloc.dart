// ignore_for_file: prefer_const_constructors
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part "permissions_event.dart";
part "permissions_state.dart";
part "permissions_bloc.freezed.dart";

@lazySingleton
class PermissionsBloc extends HydratedBloc<PermissionsEvent, PermissionsState> {

  PermissionsBloc() : super(PermissionsState.initial()) {

    on<_PermissionsRequested>((event, emit){
      emit(state.copyWith(permissionsRequested: true));
    });

  }

  @override
  PermissionsState? fromJson(Map<String, dynamic> json) {
    final bool permissionsRequested = (json["permissionsRequested"] as bool?) ?? false;
    return PermissionsState(permissionsRequested: permissionsRequested);
  }

  @override
  Map<String, dynamic>? toJson(PermissionsState state) {
    return {"permissionsRequested": state.permissionsRequested};
  }
}
