// ignore_for_file: prefer_const_constructors, prefer_final_locals, noop_primitive_operations, invariant_booleans

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bluefang/injection.dart';
import 'package:bluefang/src/domain/logging/i_logitem_repository.dart';
import 'package:bluefang/src/domain/logging/log_item.dart';
import 'package:bluefang/src/domain/logging/logitem_failure.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

part 'logging_event.dart';
part 'logging_state.dart';
part 'logging_bloc.freezed.dart';

/// Bloc to manage the business logic for the logging screen. 
/// 
/// It is declared as a singleton, meanining it is only created once. 
/// The repository is accessed using getIt<> instead of directly injecting it into the bloc. 
@singleton
class LoggingBloc extends Bloc<LoggingEvent, LoggingState> {
  LoggingBloc() : super(LoggingState.initial()) {
    KtList<LogItem>? logList;
    Either<LogItemFailure<dynamic>, KtList<LogItem>>? logListTemp;

    on<_Started>((event, emit) async {
      logListTemp = await getIt<ILogItemRepository>().fetchItems(200);
      logList = logListTemp!.getOrElse(() => KtList.empty());
      List<LogItem> tempList = logList?.asList().toList() ?? [];

      final List<List<String>> filterParameterLists =
          getFilterParameters(tempList);

      emit(state.copyWith(
        isLoading: false,
        logItems: logList ?? KtList<LogItem>.empty(),
        possibleVehIds: filterParameterLists.elementAt(0),
        possibleDtIds: filterParameterLists.elementAt(1),
        possibleMsgTypes: filterParameterLists.elementAt(2),
      ));
    });

    on<_GetLogs>((event, emit) async {
      logListTemp = await getIt<ILogItemRepository>().fetchItems(200);
      logList = logListTemp!.getOrElse(
        (){
          log("No log items. Error: $logListTemp", name: "logging_bloc.dart");
          return KtList.empty();
        }
      );
      KtList<LogItem> newList = logList ?? KtList<LogItem>.empty();
      final List<List<String>> filterParameterLists =
          getFilterParameters(logList?.asList().toList() ?? []);

      //log("Starting list: $logList");
      if (state.vehIdFilter) {
        //log("Filtering by vehId.");
        newList = newList
            .filter((p0) => p0.vehId.getOrCrash().toString() == state.vehId);
      }
      if (state.dtIdFilter) {
        //log("Filtering by dtId.");
        newList = newList.filter((p0) =>
            DtIDHumanReadable(p0.dtId.getOrCrash()).getOrCrash().toString() ==
            state.dtId);
      }
      if (state.msgTypeFilter) {
        //log("Filtering by msgType.");
        newList = newList
            .filter((p0) => p0.messageType.value.toString() == state.msgType);
      }
      emit(
        state.copyWith(
          isLoading: false,
          logItems: newList,
          possibleVehIds: filterParameterLists.isNotEmpty ? filterParameterLists.elementAt(0) : [],
          possibleDtIds: filterParameterLists.isNotEmpty ? filterParameterLists.elementAt(1) : [],
          possibleMsgTypes: filterParameterLists.isNotEmpty ? filterParameterLists.elementAt(2) : [],
        ),
      );
    });

    on<_VehIdFilter>((event, emit) async {
      //log("VehIdFilter is on? ${event.isOn}; vehId to filter by: ${event.vehId}");
      //Remove all filters, then reapply those that are active
      KtList<LogItem> newList = logList ?? KtList<LogItem>.empty();
      //log("Starting list: $logList");
      if (state.dtIdFilter) {
        //log("Filtering by dtId.");
        newList = newList.filter((p0) =>
            DtIDHumanReadable(p0.dtId.getOrCrash()).getOrCrash().toString() ==
            state.dtId);
      }
      if (state.msgTypeFilter) {
        //log("Filtering by vehicle type.");
        newList =
            newList.filter((p0) => p0.messageType.toString() == state.msgType);
      }
      if (event.isOn) {
        newList = newList.filter((p0) {
          return p0.vehId.getOrCrash() == event.vehId;
        });
        emit(state.copyWith(
            isLoading: false,
            logItems: newList,
            vehIdFilter: true,
            vehId: event.vehId));
      } else {
        emit(state.copyWith(
            logItems: newList, vehIdFilter: false, vehId: event.vehId));
      }
    });

    on<_DtIdFilter>((event, emit) async {
      log("DtIdFilter is on? ${event.isOn}; dtId to filter by: ${event.dtId}");
      //Remove all filters, then reapply those that are active
      KtList<LogItem> newList = logList ?? KtList<LogItem>.empty();
      if (state.vehIdFilter) {
        // log("Filtering by vehicle ID");
        newList = newList
            .filter((p0) => p0.vehId.getOrCrash().toString() == state.vehId);
      }
      if (state.msgTypeFilter) {
        // log("Filtering by vehicle type");
        newList =
            newList.filter((p0) => p0.messageType.toString() == state.msgType);
      }
      if (event.isOn) {
        // log("Filtering by dt ID");
        newList = newList.filter((p0) =>
            DtIDHumanReadable(p0.dtId.getOrCrash()).getOrCrash().toString() ==
            event.dtId);
        emit(state.copyWith(
            logItems: newList, dtIdFilter: true, dtId: event.dtId));
      } else {
        emit(state.copyWith(
            logItems: newList, dtIdFilter: false, dtId: event.dtId));
      }
    });

    on<_MsgTypeFilter>((event, emit) async {
      //Remove all filters, then reapply those that are active
      KtList<LogItem> newList = logList ?? KtList<LogItem>.empty();
      if (state.dtIdFilter) {
        newList = newList.filter((p0) =>
            DtIDHumanReadable(p0.dtId.getOrCrash()).getOrCrash().toString() ==
            state.dtId);
      }
      if (state.vehIdFilter) {
        newList = newList
            .filter((p0) => p0.vehId.getOrCrash().toString() == state.vehId);
      }
      if (event.isOn) {
        newList =
            newList.filter((p0) => p0.messageType.toString() == event.msgType);
        emit(state.copyWith(
            logItems: newList, msgTypeFilter: true, msgType: event.msgType));
      } else {
        emit(state.copyWith(
            logItems: newList, msgTypeFilter: false, msgType: event.msgType));
      }
    });

    on<_ClearFilters>((event, emit) async {
      emit(
        state.copyWith(
          logItems: logList ?? KtList.empty(),
          vehIdFilter: false,
          dtIdFilter: false,
          msgTypeFilter: false,
          vehId: "All",
          dtId: "All",
          msgType: "All",
        ),
      );
    });
  }

