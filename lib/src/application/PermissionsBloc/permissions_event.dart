// ignore_for_file: avoid_positional_boolean_parameters

part of "permissions_bloc.dart";

@freezed
class PermissionsEvent with _$PermissionsEvent {
  const factory PermissionsEvent.permissionsRequested() = _PermissionsRequested;
}
