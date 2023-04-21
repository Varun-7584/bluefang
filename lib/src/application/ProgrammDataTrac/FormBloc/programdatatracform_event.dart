// ignore_for_file: avoid_positional_boolean_parameters

part of 'programdatatracform_bloc.dart';

/// Event object for the programdatatracform_bloc. 
@freezed
class ProgramdatatracformEvent with _$ProgramdatatracformEvent {
  const factory ProgramdatatracformEvent.initialized(DtID dtID,
      Option<ProgrammedDataTrac> initialProgramedDataTracOption) = Initialized;
  const factory ProgramdatatracformEvent.vehicleNumberChanged(
      String vehicleNumberStr) = VehicleNumberChanged;
  const factory ProgramdatatracformEvent.vehicleModelYearChanged(
      int vehicleYearInt) = VehicleModelYearChanged;
  const factory ProgramdatatracformEvent.vinNumberChanged(String vinNumberStr) =
      VinNumberChanged;
  const factory ProgramdatatracformEvent.revPerMilesChanged(int revPerMileInt) =
      RevPerMilesChanged;
  const factory ProgramdatatracformEvent.uomChanged(int uomInt) = UomChanged;
  const factory ProgramdatatracformEvent.presetDistanceChanged(
      int presetDistanceInt) = PresetDistanceChanged;
  const factory ProgramdatatracformEvent.vehicleLicensePlateNumberChanged(
      String vehLicensePlateStr) = VehicleLicensePlateNumberChanged;
  const factory ProgramdatatracformEvent.fuelTypeChanged(int fuelTypeInt) =
      FuelTypeChanged;
  const factory ProgramdatatracformEvent.fuelCapacityChanged(
      int fuelCapacityDouble) = FuelCapacityChanged;

  const factory ProgramdatatracformEvent.siteChanged(int siteIdInt) =
      SiteChanged;
  const factory ProgramdatatracformEvent.isSubmittingChanged() =
      IsSubmittingChanged;
  const factory ProgramdatatracformEvent.dtIDChanged(DtID dtID) =
      DtIDChanged;
  const factory ProgramdatatracformEvent.changedValues(Map<String, dynamic> valuesChanged) = ChangedValues;
  const factory ProgramdatatracformEvent.programDataTrac(
      int userIDInt, int dateTimeInt) = ProgramDataTrac;
}
