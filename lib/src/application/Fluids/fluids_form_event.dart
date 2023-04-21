// ignore_for_file: avoid_positional_boolean_parameters

part of 'fluids_form_bloc.dart';

/// Event object for the programdatatracform_bloc.
@freezed
class FluidsformEvent with _$FluidsformEvent {
  const factory FluidsformEvent.initialized(DtID dataTracID, ModelAndFuel modelAndFuel, String vehId) = Initialized;
  const factory FluidsformEvent.fuelQuantityChanged(double fuelQuantity) =
      FuelQuantityChanged;
  const factory FluidsformEvent.oilQuantityChanged(double oilQuantity) =
      OilQuantityChanged;
  const factory FluidsformEvent.oilViscosityChanged(int oilViscosity) =
      OilViscosityChanged;
  const factory FluidsformEvent.oilTypeChanged(int oilType) = OilTypeChanged;
  
  const factory FluidsformEvent.coolantQuantityChanged(double coolantQuantity) =
      CoolantQuantityChanged;
  const factory FluidsformEvent.coolantTypeChanged(int coolantType) =
      CoolantTypeChanged;
  const factory FluidsformEvent.atfQuantityChanged(double atfQuantity) =
      AtfQuantityChanged;
  const factory FluidsformEvent.atfTypeChanged(int atfType) = AtfTypeChanged;
  const factory FluidsformEvent.defQuantityChanged(double defQuantity) =
      DefQuantityChanged;
  const factory FluidsformEvent.defTypeChanged(int defType) = DefTypeChanged;
}
