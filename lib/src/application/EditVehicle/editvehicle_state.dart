// ignore_for_file: prefer_interpolation_to_compose_strings

part of 'editvehicle_bloc.dart';

@freezed
class EditVehicleState with _$EditVehicleState {
  const factory EditVehicleState({
    required bool isSubmitting,
    required bool isEditing,
    required ProgrammedDataTrac programmedDataTrac,
    required Option<Either<ProgrammedDataTracFailure, Unit>>
        saveFailureOrSuccessOption,
    required bool isInitialized,
    required Map<String, dynamic> changedValuesMap,
  }) = _EditVehicleState;

  factory EditVehicleState.initial() => EditVehicleState(
      isSubmitting: false,
      isEditing: false,
      programmedDataTrac: ProgrammedDataTrac.empty(),
      saveFailureOrSuccessOption: none(),
      isInitialized: false,
      changedValuesMap: {}
  );

}
