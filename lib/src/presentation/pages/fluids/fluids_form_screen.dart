// ignore_for_file: must_be_immutable, avoid_returning_null_for_void, unused_local_variable, prefer_if_elements_to_conditional_expressions, prefer_final_locals, prefer_const_constructors, no_logic_in_create_state

import 'dart:developer';

import 'package:bluefang/injection.dart';
import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/application/Fluids/fluids_form_bloc.dart';
import 'package:bluefang/src/application/UserPreferencesBloc/userpreferences_bloc.dart';
import 'package:bluefang/src/domain/modelandfuel/model_and_fuel.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/infrastructure/core/helpermethods/helper_methods.dart';
import 'package:bluefang/src/presentation/constants/global_routes.dart';
import 'package:bluefang/src/presentation/pages/fluids/fluids_settings_screen.dart';
import 'package:bluefang/src/presentation/pages/fluids/veh_atf_quantity_field.dart';
import 'package:bluefang/src/presentation/pages/fluids/veh_atf_type.dart';
import 'package:bluefang/src/presentation/pages/fluids/veh_coolant_quantity_field.dart';
import 'package:bluefang/src/presentation/pages/fluids/veh_coolant_type.dart';
import 'package:bluefang/src/presentation/pages/fluids/veh_def_quantity_field.dart';
import 'package:bluefang/src/presentation/pages/fluids/veh_def_type_field.dart';
import 'package:bluefang/src/presentation/pages/fluids/veh_fuel_quantity_field.dart';
import 'package:bluefang/src/presentation/pages/fluids/veh_oil_quantity_field.dart';
import 'package:bluefang/src/presentation/pages/fluids/veh_oil_type.dart';
import 'package:bluefang/src/presentation/pages/fluids/veh_oil_viscosity.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FluidsFormScreen extends StatefulWidget {
  final DtID dataTracID;
  bool hideFuelInfo;
  bool hideLicensePlate;
  bool validated = false;
  ModelAndFuel modelAndFuel;
  String vehId;

  FluidsFormScreen(
      {Key? key,
      this.hideFuelInfo = false,
      this.hideLicensePlate = false,
      required this.dataTracID,
      required this.modelAndFuel,
      required this.vehId})
      : super(key: key);

  @override
  State<FluidsFormScreen> createState() {
    return FluidsFormScreenState(
        dataTracID: dataTracID, modelAndFuel: modelAndFuel, vehId: vehId);
  }
}

class FluidsFormScreenState extends State<FluidsFormScreen> {
  final DtID dataTracID;
  bool hideFuelInfo;
  bool hideLicensePlate;
  bool validated = false;
  double bxHeight = 10;
  ModelAndFuel modelAndFuel;
  String vehId;
  final double fontSize = 18;
  final _formKey = GlobalKey<FormState>();

