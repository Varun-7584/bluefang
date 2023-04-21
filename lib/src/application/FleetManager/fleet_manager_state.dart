part of 'fleet_manager_bloc.dart';

@freezed
class FleetManagerState with _$FleetManagerState {
  const factory FleetManagerState({
    required KtMutableList<VehicleInfo> vehicleList,
    required KtMutableList<Sensor> datatracList,
    required bool descendingSort,
    required VehicleListSortOrder currentSort,
    required List<List<VehicleInfo>> vehByType,
    required bool listForm,
    required bool showInRangeVehicles,
  }) = _FleetManagerState;
  factory FleetManagerState.initial() => FleetManagerState(
    vehicleList: KtMutableList<VehicleInfo>.empty(),
    datatracList: KtMutableList<Sensor>.empty(),
    descendingSort: false,
    currentSort: VehicleListSortOrder.none,
    vehByType: [],
    listForm: true,
    showInRangeVehicles: false
  );

}
