// ignore_for_file: prefer_const_constructors

part of 'fluids_form_bloc.dart';

@freezed
class FluidsformState with _$FluidsformState {
  const factory FluidsformState({
    required bool isSubmitting,
    required bool showErrorMessages,
    required bool isEditing,
    required int oilType,
    required int oilVisc,
    required double oilQuantity,
    required int coolantType,
    required double coolantQuantity,
    required int atfType,
    required double atfQuantity,
    required int defType,
    required double defQuantity,
    required int fuelType,
    required double fuelQuantity,
    required ModelAndFuel modelAndFuel, 
    required String vehId,
  }) = _FluidsformState;

  factory FluidsformState.initial() => FluidsformState(
    isSubmitting: false,
    isEditing: false,
    showErrorMessages: false,
    oilType: 0,
    oilVisc: 0,
    oilQuantity: 0.0,
    coolantType: 0,
    coolantQuantity: 0.0,
    atfType: 0,
    atfQuantity: 0,
    defType: 0,
    defQuantity: 0,
    fuelType: 0,
    fuelQuantity: 0.0,
    modelAndFuel: ModelAndFuel.empty(),
    vehId: "",
  );
}
