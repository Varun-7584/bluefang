// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, must_be_immutable, avoid_single_cascade_in_expression_statements, prefer_const_constructors

import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/application/LoggingBloc/logging_bloc.dart';
import 'package:bluefang/src/presentation/core/widgets/bluefang_image_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoggingSettingsScreen extends StatelessWidget {
  double bxSize = 20;
  LoggingSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoggingBloc, LoggingState>(builder: (context, state) {
      return Scaffold(
        appBar: bFAppBar(
          title: "Logging Settings Screen",
          leading: BackButton(onPressed: () {
            Navigator.pop(context);
          }),
        ),
        body: ListView(children: [
          Card(
            elevation: 0,
            child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(children: [
                  BFText.headingOne("Filter By"),
                  SizedBox(height: bxSize),
                  BFDropdownAndImage(
                      label: "Vehicle Number",
                      dropdownLength: 5,
                      dropdownValue: state.vehId,
                      whenChanged: (newValue) {
                        final bool active = !(newValue == "All");
                        context
                            .read<LoggingBloc>()
                            .add(LoggingEvent.vehIdFilter(active, newValue));
                      },
                      imagePath: "assets/images/VehicleNumberIcon.png",
                      itemList: state.possibleVehIds),
                  SizedBox(height: bxSize),
                  BFDropdownAndImage(
                    label: "DataTrac ID",
                    dropdownLength: 5,
                    dropdownValue: state.dtId,
                    whenChanged: (newValue) {
                      final bool active = !(newValue == "All");
                      context
                          .read<LoggingBloc>()
                          .add(LoggingEvent.dtIdFilter(active, newValue));
                    },
                    imagePath: "assets/images/DataTracReprogrammable.png",
                    itemList: state.possibleDtIds,
                  ),
                  SizedBox(height: bxSize),
                  BFDropdownAndImage(
                    label: "Message Type",
                    dropdownValue: state.msgType,
                    dropdownLength: 5,
                    whenChanged: (newValue) {
                      final bool active = !(newValue == "All");
                      context
                          .read<LoggingBloc>()
                          .add(LoggingEvent.msgTypeFilter(active, newValue));
                    },
                    imagePath: "assets/images/VehicleStockImages/0.JPG",
                    itemList: state.possibleMsgTypes,
                  ),
                  TextButton(
                    onPressed: () {
                      // getIt<ILogItemRepository>().deleteAllRecords();
                      throw Exception("TESTING");
                    },
                    child: const Text("Delete All Records [For testing only] "),
                  ),
                ])),
          ),
        ]),
      );
    });
  }
}
