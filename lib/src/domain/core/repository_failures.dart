import 'package:freezed_annotation/freezed_annotation.dart';
part 'repository_failures.freezed.dart';

@freezed
abstract class RepositoryFailures<T> with _$RepositoryFailures<T> {
  // ANCHOR Core
  const factory RepositoryFailures.insertionFailure({required T err}) =
      InsertionFailure<T>;
  const factory RepositoryFailures.updateFailure({required T err}) =
      UpdateFailure<T>;
  const factory RepositoryFailures.deleteFailure({required T err}) =
      DeleteFailure<T>;
  const factory RepositoryFailures.queryFailure({required T err}) =
      QueryFailure<T>;
  const factory RepositoryFailures.scibeError({required T failedValue}) =
      ScibeError<T>;
}
