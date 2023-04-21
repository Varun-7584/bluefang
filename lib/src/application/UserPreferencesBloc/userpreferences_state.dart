// ignore_for_file: prefer_const_constructors

part of 'userpreferences_bloc.dart';

@freezed
class UserPreferencesState with _$UserPreferencesState {
  const factory UserPreferencesState({
    required int fuelUOM,
    required int atfUOM,
    required int oilUOM,
    required int coolantUOM,
    required bool enableFuelField,
    required bool enableLicensePlateField,
    required bool enableAtfField,
    required bool enableCoolantField,
    required bool enableOilField,
    required bool enableDefField
  }) = _UserPreferencesState;
  factory UserPreferencesState.initial() => UserPreferencesState(
    fuelUOM: 0,
    atfUOM: 0,
    oilUOM: 0,
    coolantUOM: 0,
    enableFuelField: true,
    enableLicensePlateField: true,
    enableAtfField: true,
    enableCoolantField: true,
    enableOilField: true,
    enableDefField: true,
  );
}
