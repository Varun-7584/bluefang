// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'dart:developer';

import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/application/Fluids/fluids_form_bloc.dart';
import 'package:bluefang/src/presentation/pages/fluids/veh_oil_units_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Gets and stores the quantity of oil in the vehicle.

class VehOilQuantityField extends HookWidget {
  VehOilQuantityField({Key? key}) : super(key: key);

  RegExp inputFilter = RegExp(r"^[0-9]{0,4}(\.\d)?$");
  RegExp oneDecimalFilter = RegExp(r"^.*(\.)?(\d)?");

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController();
    return BlocListener<FluidsformBloc, FluidsformState>(
      listenWhen: (p, c) => p.isEditing != c.isEditing,
      listener: (context, state) {
        textEditingController.text = "0";
      },
      child: Row(
        children: <Widget>[
          Expanded(
            child: BFTextInput(
                //edgeMargin: 0,
                textController: textEditingController,
                hintText: AppLocalizations.of(context)!.oilQuantity,
                label: AppLocalizations.of(context)!.oilQuantity,
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
                          .add(FluidsformEvent.oilQuantityChanged(0));
                    } else {
                      return context.read<FluidsformBloc>().add(
                          FluidsformEvent.oilQuantityChanged(
                              double.parse(value)));
                    }
                  } catch (e, s) {
                    if (e is FormatException) {
                      log("Invalid double entered: $value. Storing 0 instead.",
                          name: "OilQuantityField");
                      //The field s allowed to be empty, so store 0 in it
                      return context
                          .read<FluidsformBloc>()
                          .add(FluidsformEvent.fuelQuantityChanged(0));
                    } else {
                      log("Error: ",
                          name: "OilQuantityField", error: e, stackTrace: s);
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
            width: 100,
            child: VehOilUnitsField(),
          ),
        ],
      ),
    );
  }
}
