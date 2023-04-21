// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors

part of 'addvehicle_bloc.dart';

@freezed
class AddVehicleState with _$AddVehicleState {
  const factory AddVehicleState({
    required bool isSubmitting,
    required bool showErrorMessages,
    required bool isEditing,
    required bool storeInBloc,
    required Map<String, dynamic> changedValuesMap,
    required Vehicle vehicle,
    required ModelAndFuel modelAndFuel,
    required Site site,
  }) = _AddVehicleState;

  factory AddVehicleState.initial() => AddVehicleState(
      isSubmitting: false,
      isEditing: false,
      showErrorMessages: false,
      storeInBloc: false,
      changedValuesMap: {},
      vehicle: Vehicle.empty(),
      modelAndFuel: ModelAndFuel.empty(),
      site: Site.empty()
  );
}
