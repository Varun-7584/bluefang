import 'package:freezed_annotation/freezed_annotation.dart';
part 'program_datatrac_failures.freezed.dart';

@freezed
abstract class ProgrammedDataTracFailure with _$ProgrammedDataTracFailure {
  const factory ProgrammedDataTracFailure.databaseError(
      {required dynamic err}) = _DatabaseError;
  const factory ProgrammedDataTracFailure.invalidState({required dynamic err}) =
      _InvalidState;
}
