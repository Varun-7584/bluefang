// ignore_for_file: prefer_interpolation_to_compose_strings

part of 'programdatatracform_bloc.dart';

@freezed
class ProgramdatatracformState with _$ProgramdatatracformState {
  const factory ProgramdatatracformState({
    required bool isSubmitting,
    required bool showErrorMessages,
    required bool isEditing,
    required ProgrammedDataTrac programmedDataTrac,
    required Option<Either<ProgrammedDataTracFailure, Unit>>
        saveFailureOrSuccessOption,
    required bool storeInBloc,
    required Map<String, dynamic> changedValuesMap,
  }) = _ProgramdatatracformState;

  factory ProgramdatatracformState.initial() => ProgramdatatracformState(
      isSubmitting: false,
      isEditing: false,
      programmedDataTrac: ProgrammedDataTrac.empty(),
      showErrorMessages: false,
      // saveFailureOrSuccessOption: some(left(
      //     const ProgrammedDataTracFailure.databaseError(
      //         err: 'Error Connecting to database'))),
      saveFailureOrSuccessOption: none(),
      storeInBloc: false,
      changedValuesMap: {});

  static String formattedToString(ProgramdatatracformState theState) {
    return "\nProgramdatatracformState(\nisSubmitting: ${theState.isSubmitting}, showErrorMessages: ${theState.showErrorMessages},isEditing: ${theState.isEditing}\nprogrammedDataTrac: ${theState.programmedDataTrac.formattedToString()}\n, saveFailureOrSuccessOption: ${theState.saveFailureOrSuccessOption}\n) //End ProgramdatatracformState ";
  }
}
