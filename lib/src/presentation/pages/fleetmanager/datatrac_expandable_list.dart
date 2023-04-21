// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/package/bluefang_ui/src/widgets/bluefang_datatrac_list.dart';
import 'package:bluefang/src/application/FleetManager/fleet_manager_bloc.dart';
import 'package:bluefang/src/domain/sensor/sensor.dart';
import 'package:bluefang/src/presentation/constants/global_routes.dart';
import 'package:bluefang/src/presentation/pages/qrcodereader/qr_code_reader_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kt_dart/collection.dart';

/// An expandable list that shows all the datatracs from the passed list.
///
/// Displays the vehicles listed in [sensorList]. The title card also shows the total number of datatracs in the list.
/// This is usually used to display the unprogrammed data tracs. When a datatrac is selected from the list, it opens the sensor details screen with that sensor's information.
///
/// ```
/// DataTracExpandableList({Key? key, required this.sensorList})
/// ```
class DatatracExpandableList extends StatefulWidget {
  KtMutableList<Sensor> sensorList;
  double fontSize = 22;
  DatatracExpandableList({Key? key, required this.sensorList})
      : super(key: key);

  @override
  State<DatatracExpandableList> createState(){
    return DatatracExpandableListState();
  }

}

class DatatracExpandableListState extends State<DatatracExpandableList>{


  @override
  Widget build(BuildContext context) {
    final List<Padding> tileList = [];

    for (int index = 0; index < widget.sensorList.asList().length; index++) {
      tileList.add(Padding(
        //No padding added to top or bottom because cards already have some padding
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: BFCardDatatracList(
          text: widget.sensorList[index].dtIdHumanReadable.getOrCrash(),
          reprogrammable:
              // ignore: avoid_bool_literals_in_conditional_expressions
              widget.sensorList[index].dtReprogrammable.getOrCrash() == 1
                  ? true
                  : false,
          onTap: () {
            Navigator.pushNamed(
              context, 
              GlobalRoutes.sensorDetails,
              arguments: {
                "dtID" : widget.sensorList[index].dtId,
                "reprogramming" : false
              }
            ).then((_) => context.read<FleetManagerBloc>().add(FleetManagerEvent.refreshScreen()));
          },
        ),
      ));
    }

    double usedFontSize = widget.fontSize;
    if (MediaQuery.of(context).size.width < 375) {
      usedFontSize -= 8;
    } 
    else if (MediaQuery.of(context).size.width > 500) {
      usedFontSize += 10;
    }

    return Card(
      elevation: 0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: ExpansionTile(
              initiallyExpanded: tileList.isNotEmpty,
                collapsedBackgroundColor: kcLightGreyColor,
                title: BFText.headingThree("DataTracs", fontSize: usedFontSize),
                subtitle: BFText.caption(
                    "${widget.sensorList.asList().length} ${AppLocalizations.of(context)!.units}"),
                controlAffinity: ListTileControlAffinity.leading,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Flexible(
                    //   child: 
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: 
                      BFButtons(
                        title: AppLocalizations.of(context)!.scanQRCode,
                        //height: actualFontSize * 2.5,
                        onTap: () async {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QRCodeReaderScreen(),
                                  ))
                              .then((_) => context
                                  .read<FleetManagerBloc>()
                                  .add(FleetManagerEvent.refreshScreen()));
                        }),
                    ),
                    Image.asset("assets/images/DataTracReprogrammable.png", height: 3 * usedFontSize),
                  ],
                ),
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width < 350 ? 75 : 175,
                    child: ListView(
                      children: tileList
                    ),
                  ),
                ]
              ),
          ),
        ],
      ),
    );
  }
}
