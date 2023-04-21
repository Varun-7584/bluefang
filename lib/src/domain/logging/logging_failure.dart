import 'package:freezed_annotation/freezed_annotation.dart';

part 'logging_failure.freezed.dart';

@freezed
abstract class LoggingFailure with _$LoggingFailure {
  const factory LoggingFailure.invalidMessageType({required dynamic err}) =
      _InvalidMessageType;
}
