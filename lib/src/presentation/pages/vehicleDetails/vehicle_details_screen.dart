// ignore_for_file: join_return_with_assignment, prefer_interpolation_to_compose_strings, use_build_context_synchronously, prefer_const_constructors, avoid_field_initializers_in_const_classes, must_be_immutable, prefer_const_constructors_in_immutables
import 'dart:developer';

import 'package:bluefang/injection.dart';
import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/application/ProgrammDataTrac/FormBloc/programdatatracform_bloc.dart';
import 'package:bluefang/src/application/UserPreferencesBloc/userpreferences_bloc.dart';
import 'package:bluefang/src/application/VehicleDetails/bloc/vehicledetails_bloc.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/i_program_datatrac_repo.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/infrastructure/core/helpermethods/formatting_methods.dart';
import 'package:bluefang/src/infrastructure/core/helpermethods/helper_methods.dart';
import 'package:bluefang/src/presentation/constants/global_routes.dart';
import 'package:bluefang/src/presentation/core/widgets/demo_mode_banner.dart';
import 'package:bluefang/src/presentation/pages/vehicleDetails/widget/veh_datatrac_card.dart';
import 'package:bluefang/src/presentation/pages/vehicleDetails/widget/veh_distance_card.dart';
import 'package:bluefang/src/presentation/pages/vehicleDetails/widget/veh_fuel_capacity_card.dart';
import 'package:bluefang/src/presentation/pages/vehicleDetails/widget/veh_license_plate_card.dart';
import 'package:bluefang/src/presentation/pages/vehicleDetails/widget/veh_site_card.dart';
import 'package:bluefang/src/presentation/pages/vehicleDetails/widget/veh_vin_card.dart';
import 'package:dartz/dartz.dart' as dtz;
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages, unused_import
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VehicleDetailsScreen extends StatefulWidget {
  final DtID dataTracID;

  VehicleDetailsScreen({
    Key? key,
    required this.dataTracID,
  }) : super(key: key);

  @override
  State<VehicleDetailsScreen> createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance.logEvent(
      name: 'screen_view',
      parameters: {
        'firebase_screen': "Vehicle Details",
        'firebase_screen_class': "VehicleDetailsScreen",
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return VehicleDetailsScaffold(
      dataTracID: widget.dataTracID,
    );
  }
}

class VehicleDetailsScaffold extends StatelessWidget {
  final DtID dataTracID;
  final double fontSize = 18;

  VehicleDetailsScaffold({
    Key? key,
    required this.dataTracID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double usedFontSize = fontSize;
    if (MediaQuery.of(context).size.width < 375) {
      usedFontSize -= 6;
    } else if (MediaQuery.of(context).size.width > 500) {
      usedFontSize += 8;
    }

    final bundle = DefaultAssetBundle.of(context);
    const double bxheight = 10;
    return BlocProvider(
      create: (context) => getIt<VehicledetailsBloc>()
        ..add(
          VehicledetailsEvent.displayVehicle(dataTracID: dataTracID),
        ),
      child: Scaffold(
        appBar: bFAppBar(
            title: AppLocalizations.of(context)!.vehicleDetails,
            leading: BackButton(onPressed: () {
              Navigator.pop(context);
            })),
        backgroundColor: kcWhite,
        body: Column(
          children: [
            DemoModeBanner(),
            Expanded(
              child: BlocBuilder<VehicledetailsBloc, VehicledetailsState>(
                //buildWhen: (p, c) => p.isLoading != c.isLoading,
                builder: (context, state) {
                  if (!state.isLoading) {
                    return Column(children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BFText.subHeading(
                                      AppLocalizations.of(context)!
                                          .vehicleNumber,
                                      color: kcPrimaryColor,
                                      fontSize: usedFontSize),
                                  SizedBox(width: 10),
                                  BFText.body(
                                    state.programmedDataTrac.vehicle.vehId
                                        .getOrCrash(),
                                    color: kcBlack,
                                    fontSize: usedFontSize,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: bxheight),
                            FutureBuilder<String>(
                                future: HelperMethods.getImageForVehicle(
                                  stockJpg: state.programmedDataTrac
                                      .modelAndFuel.vehStockJpg,
                                  bundle: bundle,
                                  customJpg: state.programmedDataTrac
                                      .modelAndFuel.vehCustomJpg,
                                ),
                                builder:
                                    (context, AsyncSnapshot<String> snapshot) {
                                  if (snapshot.hasData) {
                                    return Image.asset(snapshot.data!,
                                        height: usedFontSize * 6,
                                        width: usedFontSize * 10);
                                  } else {
                                    return const CircularProgressIndicator();
                                  }
                                }),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                        child: Row(children: [
                          SvgPicture.asset(
                              "assets/images/MakeIcons/${state.programmedDataTrac.modelAndFuel.vehMake.getOrCrash()}.svg",
                              height: 20,
                              width: 20,
                              fit: BoxFit.scaleDown),
                          SizedBox(width: usedFontSize / 2),
                          Expanded(
                              child: Card(
                            elevation: 0,
                            color: kcLightGreyColor,
                            child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(children: [
                                  Column(
                                    children: [
                                      BFText.subHeading(
                                        AppLocalizations.of(context)!.vehYear,
                                        fontSize: usedFontSize,
                                        color: kcPrimaryColor,
                                      ),
                                      BFText.body(
                                        "${state.programmedDataTrac.modelAndFuel.vehYear.getOrCrash() + 2000}",
                                        color: kcBlack,
                                        fontSize: usedFontSize,
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: usedFontSize / 2),
                                  Column(
                                    children: [
                                      BFText.subHeading(
                                        AppLocalizations.of(context)!.vehModel,
                                        fontSize: usedFontSize,
                                        color: kcPrimaryColor,
                                      ),
                                      BFText.body(
                                        state.programmedDataTrac.modelAndFuel
                                            .vehModelId
                                            .getOrCrash(),
                                        color: kcBlack,
                                        fontSize: usedFontSize,
                                      ),
                                    ],
                                  ),
                                ])),
                          ))
                        ]),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            //Wrapping the column in a card prevents Flutter from trying to draw the card backgrounds from inside the column outside its bounds when scrolling.
                            child: Card(
                                elevation: 0,
                                child: Column(
                                  children: <Widget>[
                                    const SizedBox(height: bxheight),
                                    VehDistanceCard(
                                        dateTimeMod:
                                            FormattingMethods.formatEntireDate(
                                                state.programmedDataTrac
                                                    .distance.dateTimeMod
                                                    .getOrCrash(),
                                                Localizations.localeOf(context)
                                                    .toString()),
                                        distTraveled: state.programmedDataTrac
                                            .distance.dtLifeMiles
                                            .getOrCrash()
                                            .toString(),
                                        uom: state
                                            .programmedDataTrac.sensor.dtUom
                                            .getOrCrash()
                                    ),
                                    const SizedBox(height: bxheight),
                                    VehSiteCard(
                                        vehSiteName: state
                                            .programmedDataTrac.site.siteName
                                            .getOrCrash()),
                                    const SizedBox(height: bxheight),
                                    VehVinCard(
                                        vinText: state
                                            .programmedDataTrac.vehicle.vinId
                                            .getOrCrash()),
                                    const SizedBox(height: bxheight),
                                    VehLicensePlateCard(
                                        plateNumber: state.programmedDataTrac
                                            .vehicle.vehPlateId
                                            .getOrCrash()),
                                    const SizedBox(height: bxheight),
                                    VehFuelCapacityCard(
                                        fuelCapacityText: HelperMethods.fuelConversion(state
                                            .programmedDataTrac
                                            .modelAndFuel
                                            .vehFuelCapacity
                                            .getOrCrash(),
                                            currentUOM: context.read<UserPreferencesBloc>().state.fuelUOM
                                        ).toString(),
                                        dataTracID: dataTracID,
                                        modelAndFuel: state
                                            .programmedDataTrac.modelAndFuel,
                                        vehId: state
                                            .programmedDataTrac.vehicle.vehId
                                            .getOrCrash()),
                                    const SizedBox(height: bxheight),
                                    VehDataTracCard(
                                      sensor: state.programmedDataTrac.sensor,
                                      revsPerDist: state
                                          .programmedDataTrac.sensor.dtRpd
                                          .getOrCrash()
                                          .toString(),
                                      uom: state.programmedDataTrac.sensor.dtUom
                                          .getOrCrash(),
                                      reprogrammable: state.programmedDataTrac
                                              .sensor.dtReprogrammable
                                              .getOrCrash() ==
                                          1,
                                    ),
                                    const SizedBox(height: bxheight * 2),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ]);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            Card(
                child: Column(children: [
              BFButtons(
                  title: AppLocalizations.of(context)!.reprogrammDataTrac,
                  onTap: () async {
                    final repository = getIt<IProgrammedDataTracRepository>();
                    final ProgrammedDataTrac? programmedDataTrac =
                        (await repository.find(dtID: dataTracID))
                            .fold((l) => null, (r) => r);
                    //For some reason, testing to see if the bloc is registered prevents getIt from closing it.
                    //DO NOT REMOVE THIS IF STATEMENT unless you can make the code work withou it.
                    if (getIt.isRegistered<ProgramdatatracformBloc>()) {
                      final bloc = getIt<ProgramdatatracformBloc>();
                      //Go ahead and send the state out with the data trac information for this vehicle, if it exists
                      bloc.add(ProgramdatatracformEvent.initialized(
                          dataTracID,
                          (programmedDataTrac == null)
                              ? dtz.none()
                              : dtz.some(programmedDataTrac)));
                      //Force the hydrated bloc to store that data trac information
                      bloc.hydrate();
                    } else {
                      log("No instance of Programdatatracform bloc available");
                    }
                    //Now navigate to the Program Data Trac screen
                    Navigator.pushNamed(
                      context,
                      GlobalRoutes.programDataTrac,
                      arguments: {
                        "dtID": dataTracID,
                        "editedProgrammedDataTrac": programmedDataTrac,
                      },
                    );
                  }),
              //Hidden for Beta
              // SizedBox(height: bxheight),
              // BFButtons(
              //     title: AppLocalizations.of(context)!.editVehicle,
              //     onTap: () async {
              //       final repository = getIt<IProgrammedDataTracRepository>();
              //       final ProgrammedDataTrac? programmedDataTrac =
              //           (await repository.find(dtID: dataTracID))
              //               .fold((l) => null, (r) => r);
              //       if (programmedDataTrac == null) {
              //         log("Datatrac was null.");
              //         Navigator.pushNamed(
              //           context,
              //           GlobalRoutes.editVehicle,
              //           arguments: {
              //             "programmedDataTrac": ProgrammedDataTrac.empty()
              //           },
              //         );
              //         return;
              //       }
              //       log("Pushing datatrac: $programmedDataTrac");
              //       Navigator.pushNamed(
              //         context,
              //         GlobalRoutes.editVehicle,
              //         arguments: {"programmedDataTrac": programmedDataTrac},
              //       );
              //     },
              // ),
            ])),
          ],
        ),
      ),
    );
  }
}
