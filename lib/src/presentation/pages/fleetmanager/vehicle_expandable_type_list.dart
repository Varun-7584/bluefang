// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable, no_logic_in_create_state, avoid_print, avoid_redundant_argument_values, prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'dart:developer';

import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/package/bluefang_ui/src/widgets/bluefang_vehicle_expandable_items.dart';
import 'package:bluefang/src/application/FleetManager/fleet_manager_bloc.dart';
import 'package:bluefang/src/application/LanguageSupport/language_bloc.dart';
import 'package:bluefang/src/domain/aggregates/vehicleInfo/vehicle_info.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_en.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_es.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_fr.dart';
import 'package:bluefang/src/infrastructure/core/helpermethods/formatting_methods.dart';
import 'package:bluefang/src/infrastructure/core/helpermethods/helper_methods.dart';
import 'package:bluefang/src/presentation/constants/global_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages, unused_import
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// An expandable list that shows all the vehicles from the passed list.
///
/// Displays the vehicles listed in [itemList]. The title card also shows the total number of vehicles in the list.
/// When a vehicle is selected from the list, the vehicle's information is displayed in VehicleInformationScreen.
///
/// ```
/// VehicleExpandableList({Key? key, required this.itemList})
/// ```
class VehicleExpandableList extends StatelessWidget {
  List<List<VehicleInfo>> itemList = [];
  final double spacing = 15;
  Color? cardColor = kcLightGreyColor;
  double fontSize = 24;

  /// An expandable list that shows all the vehicles from the passed list.
  ///
  /// Displays the vehicles listed in [itemList]. The title card also shows the total number of vehicles in the list. Vehicles are grouped by vehicle model and year.
  ///
  /// When a vehicle is selected from the list, the vehicle's information is displayed in VehicleInformationScreen.
  ///
  VehicleExpandableList({
    Key? key,
    required this.itemList,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double usedFontSize = fontSize;
    if (MediaQuery.of(context).size.width < 375) {
      usedFontSize -= 8;
    } 
    else if (MediaQuery.of(context).size.width > 500) {
      usedFontSize += 10;
    }
    return BlocBuilder<FleetManagerBloc, FleetManagerState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: ListView.builder(
                  itemCount: itemList.length,
                  itemBuilder: (context, index) {
                    if (itemList[index].isNotEmpty){
                    return Padding(
                        padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                        child: ExpansionTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            backgroundColor: kcLightGreyColor,
                            collapsedBackgroundColor: kcLightGreyColor,
                            title: Card(
                                color: cardColor,
                                elevation: 0,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: usedFontSize * 2,
                                      child: BFText.headingOne(itemList[index]
                                          .length
                                          .toString()
                                          .padLeft(2, '0'),
                                          fontSize: usedFontSize
                                      ),
                                    ),
                                    SizedBox(width: spacing),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(
                                            width: usedFontSize * 2,
                                            child: FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: BFText.body(
                                                    "20" +
                                                        itemList[index][0]
                                                            .vehYear
                                                            .getOrCrash()
                                                            .toString(),
                                                    color: kcPrimaryColor,
                                                )
                                              ),
                                          ),
                                          SizedBox(width: spacing),
                                          FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: BFText.subHeading(
                                              FormattingMethods.wrapText(
                                                  itemList[index][0]
                                                      .vehModel
                                                      .getOrCrash()),
                                              color: kcPrimaryColor,
                                            ),
                                          ),
                                          //),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: spacing),
                                    Row(
                                      children: <Widget>[
                                        FutureBuilder<String>(
                                            future: HelperMethods
                                                .getImageForVehicle(
                                                    customJpg: itemList[index]
                                                            [0]
                                                        .vehCustomJpg,
                                                    stockJpg: itemList[index][0]
                                                        .vehStockJpg,
                                                    bundle: rootBundle),
                                            builder: (context,
                                                AsyncSnapshot<String>
                                                    snapshot) {
                                              if (snapshot.hasData) {
                                                return Image.asset(
                                                    snapshot.data!,
                                                    height: usedFontSize * 2,
                                                    width: usedFontSize * 5);
                                              } else {
                                                return const CircularProgressIndicator();
                                              }
                                            }),
                                      ],
                                    ),
                                  ],
                                )),
                            children:
                                buildVehicleList(itemList[index], context)));
                    }
                    else {
                      return SizedBox();
                    }
                  }),
            ),
          ],
        );
      },
    );
  }

  List<Widget> buildVehicleList(
      List<VehicleInfo> inputList, BuildContext context) {
        log("Input list length: ${inputList.length}", name: "vehicle_expandable_type_list.dart");
    final List<Widget> vehList = [];
    for (int i = 0; i < inputList.length; i++) {
      vehList.add(BFCardVehicleExpandable(
        vehNumberText: inputList[i].vehId.getOrCrash(),
        timeModified: FormattingMethods.formatTime(
                inputList[i].sensorLastRead.getOrCrash()),
        dateModified: FormattingMethods.formatDate(
                inputList[i].sensorLastRead.getOrCrash(), Localizations.localeOf(context).toString()),
        lifeDistText: inputList[i].dtLifeMiles.value.fold((l) => "Error", (r) {
              return FormattingMethods.insertCommas(r.toString());
            }) +
            " " +
            (context.read<LanguageBloc>().state.language == "es"
                ? ReferenceTableDataES.uomDistance[inputList[i].dtUom] ?? "km"
                : (context.read<LanguageBloc>().state.language == "fr"
                    ? ReferenceTableDataFR
                            .uomDistance[inputList[i].dtUom.getOrCrash()] ??
                        "km"
                    : ReferenceTableDataEN
                            .uomDistance[inputList[i].dtUom.getOrCrash()] ??
                        "km")),
        onTap: () {
          Navigator.pushNamed(
              context,
              GlobalRoutes.vehicleDetails,
              arguments: {
                "dtID": inputList[i].dtId
              },
          ).then((_) => context.read<FleetManagerBloc>().add(FleetManagerEvent.started(true)));
        },
        // numCardWidth: numCardWidth,
        // distCardWidth: distCardWidth,
        // timeCardWidth: timeCardWidth,
        // typeCardWidth: typeCardWidth,
      ));
    }
    return vehList;
  }
}
