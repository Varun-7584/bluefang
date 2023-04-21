part of 'vehicledetails_bloc.dart';

@freezed
class VehicledetailsState with _$VehicledetailsState {
  const factory VehicledetailsState({
    required bool isLoading,
    required ProgrammedDataTrac programmedDataTrac,
    required Option<Either<ProgrammedDataTracFailure, Unit>>
        saveFailureOrSuccessOption,
  }) = _VehicledetailsState;
  
  factory VehicledetailsState.initial() => VehicledetailsState(
    programmedDataTrac: ProgrammedDataTrac.empty(),
    isLoading: true,
    saveFailureOrSuccessOption: none(),
  );
}
