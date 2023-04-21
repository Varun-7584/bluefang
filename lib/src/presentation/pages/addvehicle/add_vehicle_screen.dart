// ignore_for_file: prefer_const_constructors, avoid_positional_boolean_parameters, must_be_immutable, prefer_if_elements_to_conditional_expressions, no_logic_in_create_state, unnecessary_nullable_for_final_variable_declarations, prefer_final_locals

import 'dart:developer';

import 'package:bluefang/injection.dart';
import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/application/AddNewVehicle/addvehicle_bloc.dart';
import 'package:bluefang/src/application/UserPreferencesBloc/userpreferences_bloc.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac.dart';
import 'package:bluefang/src/presentation/constants/global_routes.dart';
import 'package:bluefang/src/presentation/core/widgets/demo_mode_banner.dart';
import 'package:bluefang/src/presentation/pages/ProgramDataTrac/program_datatrac_screen_settings_screen.dart';
import 'package:bluefang/src/presentation/pages/addvehicle/veh_fuel_capacity_field.dart';
import 'package:bluefang/src/presentation/pages/addvehicle/veh_fuel_type_field.dart';
import 'package:bluefang/src/presentation/pages/addvehicle/veh_license_plate_field.dart';
import 'package:bluefang/src/presentation/pages/addvehicle/veh_number_field.dart';
import 'package:bluefang/src/presentation/pages/addvehicle/veh_site_field.dart';
import 'package:bluefang/src/presentation/pages/addvehicle/veh_year_field.dart';
import 'package:bluefang/src/presentation/pages/addvehicle/vin_field.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Screen to program a datatrac and assign it to a vehicle.
///
/// ```
/// AddVehicleScreen(
///   {Key? key, required this.editedProgrammedDataTrac})
/// ```
class AddVehicleScreen extends StatefulWidget {
  /// Screen to program a datatrac and assign it to a vehicle.
  // ignore: prefer_const_constructors_in_immutables
  AddVehicleScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddVehicleScreen> createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance.logEvent(
      name: 'screen_view',
      parameters: {
        'firebase_screen': "Add Vehicle",
        'firebase_screen_class': "AddVehicleScreen",
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddVehicleBloc, AddVehicleState>(
      bloc: getIt<AddVehicleBloc>()..add(AddVehicleEvent.initialized()),
      listener: (context, state) {},
      buildWhen: (p, c) => p.isSubmitting != c.isSubmitting,
      builder: (context, state) {
        return Stack(
          children: <Widget>[
            AddVehicleScaffold(),
          ],
        );
      },
    );
  }
}

class AddVehicleScaffold extends StatefulWidget {
  bool validated = false;
  AddVehicleScaffold({
    Key? key,
  }) : super(key: key);

  @override
  State<AddVehicleScaffold> createState() {
    return AddVehicleScaffoldState();
  }
}

class AddVehicleScaffoldState extends State<AddVehicleScaffold> {
  double fontSize = 16;
  bool validated = false;
  ProgrammedDataTrac? programmedDataTrac;
  final _formKey = GlobalKey<FormState>();

  AddVehicleScaffoldState();

  VehNumberField vehNumberField = VehNumberField();
  VehYearField vehYearField = VehYearField();
  VinField vehVinField = VinField();

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 500) {
    } else if (MediaQuery.of(context).size.width < 375) {}
    UserPreferencesState userPreferencesState =
        context.watch<UserPreferencesBloc>().state;
    return Scaffold(
      appBar: bFAppBar(
        title: AppLocalizations.of(context)!.addNewVehicle,
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
            child: BlocConsumer<AddVehicleBloc, AddVehicleState>(
                listener: (context, state) {},
                buildWhen: (p, c) {
                  return (p.isEditing != c.isEditing) ||
                      (p.showErrorMessages != c.showErrorMessages) ||
                      (p.isSubmitting != c.isSubmitting);
                },
                builder: (context, state) {
                  return Column(mainAxisSize: MainAxisSize.min, children: [
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
                              vehNumberField,
                              const SizedBox(height: 10),
                              vehYearField,
                              const SizedBox(height: 10),
                              vehVinField,
                              const SizedBox(height: 10),
                              !userPreferencesState.enableLicensePlateField
                                  ? SizedBox(height: 0)
                                  : VehLicensePlateField(),
                              !userPreferencesState.enableFuelField
                                  ? SizedBox(height: 0)
                                  : const SizedBox(height: 10),
                              !userPreferencesState.enableFuelField
                                  ? SizedBox(height: 0)
                                  : VehFuelTypeField(),
                              !userPreferencesState.enableFuelField
                                  ? SizedBox(height: 0)
                                  : const SizedBox(height: 10),
                              !userPreferencesState.enableFuelField
                                  ? SizedBox(height: 0)
                                  : VehFuelCapacityField(),
                              !userPreferencesState.enableFuelField
                                  ? SizedBox(height: 0)
                                  : const SizedBox(height: 10),
                              VehSiteField(),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    )),
                    Card(
                        child: BFButtons(
                            title: AppLocalizations.of(context)!.addNewVehicle,
                            onTap: () {
                              vehVinField.fieldHasFocus = false;
                              validated = _formKey.currentState!.validate();

                              if (validated) {
                                context
                                    .read<AddVehicleBloc>()
                                    .add(AddVehicleEvent.isSubmittingChanged());
                                //Determine which values, if any, were changed from the initial datatrac
                                Navigator.pushNamed(
                                    context, GlobalRoutes.fleetManager);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    bFSnackBar(
                                        content: "Input errors",
                                        type: 'error',
                                        onActionClick: () {}));
                                log("There are errors in the input. Not submitting.",
                                    name: "program_datatrac_svt_form_screen");
                              }
                            }))
                  ]);
                }),
          ),
        ],
      ),
    );
  }
}
