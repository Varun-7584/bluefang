import 'package:freezed_annotation/freezed_annotation.dart';

part 'site_failure.freezed.dart';

@freezed
abstract class SiteFailure<T> with _$SiteFailure {
  const factory SiteFailure.unexpected() = _Unexpected;
  const factory SiteFailure.databaseError({required T err}) = _DatabaseError<T>;
}
