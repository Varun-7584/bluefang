// ignore_for_file: avoid_positional_boolean_parameters

part of 'logging_bloc.dart';

@freezed
class LoggingEvent with _$LoggingEvent {
  const factory LoggingEvent.started() = _Started;
  const factory LoggingEvent.getLogs() = _GetLogs;
  factory LoggingEvent.vehIdFilter(bool isOn, String vehId) = _VehIdFilter;
  factory LoggingEvent.dtIdFilter(bool isOn, String dtId) = _DtIdFilter;
  factory LoggingEvent.msgTypeFilter(bool isOn, String msgType) = _MsgTypeFilter;
  factory LoggingEvent.clearFilters() = _ClearFilters;
}