  FluidsFormScreenState(
      {this.hideFuelInfo = false,
      this.hideLicensePlate = false,
      required this.dataTracID,
      required this.modelAndFuel,
      required this.vehId});

  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance.logEvent(
      name: 'screen_view',
      parameters: {
        'firebase_screen': "Fluids Form",
        'firebase_screen_class': "FluidsFormScreen",
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    UserPreferencesState userPreferencesState =
        context.watch<UserPreferencesBloc>().state;
    double usedFontSize = fontSize;
    if (MediaQuery.of(context).size.width < 375) {
      usedFontSize -= 6;
    } else if (MediaQuery.of(context).size.width > 500) {
      usedFontSize += 8;
    }

    final bundle = DefaultAssetBundle.of(context);

    return BlocProvider(
      create: (context) => getIt<FluidsformBloc>()
        ..add(
          FluidsformEvent.initialized(dataTracID, modelAndFuel, vehId),
        ),
      child: Scaffold(
        appBar: bFAppBar(
          title: AppLocalizations.of(context)!.fluidsEntry,
          trailingAction: const Icon(Icons.settings),
          onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FluidsSettingsScreen()))
                .then((value) => setState(() {}));
          },
        ),
        backgroundColor: kcWhite,
        body: BlocBuilder<FluidsformBloc, FluidsformState>(
          buildWhen: (p, c) => p.modelAndFuel != c.modelAndFuel,
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
                            state.vehId,
                            color: kcBlack,
                            fontSize: usedFontSize,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: bxHeight),
                    FutureBuilder<String>(
                        future: HelperMethods.getImageForVehicle(
                            stockJpg: state.modelAndFuel.vehStockJpg,
                            bundle: bundle,
                            customJpg: state.modelAndFuel.vehCustomJpg),
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
              Row(children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(4.0, 0, 0, 0),
                  child: SvgPicture.asset(
                      "assets/images/MakeIcons/${state.modelAndFuel.vehMake.getOrCrash()}.svg",
                      height: usedFontSize,
                      width: usedFontSize,
                      fit: BoxFit.scaleDown),
                ),
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
                              "20${state.modelAndFuel.vehYear.getOrCrash()}",
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
                              state.modelAndFuel.vehModelId.getOrCrash(),
                              color: kcBlack,
                              fontSize: usedFontSize,
                            ),
                          ],
                        ),
                      ])),
                ))
              ]),
              Expanded(
                child: Form(
                  key: _formKey,
                  autovalidateMode: //state.showErrorMessages
                      AutovalidateMode.always,
                  //: AutovalidateMode.disabled,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          flex: 9,
                          fit: FlexFit.tight,
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Row(children: <Widget>[
                                  Image.asset("assets/images/FuelIcon.png"),
                                  SizedBox(width: bxHeight),
                                  Expanded(
                                    child: Card(
                                      color: kcLightGreyColor,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Flexible(
                                              child: VehFuelQuantityField(
                                                  fuelQuantity: 0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                                SizedBox(
                                    height: userPreferencesState.enableOilField
                                        ? bxHeight
                                        : null),
                                userPreferencesState.enableOilField
                                    ? Row(children: <Widget>[
                                        Image.asset(
                                            "assets/images/OilIcon.png"),
                                        SizedBox(width: bxHeight),
                                        Expanded(
                                          child: Card(
                                            color: kcLightGreyColor,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Flexible(
                                                    child:
                                                        VehOilQuantityField(),
                                                  ),
                                                  Flexible(
                                                    child:
                                                        VehOilViscosityField(),
                                                  ),
                                                  Flexible(
                                                    child: VehOilTypeField(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ])
                                    : SizedBox(),
                                SizedBox(
                                    height:
                                        userPreferencesState.enableCoolantField
                                            ? bxHeight
                                            : null),
                                userPreferencesState.enableCoolantField
                                    ? Row(children: <Widget>[
                                        Image.asset(
                                            "assets/images/CoolantIcon.png"),
                                        SizedBox(width: bxHeight),
                                        Expanded(
                                          child: Card(
                                            color: kcLightGreyColor,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Flexible(
                                                    child:
                                                        VehCoolantQuantityField(),
                                                  ),
                                                  Flexible(
                                                    child:
                                                        VehCoolantTypeField(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ])
                                    : SizedBox(),
                                SizedBox(
                                    height: userPreferencesState.enableAtfField
                                        ? bxHeight
                                        : null),
                                userPreferencesState.enableAtfField
                                    ? Row(children: <Widget>[
                                        Image.asset(
                                            "assets/images/ATFIcon.png"),
                                        SizedBox(width: bxHeight - 6),
                                        Expanded(
                                          child: Card(
                                            color: kcLightGreyColor,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Flexible(
                                                    child:
                                                        VehATFQuantityField(),
                                                  ),
                                                  Flexible(
                                                    child: VehATFTypeField(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ])
                                    : SizedBox(),
                                SizedBox(
                                    height: userPreferencesState.enableDefField
                                        ? bxHeight
                                        : null),
                                userPreferencesState.enableDefField
                                    ? Row(children: <Widget>[
                                        Image.asset(
                                            "assets/images/ATFIcon.png"),
                                        SizedBox(width: bxHeight - 6),
                                        Expanded(
                                          child: Card(
                                            color: kcLightGreyColor,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Flexible(
                                                    child:
                                                        VehDefQuantityField(),
                                                  ),
                                                  Flexible(
                                                    child: VehDefTypeField(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ])
                                    : SizedBox(),
                              ],
                            ),
                          ),
                        ),
                        // Flexible(
                        //child:
                        BFButtons(
                            title:
                                AppLocalizations.of(context)!.programDataTrac,
                            onTap: () {
                              validated = _formKey.currentState!.validate();
                              if (validated) {
                                Navigator.pushNamed(
                                    context, GlobalRoutes.fleetManager);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    bFSnackBar(
                                        content: "Invalid input",
                                        type: "error",
                                        onActionClick: () => null));
                                log("There are errors in the input. Not submitting.",
                                    name: "fluids_form_screen");
                              }
                            }),
                        //),
                      ],
                    ),
                  ),
                ),
              ),
            ]);
          },
        ),
      ),
    );
  }
}
