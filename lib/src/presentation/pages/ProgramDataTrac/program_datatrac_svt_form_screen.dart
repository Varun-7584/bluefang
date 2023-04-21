// ignore_for_file: prefer_const_constructors, avoid_positional_boolean_parameters, must_be_immutable, prefer_if_elements_to_conditional_expressions, no_logic_in_create_state, unnecessary_nullable_for_final_variable_declarations, prefer_final_locals, use_build_context_synchronously

import 'dart:developer';

import 'package:bluefang/injection.dart';
import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/application/ProgrammDataTrac/FormBloc/programdatatracform_bloc.dart';
import 'package:bluefang/src/application/UserPreferencesBloc/userpreferences_bloc.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac.dart';
import 'package:bluefang/src/domain/distance/distance.dart';
import 'package:bluefang/src/domain/modelandfuel/model_and_fuel.dart';
import 'package:bluefang/src/domain/sensor/sensor.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/domain/vehicle/vehicle.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
import 'package:bluefang/src/presentation/constants/global_routes.dart';
import 'package:bluefang/src/presentation/core/widgets/demo_mode_banner.dart';
import 'package:bluefang/src/presentation/pages/ProgramDataTrac/program_datatrac_screen_settings_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import './widget/index.dart';

/// Screen to program a datatrac and assign it to a vehicle.
///
/// ```
/// ProgramDataTracSVTFormScreen(
///   {Key? key, required this.editedProgrammedDataTrac})
/// ```
class ProgramDataTracSVTFormScreen extends StatelessWidget {
  final ProgrammedDataTrac? editedProgrammedDataTrac;
  final DtID dtID;

  // ignore: prefer_const_constructors_in_immutables
  ProgramDataTracSVTFormScreen({
    Key? key,
    required this.editedProgrammedDataTrac,
    required this.dtID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProgramdatatracformBloc, ProgramdatatracformState>(
      listenWhen: (p, c) =>
          p.saveFailureOrSuccessOption != c.saveFailureOrSuccessOption,
      listener: (context, state) {
        state.saveFailureOrSuccessOption.fold(
          () {},
          (either) {
            either.fold((failure) {
              ScaffoldMessenger.of(context).showSnackBar(bFSnackBar(
                  content: failure.map(
                      databaseError: (_) => 'Error Programming Datatrac',
                      invalidState: (_) => 'Please Fix the errors.'),
                  type: 'error',
                  onActionClick: () {
                    // context.read<ProgramdatatracformBloc>().add(
                    //       const ProgramdatatracformEvent.programDataTrac(
                    //           1234, 123434),
                    //     );
                  }));
            }, (success) {});
          },
        );
      },
      buildWhen: (p, c) => p.isSubmitting != c.isSubmitting,
      builder: (context, state) {
        return Stack(
          children: <Widget>[
            ProgramDataTracFormScaffold(
              dtID: dtID,
              programmedDataTrac: editedProgrammedDataTrac,
            ),
          ],
        );
      },
    );
  }
}

class ProgramDataTracFormScaffold extends StatefulWidget {
  bool validated = false;
  ProgrammedDataTrac? programmedDataTrac;
  DtID dtID;
  ProgramDataTracFormScaffold({
    Key? key,
    required this.dtID,
    required this.programmedDataTrac,
  }) : super(key: key);

  @override
  State<ProgramDataTracFormScaffold> createState() {
    return ProgramDataTracFormScaffoldState(
      dtID: dtID,
      programmedDataTrac: programmedDataTrac,
    );
  }
}

class ProgramDataTracFormScaffoldState
    extends State<ProgramDataTracFormScaffold> {
  double fontSize = 20;
  bool dtIDInitialized = false;
  bool validated = false;
  ProgrammedDataTrac? programmedDataTrac;
  final _formKey = GlobalKey<FormState>();
  DtID dtID;
  late VinField vehVinField;
  late VehRevsPerDistField vehRevsPerDistField;
  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance.logEvent(
      name: 'screen_view',
      parameters: {
        'firebase_screen': "Program Datatracsvt form ",
        'firebase_screen_class': "HelpMenuScreen",
      },
    );
  }

  ProgramDataTracFormScaffoldState({
    required this.dtID,
    this.programmedDataTrac,
  }) {
    final tempState = getIt<ProgramdatatracformBloc>().state;
    vehVinField = VinField(
        vinStr: tempState.programmedDataTrac.vehicle.vinId.getOrCrash());
    vehRevsPerDistField = VehRevsPerDistField(
        revsPerDist: tempState.programmedDataTrac.sensor.dtRpd.getOrCrash().toString());
  }

