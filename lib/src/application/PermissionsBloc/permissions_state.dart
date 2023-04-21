// ignore_for_file: prefer_const_constructors

part of 'permissions_bloc.dart';

@freezed
class PermissionsState with _$PermissionsState {
  const factory PermissionsState({
    required bool permissionsRequested,
  }) = _PermissionsState;
  factory PermissionsState.initial() => PermissionsState(permissionsRequested: false);
}
