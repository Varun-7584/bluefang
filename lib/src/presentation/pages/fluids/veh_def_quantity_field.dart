// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'dart:developer';

import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/application/Fluids/fluids_form_bloc.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_en.dart';
import 'package:bluefang/src/presentation/pages/fluids/veh_atf_units_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Gets and stores the fuel Quantity of the vehicle.

class VehDefQuantityField extends HookWidget {
  VehDefQuantityField({Key? key}) : super(key: key);

  /// Only allows 0-4 integers before an optional decimal point and one optional digit afterwards
  RegExp inputFilter = RegExp(r"^[0-9]{0,3}(\.\d)?$");
  /// Matches on multiple decimal points or other non-valid characters
  RegExp oneDecimalFilter = RegExp(r"^.*(\.\d)?");

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
                textController: textEditingController,
                hintText: AppLocalizations.of(context)!.defQuantity,
                label: AppLocalizations.of(context)!.defQuantity,
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
                          .add(FluidsformEvent.defQuantityChanged(0));
                    } else {
                      return context.read<FluidsformBloc>().add(
                          FluidsformEvent.defQuantityChanged(
                              double.parse(value)));
                    }
                  } catch (e, s) {
                    // 
                    if (e is FormatException) {
                      log("Invalid double entered: $value. Storing 0 instead.",
                          name: "defQuantityField");
                      //The field s allowed to be empty, so store 0 in it
                      return context
                          .read<FluidsformBloc>()
                          .add(FluidsformEvent.defQuantityChanged(0));
                    } else {
                      log("Error: ",
                          name: "defQuantityField", error: e, stackTrace: s);
                    }
                  }
                },
                keyboardType: TextInputType.number,
                // ignore: body_might_complete_normally_nullable
                validator: (_) {
                  // Since the input in the text box may not match the values stored in the bloc (because the input may be an invalid decimal),
                  // check the input against the regex; if it passes, then continue with normal validation. Otherwise, fail validation.
                  if ((inputFilter.hasMatch(textEditingController.text) &&
                          inputFilter
                                  .stringMatch(textEditingController.text)!
                                  .length ==
                              textEditingController.text.length) ||
                      textEditingController.text == "") {
                  } else if (oneDecimalFilter
                          .hasMatch(textEditingController.text) &&
                      oneDecimalFilter
                              .stringMatch(textEditingController.text)!
                              .length ==
                          textEditingController.text.length &&
                      (textEditingController.text.contains(RegExp(r"\.\d")) || textEditingController.text.contains(RegExp(r"\.")))) {
                    return AppLocalizations.of(context)!.invalidDecimalValue;
                    //Needs to be checked AFTER making sure this is a valid decimal
                  } else if (double.parse(textEditingController.text) > ReferenceTableDataEN.maxFluidQuantity){
                    return "${AppLocalizations.of(context)!.invalidRange} ${ReferenceTableDataEN.maxFluidQuantity}";
                  } else {
                    return AppLocalizations.of(context)!.invalidValue;
                  }
                }),
          ),
          SizedBox(
            width: 110,
            child: VehATFUnitsField(),
          ),
        ],
      ),
    );
  }
}
