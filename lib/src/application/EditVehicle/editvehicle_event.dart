// ignore_for_file: avoid_positional_boolean_parameters

part of 'editvehicle_bloc.dart';

/// Event object for the EditVehicle_bloc. 
@freezed
class EditVehicleEvent with _$EditVehicleEvent {
  const factory EditVehicleEvent.initialized(ProgrammedDataTrac programmedDataTrac) = Initialized;
  const factory EditVehicleEvent.vehicleNumberChanged(
      String vehicleNumberStr) = VehicleNumberChanged;
  const factory EditVehicleEvent.vinNumberChanged(String vinNumberStr) =
      VinNumberChanged;
  const factory EditVehicleEvent.vehicleLicensePlateNumberChanged(
      String vehLicensePlateStr) = VehicleLicensePlateNumberChanged;
  const factory EditVehicleEvent.fuelTypeChanged(int fuelTypeInt) =
      FuelTypeChanged;
  const factory EditVehicleEvent.fuelCapacityChanged(
      int fuelCapacityDouble) = FuelCapacityChanged;
  const factory EditVehicleEvent.vehicleModelYearChanged(int vehicleModelYear) =
      VehicleModelYearChanged;
  const factory EditVehicleEvent.presetDistanceChanged(int newDistance) =
      PresetDistanceChanged;
  const factory EditVehicleEvent.uomChanged(int newUom) =
      UomChanged;
  const factory EditVehicleEvent.isSubmittingChanged() =
      IsSubmittingChanged;
  const factory EditVehicleEvent.changedValues(Map<String, dynamic> valuesChanged) = ChangedValues;
}
