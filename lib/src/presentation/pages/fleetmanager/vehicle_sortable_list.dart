// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable, no_logic_in_create_state, avoid_print, avoid_redundant_argument_values, prefer_interpolation_to_compose_strings, prefer_const_constructors


import 'package:bluefang/package/bluefang_ui/src/widgets/bluefang_vehicle_list_items.dart';
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
import 'package:kt_dart/collection.dart';

/// A list that shows all the vehicles from the passed list.
///
/// Displays the vehicles listed in [itemList].
/// When a vehicle is selected from the list, the vehicle's information is displayed in VehicleInformationScreen.
///
/// ```
/// VehicleSortableList({Key? key, required this.itemList})
/// ```
class VehicleSortableList extends StatelessWidget {
  KtMutableList<VehicleInfo> itemList;
  double defaultImageSize = 60; 
  double usedImageSize = 80; 

  /// Builds a sortable listview from the list of vehicles to display. 
  VehicleSortableList({
    Key? key, 
    required this.itemList,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FleetManagerBloc, FleetManagerState>(
      builder: (context, state) {
        usedImageSize = defaultImageSize;
        if (MediaQuery.of(context).size.width < 300){
          usedImageSize -= 30;
        }
        else if (MediaQuery.of(context).size.width < 350){
          usedImageSize -= 20;
        }
        else if (MediaQuery.of(context).size.width > 500){
          usedImageSize += 25;
        }
        return Column(
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: ListView.builder(
                //Not preventing bouncing 
                physics: ClampingScrollPhysics(),
                  itemCount: itemList.asList().length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: BFCardVehicleList(
                        vehNumberText: itemList[index]
                            .vehId
                            .value
                            .fold((l) => "Error", (r) => r),
                        vehModelText: itemList[index]
                            .vehModel
                            .value
                            .fold((l) => "Error", (r) => r).padRight(13, ' '),
                        vehYearText: itemList[index]
                            .vehYear
                            .getValueOrErrorString()
                            .toString()
                            .padLeft(2, '0'),
                            //Multiply time and date by 1000 to covert from seconds to milliseconds
                        timeModified: FormattingMethods.formatTime(itemList[index].sensorLastRead.getOrCrash()),
                        dateModified: FormattingMethods.formatDate(itemList[index].sensorLastRead.getOrCrash(), Localizations.localeOf(context).toString()),
                        lifeDistText: (itemList[index]
                                    .dtLifeMiles
                                    .value
                                    .fold((l) => "Error", (r) {
                                      return FormattingMethods.insertCommas(r.toString());
                                    }) +
                                    " " +
                                    (context.read<LanguageBloc>().state.language == "es" ? 
                                      ReferenceTableDataES.uomDistance[itemList[index].dtUom.getOrCrash()] ?? "km"
                                      : (context.read<LanguageBloc>().state.language == "fr"
                                        ? ReferenceTableDataFR.uomDistance[itemList[index].dtUom.getOrCrash()] ?? "km"
                                        : ReferenceTableDataEN.uomDistance[itemList[index].dtUom.getOrCrash()] ?? "km"
                                      )
                                    )
                                  )
                                  .padLeft(6),
                        image: FutureBuilder<String>(
                            future: HelperMethods.getImageForVehicle(
                                customJpg: itemList[index].vehCustomJpg,
                                stockJpg: itemList[index].vehStockJpg,
                                bundle: rootBundle),
                            builder: (context, AsyncSnapshot<String> snapshot) {
                              if (snapshot.hasData) {
                                return Image.asset(snapshot.data!,
                                    width: usedImageSize);
                              } else {
                                return const CircularProgressIndicator();
                              }
                            }),
                        onTap: () {
                          Navigator.pushNamed(
                              context,
                              GlobalRoutes.vehicleDetails,
                              arguments: {
                                "dtID": itemList[index].dtId
                              },
                          ).then((_) => context.read<FleetManagerBloc>().add(FleetManagerEvent.refreshScreen()));
                        },
                      ),
                    );
                  }),
            ),
          ],
        );
      },
    );
  }

}
