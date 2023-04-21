part of 'sensordetails_bloc.dart';

@freezed
class SensordetailsEvent with _$SensordetailsEvent {
  factory SensordetailsEvent.started() = _Started;
  factory SensordetailsEvent.displaySensor({required DtID dataTracID}) =
      _DisplaySensor;
  factory SensordetailsEvent.beaconAlert({required IBeacon beacon}) =
      _BeaconAlert;
}
