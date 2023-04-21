// ignore_for_file: avoid_positional_boolean_parameters

part of 'addvehicle_bloc.dart';

/// Event object for the programdatatracform_bloc. 
@freezed
class AddVehicleEvent with _$AddVehicleEvent {
  const factory AddVehicleEvent.initialized() = Initialized;
  const factory AddVehicleEvent.vehicleNumberChanged(
      String vehicleNumberStr) = VehicleNumberChanged;
  const factory AddVehicleEvent.vinNumberChanged(String vinNumberStr) =
      VinNumberChanged;
  const factory AddVehicleEvent.vehicleLicensePlateNumberChanged(
      String vehLicensePlateStr) = VehicleLicensePlateNumberChanged;
  const factory AddVehicleEvent.fuelTypeChanged(int fuelTypeInt) =
      FuelTypeChanged;
  const factory AddVehicleEvent.fuelCapacityChanged(
      int fuelCapacityDouble) = FuelCapacityChanged;
  const factory AddVehicleEvent.vehicleModelYearChanged(int vehicleModelYear) =
      VehicleModelYearChanged;
  const factory AddVehicleEvent.siteChanged(int siteIdInt) =
      SiteChanged;
  const factory AddVehicleEvent.isSubmittingChanged() =
      IsSubmittingChanged;
  const factory AddVehicleEvent.changedValues(Map<String, dynamic> valuesChanged) = ChangedValues;
}
