// ignore_for_file: prefer_const_constructors

part of 'logging_bloc.dart';

@freezed
class LoggingState with _$LoggingState {
  const factory LoggingState({
    required bool isLoading,
    required KtList<LogItem> logItems,
    required bool vehIdFilter,
    required bool dtIdFilter,
    required bool msgTypeFilter,
    required String vehId,
    required String dtId,
    required String msgType,
    required List<String> possibleVehIds,
    required List<String> possibleDtIds,
    required List<String> possibleMsgTypes
  }) = _LoggingState;
  factory LoggingState.initial() => LoggingState(
    isLoading: true,
    logItems: KtList.empty(),
    vehIdFilter: false,
    dtIdFilter: false,
    msgTypeFilter: false,
    vehId: "All",
    dtId: "All",
    msgType: "All",
    possibleVehIds: [],
    possibleDtIds: [],
    possibleMsgTypes: []
  );
}
