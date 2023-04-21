part of 'vehicledetails_bloc.dart';

@freezed
class VehicledetailsEvent with _$VehicledetailsEvent {
  const factory VehicledetailsEvent.started() = _Started;
  const factory VehicledetailsEvent.displayVehicle({required DtID dataTracID}) = _FindVehicle;
}
