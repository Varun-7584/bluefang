// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_field_initializers_in_const_classes, avoid_redundant_argument_values, prefer_const_constructors_in_immutables

import 'package:bluefang/injection.dart';
import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/application/LoggingBloc/logging_bloc.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/infrastructure/core/helpermethods/formatting_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages

/// An expandable list that shows all the log entries from the passed list.
///
/// Displays the log entries listed in [logItemList]. The title card also shows the total number of log entries in the list.
///
/// ```
/// LogItemList({Key? key, required this.logItemList})
/// ```
class LogItemList extends StatefulWidget {
  LogItemList({Key? key}) : super(key: key);

  @override
  State<LogItemList> createState() => _LogItemListState();
}

class _LogItemListState extends State<LogItemList> {
  List<Padding> tileList = [];

  _LogItemListState();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoggingBloc, LoggingState>(
      // TODO confirm that this is how it should function.
      bloc: getIt<LoggingBloc>()..add(LoggingEvent.getLogs()),
      builder: (context, state) {
        if (!state.isLoading) {
          return Card(
            elevation: 0,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: state.logItems.asList().length,
                    itemBuilder: (BuildContext context, int index) {
                      return BFWidgetLogItem(
                        shortDesc: state.logItems[index].descShort,
                        msgType:
                            state.logItems[index].messageType.value.toString(),
                        dateTime: state.logItems[index].dateTime.getOrCrash(),
                        prevVal: state.logItems[index].valueOld,
                        currVal: state.logItems[index].valueNew,
                        longDesc: state.logItems[index].descFull,
                        recordID: state.logItems[index].recordId.toString(),
                        dtId:
                            state.logItems[index].dtId.getOrCrash().toString(),
                        vehNum: state.logItems[index].vehId.getOrCrash(),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class BFWidgetLogItem extends StatelessWidget {
  final int dateTime;
  final String shortDesc;
  final String recordID;
  final String prevVal;
  final String currVal;
  final String longDesc;
  final String dtId;
  final String vehNum;
  final VoidCallback? onTap;
  double fontSize;
  final String msgType;
  final double boxWidth = 10;

  BFWidgetLogItem({
    Key? key,
    required this.dateTime,
    required this.shortDesc,
    required this.msgType,
    required this.recordID,
    required this.prevVal,
    required this.currVal,
    required this.longDesc,
    required this.dtId,
    required this.vehNum,
    this.onTap,
    this.fontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double usedFontSize = fontSize;
    if (MediaQuery.of(context).size.width < 375) {
      usedFontSize -= 6;
    } else if (MediaQuery.of(context).size.width > 500) {
      usedFontSize += 10;
    }
    final String dtIdHumanReadable =
        DtIDHumanReadable(int.parse(dtId)).value.getOrElse(() => "");
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: ExpansionTile(
          tilePadding: EdgeInsets.all(0),
          collapsedBackgroundColor: kcLightGreyColor,
          controlAffinity: ListTileControlAffinity.leading,
          title: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(children: [
              Expanded(
                child: Column(children: [
                  BFText.caption("DateTime", fontSize: usedFontSize + 4),
                  BFText.headingOne(
                      FormattingMethods.formatEntireDate(dateTime, Localizations.localeOf(context).toString()),
                      color: kcBlack,
                      fontSize: usedFontSize - 4),
                ]),
              ),
              Expanded(
                child: Column(
                  children: [
                    BFText.caption("Type", fontSize: usedFontSize + 4),
                    BFText.body(msgType,
                        color: kcBlack, fontSize: usedFontSize),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    BFText.caption("Description", fontSize: usedFontSize + 4),
                    BFText.body(shortDesc,
                        color: kcBlack, fontSize: usedFontSize)
                  ],
                ),
              )
            ]),
          ),
          children: <Widget>[
            Card(
              elevation: 0,
              child: Row(children: [
                Expanded(
                  child: Column(
                    children: [
                      BFText.caption(
                        "Vehicle #",
                        fontSize: usedFontSize + 4,
                      ),
                      BFText.body(vehNum.padRight(4),
                          color: kcBlack, fontSize: usedFontSize),
                    ],
                  ),
                ),
                SizedBox(width: boxWidth),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      BFText.caption("DatatracSVT SN",
                          fontSize: usedFontSize + 4),
                      BFText.body(dtIdHumanReadable,
                          color: kcBlack, fontSize: usedFontSize)
                    ],
                  ),
                ),
                SizedBox(width: boxWidth),
                Expanded(
                  child: Column(
                    children: [
                      BFText.caption("Record ID", fontSize: usedFontSize + 4),
                      BFText.body(recordID,
                          color: kcBlack, fontSize: usedFontSize),
                    ],
                  ),
                ),
              ]),
            ),
            Card(
              elevation: 0,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BFText.caption("Old Value", fontSize: usedFontSize + 4),
                        BFText.body(prevVal,
                            color: kcBlack, fontSize: usedFontSize),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: boxWidth,
                  ),
                  Expanded(
                    child: Column(children: [
                      BFText.caption("New Value", fontSize: usedFontSize + 4),
                      BFText.body(currVal,
                          color: kcBlack, fontSize: usedFontSize),
                    ]),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    BFText.caption("Full Description",
                        fontSize: usedFontSize + 4),
                    BFText.body(longDesc,
                        fontSize: usedFontSize, color: kcBlack),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
