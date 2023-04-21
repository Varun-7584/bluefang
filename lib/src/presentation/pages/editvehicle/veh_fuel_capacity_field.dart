// ignore_for_file: prefer_const_constructors, must_be_immutable, avoid_redundant_argument_values,, no_logic_in_create_state

import 'dart:developer';

import 'package:bluefang/src/application/EditVehicle/editvehicle_bloc.dart';
import 'package:bluefang/src/application/UserPreferencesBloc/userpreferences_bloc.dart';
import 'package:bluefang/src/infrastructure/core/helpermethods/helper_methods.dart';
import 'package:bluefang/src/presentation/core/widgets/bluefang_image_text_input.dart';
import 'package:bluefang/src/presentation/pages/editvehicle/veh_fuel_units_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Gets and stores the fuel capacity of the vehicle.
class VehFuelCapacityField extends StatefulWidget {
  int vehFuelCapacity;

  VehFuelCapacityField({required this.vehFuelCapacity}) : super();

  @override
  State<VehFuelCapacityField> createState() => VehFuelCapacityFieldState(vehFuelCapacity: vehFuelCapacity);
}

class VehFuelCapacityFieldState extends State<VehFuelCapacityField>{
  int vehFuelCapacity;
  VehFuelCapacityFieldState({required this.vehFuelCapacity}) : super();
  final textEditingController = TextEditingController();

  RegExp inputFilter = RegExp(r"^[0-9]{0,4}(\.\d)?$");
  RegExp oneDecimalFilter = RegExp(r"^.*(\.)?(\d)?");
  bool setInitialText = true;

  @override
  void initState() {    super.initState();
    final UserPreferencesBloc bloc = context.read<UserPreferencesBloc>();
    textEditingController.text = HelperMethods.fuelConversion(
      vehFuelCapacity,
      fromLiters: true,
      currentUOM: bloc.state.fuelUOM)
    .toString();
}

  @override
  Widget build(BuildContext context) {
    
    final UserPreferencesBloc bloc = context.read<UserPreferencesBloc>();
    return BlocBuilder<EditVehicleBloc, EditVehicleState>(
        buildWhen: (p, c) =>
            p.isEditing != c.isEditing,
        builder: (context, state) {          
          return Row(
            children: <Widget>[
              Expanded(
                child: BFInputAndImage(
                    edgeMargin: 0,
                    textController: textEditingController,
                    imagePath: "assets/images/FuelIcon.png",
                    hintText: AppLocalizations.of(context)!.fuelCapacity,
                    label: AppLocalizations.of(context)!.fuelCapacity,
                    outline: true,
                    maxLength: 6,
                    inputFormatterList: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
                    ],
                    //errorMessage: '',
                    onChanged: (String value) {
                      try {
                        if (value == "") {
                          return context.read<EditVehicleBloc>().add(
                              EditVehicleEvent.fuelCapacityChanged(0));
                        } else {
                          return context.read<EditVehicleBloc>().add(
                              EditVehicleEvent.fuelCapacityChanged(
                                  HelperMethods.fuelConversion(
                                      int.parse(value),
                                      fromLiters: false,
                                      currentUOM: bloc.state.fuelUOM).round()));
                        }
                      } catch (e, s) {
                        if (e is FormatException) {
                          log("Invalid double entered: $value. Storing 0 instead.",
                              name: "FuelCapacityField");
                          //The field s allowed to be empty, so store 0 in it
                          return context.read<EditVehicleBloc>().add(
                              EditVehicleEvent.fuelCapacityChanged(0));
                        } else {
                          log("Error: ",
                              name: "FuelCapacityField",
                              error: e,
                              stackTrace: s);
                        }
                      }
                    },
                    keyboardType: TextInputType.number,
                    validator: (_) {
                      // Since the input in the text box may not match the values stored in the bloc (because the input may be an invalid decimal),
                      // check the input against the regex; if it passes, then continue with normal validation. Otherwise, fail validation.

                      inputFilter.stringMatch(textEditingController.text) ==
                              null
                          ? log("No match.")
                          : inputFilter
                              .stringMatch(textEditingController.text)!
                              .length;
                      if ((inputFilter.hasMatch(textEditingController.text) &&
                              inputFilter
                                      .stringMatch(textEditingController.text)!
                                      .length ==
                                  textEditingController.text.length) ||
                          textEditingController.text == "") {
                        return context
                            .read<EditVehicleBloc>()
                            .state
                            .programmedDataTrac
                            .modelAndFuel
                            .vehFuelCapacity
                            .value
                            .fold(
                                (failure) => failure.maybeMap(
                                    invalidDoubleRange: (f) =>
                                        '${AppLocalizations.of(context)!.invalidRange} ${f.max}',
                                    orElse: () => null),
                                (validValue) => null);
                      } else if (oneDecimalFilter
                              .hasMatch(textEditingController.text) &&
                          oneDecimalFilter
                                  .stringMatch(textEditingController.text)!
                                  .length ==
                              textEditingController.text.length &&
                          textEditingController.text
                              .contains(RegExp(r"\.\d"))) {
                        return AppLocalizations.of(context)!
                            .invalidDecimalValue;
                      } else {
                        return AppLocalizations.of(context)!.invalidValue;
                      }
                    }),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width > 500 ? 160 : 100,
                child: VehFuelUnits(),
              ),
            ],
          );
        });
  }
}