  @override
  Widget build(BuildContext context) {
    double usedFontSize = fontSize;
    if (MediaQuery.of(context).size.width > 500) {
      usedFontSize += 10;
    } else if (MediaQuery.of(context).size.width < 375) {
      usedFontSize -= 8;
    }
    UserPreferencesState userPreferencesState =
        context.watch<UserPreferencesBloc>().state;
    return Scaffold(
      appBar: bFAppBar(
        title: AppLocalizations.of(context)!.programDataTrac,
        trailingAction: const Icon(Icons.settings),
        onTap: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProgramDataTracSettingsScreen()))
              .then((value) => setState(() {}));
        },
        leading: BackButton(onPressed: () {
          Navigator.of(context).pop();
        }),
      ),
      backgroundColor: kcWhite,
      body: Column(
        children: [
          DemoModeBanner(),
          Expanded(
            child:
                BlocConsumer<ProgramdatatracformBloc, ProgramdatatracformState>(
                    listener: (context, state) {
            }, buildWhen: (p, c) {
              return (p.isEditing != c.isEditing) ||
                  (p.showErrorMessages != c.showErrorMessages) ||
                  (p.isSubmitting != c.isSubmitting);
            }, builder: (context, state) {
              //log("State.programmedDataTrac.sensor: ${state.programmedDataTrac.sensor}");
              //log("DtLifeMiles: ${state.programmedDataTrac.distance.dtLifeMiles.getOrCrash()}");
              log("Human-readable DTID: ${state.programmedDataTrac.sensor.dtIdHumanReadable}");
              vehVinField.vinStr = state.programmedDataTrac.vehicle.vinId.getOrCrash();
              vehRevsPerDistField.revsPerDist = state.programmedDataTrac.sensor.dtRpd.getOrCrash().toString();
              // log("State received: ${ProgramdatatracformState.formattedToString(state)}",
              //     name: "ProgramDataTracFormScreen");
              // if (programmedDataTrac == null && !dtIDInitialized) {
              //   context
              //       .read<ProgramdatatracformBloc>()
              //       .add(ProgramdatatracformEvent.dtIDChanged(dtID));
              //   dtIDInitialized = true;
              // }
              return Column(mainAxisSize: MainAxisSize.min, children: [
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        BFText.headingThree(
                            AppLocalizations.of(context)!.serialNum,
                            fontSize: usedFontSize + 4),
                        SizedBox(width: usedFontSize),
                        BFText.body(
                          DtIDHumanReadable(state.programmedDataTrac.sensor.dtId
                                  .getOrCrash())
                              .getOrCrash(),
                          fontSize: usedFontSize,
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                    child: Form(
                  key: _formKey,
                  autovalidateMode: //state.showErrorMessages
                      AutovalidateMode.always,
                  //: AutovalidateMode.disabled,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          VehNumberField(
                              vehNumber: state.programmedDataTrac.vehicle.vehId
                                      .getOrCrash()),
                          const SizedBox(height: 10),
                          //Hidden for Beta
                          // VehYearField(
                          //     vehYear: state.programmedDataTrac.modelAndFuel.vehYear
                          //             .getOrCrash()),
                          // const SizedBox(height: 10),
                          vehVinField,
                          const SizedBox(height: 10),
                          !userPreferencesState.enableLicensePlateField
                              ? SizedBox(height: 0)
                              : VehLicensePlateField(
                                  vehLicensePlate: state
                                          .programmedDataTrac.vehicle.vehPlateId
                                          .getOrCrash(),
                                ),
                          !userPreferencesState.enableFuelField
                              ? SizedBox(height: 0)
                              : const SizedBox(height: 10),
                          vehRevsPerDistField,
                          const SizedBox(height: 10),
                          VehDistanceField(
                              vehLifeDist: state.programmedDataTrac.distance.dtLifeMiles
                                      .getOrCrash()
                                      .toString()),
                          const SizedBox(height: 10),
                          !userPreferencesState.enableFuelField
                              ? SizedBox(height: 0)
                              : VehFuelTypeField(),
                          !userPreferencesState.enableFuelField
                              ? SizedBox(height: 0)
                              : const SizedBox(height: 10),
                          !userPreferencesState.enableFuelField
                              ? SizedBox(height: 0)
                              : VehFuelCapacityField(
                                  fuelCapacity: state.programmedDataTrac.modelAndFuel
                                          .vehFuelCapacity
                                          .getOrCrash()
                                          .toString()),
                          !userPreferencesState.enableFuelField
                              ? SizedBox(height: 0)
                              : const SizedBox(height: 10),
                          //Hidden for Beta
                          // VehSiteField(
                          //   dropdownValue: state.programmedDataTrac.site.siteName
                          //           .getOrCrash(),
                          // ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                )),
                Card(
                  child: Column(
                    children: [
                      BFButtons(
                        title: AppLocalizations.of(context)!.programDataTrac,
                        onTap: () async {
                          vehVinField.fieldHasFocus = false;
                          vehRevsPerDistField.fieldHasFocus = false;
                          validated = _formKey.currentState!.validate();

                          if (validated) {
                            bool realPassword = true;
                            log("Closed alert dialog.", name: "program_datatrac_svt_form_screen.dart");
                            //log("Initial datatrac sensor: ${programmedDataTrac?.sensor}");
                            
                            //Send event to actually program the datatrac
                            context.read<ProgramdatatracformBloc>().add(
                              const ProgramdatatracformEvent.programDataTrac(101, 123434),
                            );

                            bool updated = false;
                            //If we don't wait for the new state to appear, then a bad state gets pushed to the next screen
                            while (!updated){
                              await Future.delayed(Duration(milliseconds: 50));
                              if (context.read<ProgramdatatracformBloc>().state.isSubmitting){
                                updated = true;
                              }
                            }
                            log("Current datatrac sensor: ${context.read<ProgramdatatracformBloc>().state.programmedDataTrac}");
                                                        
                            Navigator.pushNamed(
                              context,
                              GlobalRoutes.programmingStatus,
                              arguments: {
                                "dataTrac" : context.read<ProgramdatatracformBloc>().state.programmedDataTrac,
                                "changedValuesMap" : programmedDataTrac?.copyWith(sensor: Sensor.empty().copyWith(dtUom: DtUOM(3))).compareToDataTrac(
                                            context.read<ProgramdatatracformBloc>().state.programmedDataTrac
                                        ) ??
                                        ProgrammedDataTrac.empty().copyWith(sensor: Sensor.empty().copyWith(dtUom: DtUOM(3)))
                                            .compareToDataTrac(
                                                context.read<ProgramdatatracformBloc>().state.programmedDataTrac
                                            ),
                                "isEditing" : state.isEditing,
                                "realPassword" : realPassword,
                                "wiping" : false,
                              }
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                bFSnackBar(
                                    content: "Input errors",
                                    type: 'error',
                                    onActionClick: () {}));
                            log("There are errors in the input. Not submitting.",
                                name: "program_datatrac_svt_form_screen");
                          }
                        }
                      ),
                      state.isEditing ? SizedBox(height: 10)
                        : SizedBox(),
                      state.isEditing ? BFButtons(
                        title: "Reset DataTrac SVT to Defaults",
                        onTap: () async {
                          bool submit = await showDialog<bool>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: BFText.headingOne(AppLocalizations.of(context)!.resetDataTracConfirmation),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context, true),
                                  child: BFText.body(AppLocalizations.of(context)!.continueDialog),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, false),
                                  child: BFText.body(AppLocalizations.of(context)!.cancel),
                                ),
                              ]
                            ),
                          ) ?? false; 

                          if (submit){
                            Navigator.pushNamed(
                              context,
                              GlobalRoutes.programmingStatus,
                              arguments: {
                                "dataTrac" : ProgrammedDataTrac.empty().copyWith(
                                  vehicle: Vehicle.empty().copyWith(
                                    vinId: VinID("00000000000000000"),
                                    vehId: VehID("000000000000"),
                                    vehPlateId: VehPlateID("000000000000"),
                                    dtId: state.programmedDataTrac.vehicle.dtId
                                  ),
                                  sensor: Sensor.empty().copyWith(
                                    dtId: state.programmedDataTrac.sensor.dtId
                                  ),
                                  distance: Distance.empty().copyWith(
                                    dtId: state.programmedDataTrac.distance.dtId
                                  ),
                                ),
                                "changedValuesMap" : {
                                  "vehId" : "000000000000",
                                  "siteId" : 0,
                                  "vehPlateId" : "000000000000",
                                  "vinId" : "00000000000000000",
                                  "vehFuelType" : 0,
                                  "vehFuelCapacity" : 0,
                                  "dtRpd" : 0,
                                  "dtLifeMiles" : 0,
                                  "dtUom" : 0
                                },
                                "isEditing" : state.isEditing,
                                "realPassword" : true,
                                "wiping" : true
                              }
                            );
                          }
                        }
                      ) : SizedBox(),
                    ],
                  ),
                )
              ]);
            }),
          ),
        ],
      ),
    );
  }
}
