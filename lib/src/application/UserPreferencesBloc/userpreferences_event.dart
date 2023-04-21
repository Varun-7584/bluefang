// ignore_for_file: avoid_positional_boolean_parameters

part of 'userpreferences_bloc.dart';

@freezed
class UserPreferencesEvent with _$UserPreferencesEvent {
  const factory UserPreferencesEvent.started() = _Started;
  const factory UserPreferencesEvent.storeFuelUOM(int uomIndex) = FuelUomChanged;
  const factory UserPreferencesEvent.coolantUomChanged(int uomIndex) = CoolantUomChanged;
  const factory UserPreferencesEvent.atfUomChanged(int uomIndex) = AtfUomChanged;
  const factory UserPreferencesEvent.defUomChanged(int uomIndex) = DefUomChanged;
  const factory UserPreferencesEvent.oilUomChanged(int uomIndex) = OilUomChanged;
  const factory UserPreferencesEvent.enableFuelInfo(bool value) = EnableFuelInfo;
  const factory UserPreferencesEvent.enableLicensePlateInfo(bool value) = EnableLicensePlateInfo;
  const factory UserPreferencesEvent.enableAtfInfo(bool value) = EnableAtfInfo;
  const factory UserPreferencesEvent.enableCoolantInfo(bool value) = EnableCoolantInfo;
  const factory UserPreferencesEvent.enableOilInfo(bool value) = EnableOilInfo;
  const factory UserPreferencesEvent.enableDefInfo(bool value) = EnableDefInfo;
}
