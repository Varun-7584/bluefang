// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, prefer_if_elements_to_conditional_expressions, no_logic_in_create_state

import 'package:bluefang/injection.dart';
import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/application/EditVehicle/editvehicle_bloc.dart';
import 'package:bluefang/src/application/UserPreferencesBloc/userpreferences_bloc.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac.dart';
import 'package:bluefang/src/infrastructure/core/helpermethods/helper_methods.dart';
import 'package:bluefang/src/presentation/core/widgets/demo_mode_banner.dart';
import 'package:bluefang/src/presentation/pages/editvehicle/veh_distance_field.dart';
import 'package:bluefang/src/presentation/pages/editvehicle/veh_fuel_capacity_field.dart';
import 'package:bluefang/src/presentation/pages/editvehicle/veh_fuel_type_field.dart';
import 'package:bluefang/src/presentation/pages/editvehicle/veh_license_plate_field.dart';
import 'package:bluefang/src/presentation/pages/editvehicle/veh_number_field.dart';
import 'package:bluefang/src/presentation/pages/editvehicle/veh_year_field.dart';
import 'package:bluefang/src/presentation/pages/editvehicle/vin_field.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages, unused_import
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditVehicleScreen extends StatefulWidget {
  ProgrammedDataTrac programmedDataTrac;

  /// Screen to edit a vehicle.
  ///
  /// This screen should not be present for our datatrac customers, since they will be using datatracs instead of just tracking vehicles.
  EditVehicleScreen({required this.programmedDataTrac}) : super();
  @override
  State<EditVehicleScreen> createState() =>
      EditVehicleScreenState(programmedDataTrac: programmedDataTrac);
}

class EditVehicleScreenState extends State<EditVehicleScreen> {
  double fontSize = 16;
  ProgrammedDataTrac programmedDataTrac;
  EditVehicleScreenState({required this.programmedDataTrac}) : super();

  @override
  void initState() {
    super.initState();
    // context
    //     .read<EditVehicleBloc>()
    //     .add(EditVehicleEvent.initialized(programmedDataTrac));
    FirebaseAnalytics.instance.logEvent(
      name: 'screen_view',
      parameters: {
        'firebase_screen': "Edit Vehicle",
        'firebase_screen_class': "EditVehicleScreenState",
      },
    );
  }

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
    final UserPreferencesState userPreferencesState =
        context.read<UserPreferencesBloc>().state;

    return Scaffold(
        appBar: bFAppBar(title: AppLocalizations.of(context)!.editVehicle),
        body: Column(children: [
          DemoModeBanner(),
          Expanded(
            child: BlocBuilder<EditVehicleBloc, EditVehicleState>(
              buildWhen: (p, c) => p.isEditing != c.isEditing,
              bloc: getIt<EditVehicleBloc>(),
              builder: (context, state) {
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
                                  AppLocalizations.of(context)!.vehicleNumber,
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
                              stockJpg: state
                                  .programmedDataTrac.modelAndFuel.vehStockJpg,
                              bundle: bundle,
                              customJpg: state
                                  .programmedDataTrac.modelAndFuel.vehCustomJpg,
                            ),
                            builder: (context, AsyncSnapshot<String> snapshot) {
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
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(children: [
                            VehNumberField(
                              vehNumber:
                                  programmedDataTrac.vehicle.vehId.getOrCrash(),
                            ),
                            const SizedBox(height: 10),
                            VehYearField(
                                vehYear: (programmedDataTrac
                                            .modelAndFuel.vehYear
                                            .getOrCrash() +
                                        2000)
                                    .toString()),
                            const SizedBox(height: 10),
                            VinField(
                                vinStr: programmedDataTrac.vehicle.vinId
                                    .getOrCrash()),
                            const SizedBox(height: 10),
                            VehDistanceField(
                                vehLifeDist: programmedDataTrac
                                    .distance.dtLifeMiles
                                    .getOrCrash()
                                    .toString()),
                            const SizedBox(height: 10),
                            !userPreferencesState.enableLicensePlateField
                                ? SizedBox(height: 0)
                                : VehLicensePlateField(
                                    vehLicensePlate: programmedDataTrac
                                        .vehicle.vehPlateId
                                        .getOrCrash()),
                            !userPreferencesState.enableFuelField
                                ? SizedBox(height: 0)
                                : const SizedBox(height: 10),
                            !userPreferencesState.enableFuelField
                                ? SizedBox(height: 0)
                                : VehFuelTypeField(
                                    fuelType: programmedDataTrac
                                        .modelAndFuel.vehFuelType
                                        .getOrCrash()),
                            !userPreferencesState.enableFuelField
                                ? SizedBox(height: 0)
                                : const SizedBox(height: 10),
                            !userPreferencesState.enableFuelField
                                ? SizedBox(height: 0)
                                : VehFuelCapacityField(
                                    vehFuelCapacity: programmedDataTrac
                                        .modelAndFuel.vehFuelCapacity
                                        .getOrCrash()),
                            !userPreferencesState.enableFuelField
                                ? SizedBox(height: 0)
                                : const SizedBox(height: 10),
                          ]),
                        )),
                  ),
                ]);
              },
            ),
          ),
        ]));
  }
}