  /// Takes a list of the log items and returns a list of the lists of parameter values available to filter by.
  ///
  /// Algorithm:
  /// - For each of the three parameters (vehicle ID, datatrac ID, and message type)
  ///   - Copy the list of log items
  ///   - Sort it
  ///   - If the list is empty, return an empty list.
  ///   - Get the first item in the list and set it as the item to check against (the master item)
  ///   - While there are still items in the list, remove any that match the current master item
  ///     - Add the value of the master item's parameter (whichever one we're checking) to the return list
  ///     - Set the master item to the next item in the list ONLY if there are more items in the log list
  ///     - Repeat the while if still true
  ///  - Once this is done for all three parameters, return the list of lists of values to filter by.
  List<List<String>> getFilterParameters(List<LogItem> logList) {
    LogItem currParam;
    List<List<String>> parameters = [
      ["All"],
      ["All"],
      ["All"]
    ];

    //Vehicle ID
    logList
        .sort((a, b) => a.vehId.getOrCrash().compareTo(b.vehId.getOrCrash()));
    if (logList.isEmpty) {
      return [];
    }
    currParam = logList.elementAt(0);
    int counter = 0;
    //log("Initial list: $tempList");
    while (counter < logList.length) {
      logList.removeWhere((element) =>
          element.vehId == currParam.vehId && element != currParam);
      //Store the vehicle id in the list of vehicle IDs present in the dataset
      parameters.elementAt(0).add(currParam.vehId.getOrCrash());
      counter++;
      //log("After removing items with id ${currParam.vehID}, list is $tempList");
      if (counter < logList.length) {
        currParam = logList.elementAt(counter);
      }
    }
    //log("List of vehicle ids present in logging screen: $tempList");
    if (logList.isEmpty) {
      log("ERROR: List of vehicle ids was empty.",
          name: "logging_bloc.dart", level: 1);
    }

    // DtID
    logList.sort((a, b) => a.dtId.getOrCrash().compareTo(b.dtId.getOrCrash()));
    currParam = logList.elementAt(0);
    counter = 0;
    //log("Initial list: $tempList");
    while (counter < logList.length) {
      logList.removeWhere(
          (element) => element.dtId == currParam.dtId && element != currParam);
      //Convert to human-readable form for display purposes
      parameters.elementAt(1).add(DtIDHumanReadable(currParam.dtId.getOrCrash())
          .getOrCrash()
          .toString());
      counter++;
      //log("After removing items with id ${currParam.dtID}, list is $tempList");
      if (counter < logList.length) {
        currParam = logList.elementAt(counter);
      }
    }
    //log("List of datatrac ids present in logging screen: $tempList");
    if (logList.isEmpty) {
      log("ERROR: List of datatrac ids was empty.",
          name: "logging_bloc.dart", level: 1);
    }

    // Vehicle Type
    logList.sort((a, b) => a.messageType.value
        .toString()
        .compareTo(b.messageType.value.toString()));
    currParam = logList.elementAt(0);
    counter = 0;
    //log("Initial list: $tempList");
    while (counter < logList.length) {
      logList.removeWhere((element) =>
          element.messageType.value.toString() ==
              currParam.messageType.value.toString() &&
          element != currParam);
      parameters
          .elementAt(2)
          .add(currParam.messageType.value.toString().toString());
      counter++;
      //log("After removing items with id ${currParam.msgType}, list is $logList");
      if (counter < logList.length) {
        currParam = logList.elementAt(counter);
      }
    }
    //log("List of vehicle types present in logging screen: $logList");
    if (logList.isEmpty) {
      log("ERROR: List of vehicle types was empty.",
          name: "logging_bloc.dart", level: 1);
    }

    return parameters;
  }
}
