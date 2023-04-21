// ignore_for_file: avoid_positional_boolean_parameters

part of 'fleet_manager_bloc.dart';

@freezed
class FleetManagerEvent with _$FleetManagerEvent {
  const factory FleetManagerEvent.started(bool? listForm) = _Started;
  const factory FleetManagerEvent.getVehicleList({
    required VehicleListSortOrder sortedBy,
    required bool descending,
    required bool listForm,
  }) = _GetVehicleList;
  const factory FleetManagerEvent.getSensorList() = _GetSensorList;
  const factory FleetManagerEvent.refreshScreen() = _RefreshScreen;
  factory FleetManagerEvent.changeVehiclesShown({required bool showInRangeVehicles}) = _ChangeVehiclesShown; 
}
