// ignore_for_file: prefer_const_constructors, must_be_immutable, no_logic_in_create_state

import 'dart:developer';

import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/application/Fluids/fluids_form_bloc.dart';
import 'package:bluefang/src/presentation/pages/fluids/veh_fuel_units_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Gets and stores the quantity of fuel currently in the vehicle.

class VehFuelQuantityField extends StatefulWidget {
  double fuelQuantity;
  VehFuelQuantityField({Key? key, required this.fuelQuantity}) : super(key: key);

  @override
  State<VehFuelQuantityField> createState() => VehFuelQuantityFieldState(fuelQuantity: fuelQuantity);

}

class VehFuelQuantityFieldState extends State<VehFuelQuantityField>{

  RegExp inputFilter = RegExp(r"^[0-9]{0,4}(\.\d)?$");
  RegExp oneDecimalFilter = RegExp(r"^.*(\.)?(\d)?");
  double fuelQuantity;
  final textEditingController = TextEditingController();

  VehFuelQuantityFieldState({required this.fuelQuantity}) : super();

  @override
  void initState(){
    super.initState();

    textEditingController.text = fuelQuantity.toString();
  }

  @override
  Widget build(BuildContext context) {
    
    return BlocListener<FluidsformBloc, FluidsformState>(
      listenWhen: (p, c) => p.isEditing != c.isEditing,
      listener: (context, state) {
        textEditingController.text = "0";
      },
      child: Row(
        children: <Widget>[
          Expanded(
            child: BFTextInput(
                edgeMargin: 0,
                textController: textEditingController,
                hintText: AppLocalizations.of(context)!.fuelQuantity,
                label: AppLocalizations.of(context)!.fuelQuantity,
                outline: true,
                maxLength: 5,
                inputFormatterList: [
                  FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
                ],
                //errorMessage: '',
                onChanged: (String value) {
                  try {
                    if (value == "") {
                      return context
                          .read<FluidsformBloc>()
                          .add(FluidsformEvent.fuelQuantityChanged(0));
                    } else {
                      return context.read<FluidsformBloc>().add(
                          FluidsformEvent.fuelQuantityChanged(
                              double.parse(value)));
                    }
                  } catch (e, s) {
                    if (e is FormatException) {
                      log("Invalid double entered: $value. Storing 0 instead.",
                          name: "FuelQuantityField");
                      //The field s allowed to be empty, so store 0 in it
                      return context
                          .read<FluidsformBloc>()
                          .add(FluidsformEvent.fuelQuantityChanged(0));
                    } else {
                      log("Error: ",
                          name: "FuelQuantityField", error: e, stackTrace: s);
                    }
                  }
                },
                keyboardType: TextInputType.number,
                validator: (_) {
                  // Since the input in the text box may not match the values stored in the bloc (because the input may be an invalid decimal),
                  // check the input against the regex; if it passes, then continue with normal validation. Otherwise, fail validation.

                  inputFilter.stringMatch(textEditingController.text) == null
                      // TODO: Replace print with something else.
                      // ignore: avoid_print
                      ? print("No match.")
                      : inputFilter
                          .stringMatch(textEditingController.text)!
                          .length;
                  if ((inputFilter.hasMatch(textEditingController.text) &&
                          inputFilter
                                  .stringMatch(textEditingController.text)!
                                  .length ==
                              textEditingController.text.length) ||
                      textEditingController.text == "") {
                    return null;
                  } else if (oneDecimalFilter
                          .hasMatch(textEditingController.text) &&
                      oneDecimalFilter
                              .stringMatch(textEditingController.text)!
                              .length ==
                          textEditingController.text.length &&
                      textEditingController.text.contains(RegExp(r"\.\d"))) {
                    return AppLocalizations.of(context)!.invalidDecimalValue;
                  } else {
                    return AppLocalizations.of(context)!.invalidValue;
                  }
                }),
          ),
          SizedBox(
            width: 110,
            child: VehFuelUnits(),
          ),
        ],
      ),
    );
  }
}
