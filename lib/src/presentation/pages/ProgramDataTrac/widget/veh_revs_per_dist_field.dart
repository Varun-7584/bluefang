// ignore_for_file: avoid_print, must_be_immutable, avoid_positional_boolean_parameters, prefer_const_constructors_in_immutables, no_logic_in_create_state, prefer_const_constructors
import 'dart:developer';

import 'package:bluefang/src/application/ProgrammDataTrac/FormBloc/programdatatracform_bloc.dart';
import 'package:bluefang/src/presentation/core/widgets/bluefang_image_text_input.dart';
import 'package:bluefang/src/presentation/pages/ProgramDataTrac/widget/veh_dist_units_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Gets and stores the number of wheel revolutions it takes the vehicle to move one unit of distance.
///
/// ```
/// const VehRevsPerDistField({Key? key})
/// ```
///
/// Includes the Vehicle Distance Units field [vehDistUnitsField].
class VehRevsPerDistField extends StatefulWidget {
  VehRevsPerDistField({Key? key, required this.revsPerDist}) : super(key: key);
  String revsPerDist;
  bool fieldHasFocus = true;

  @override
  State<VehRevsPerDistField> createState() {
    return VehRevsPerDistFieldState();
  }
}

class VehRevsPerDistFieldState extends State<VehRevsPerDistField> {
  VehRevsPerDistFieldState() : super();
  bool isEmpty = true;
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgramdatatracformBloc, ProgramdatatracformState>(
        buildWhen: (p, c) =>
            p.isEditing != c.isEditing,
        builder: (context, state) {
          textEditingController.text = state
              .programmedDataTrac.sensor.dtRpd.value
              .fold((l) => "0", (r) => r)
              .toString();
          return Row(
            children: <Widget>[
              Expanded(
                child: Focus(
                  child: BFInputAndImage(
                      edgeMargin: 0,
                      keyboardType: TextInputType.number,
                      label: AppLocalizations.of(context)!.revolutions,
                      imagePath: "assets/images/RevsPerMileIcon.png",
                      hintText: AppLocalizations.of(context)!.revolutions,
                      outline: true,
                      textController: textEditingController,
                      maxLength: 4,
                      inputFormatterList: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onChanged: (String value) {
                        try {
                          context.read<ProgramdatatracformBloc>().add(
                              ProgramdatatracformEvent.revPerMilesChanged(
                                  int.parse(value)));
                        } catch (e) {
                          log('Error Parsing int; value passed was: $value.',
                              name: 'veh_revs_per_dist_field.dart');
                        }
                      },
                      validator: (_) {
                        // If the text field is empty, standard validation won't catch that because the value wasn't submitted to the bloc.
                        isEmpty = textEditingController.text.isEmpty;
                        if (isEmpty && !widget.fieldHasFocus) {
                          return "${AppLocalizations.of(context)!.revolutions} ${AppLocalizations.of(context)!.fieldEmpty}";
                        } else {
                          return context
                              .read<ProgramdatatracformBloc>()
                              .state
                              .programmedDataTrac
                              .sensor
                              .dtRpd
                              .value
                              .fold(
                                  (failure) => failure.maybeMap(
                                      invalidRange: (f) =>
                                          '${AppLocalizations.of(context)!.invalidRange} ${f.max}',
                                      invalidIntValue: (f) =>
                                          AppLocalizations.of(context)!
                                              .invalidIntValue,
                                      orElse: () =>
                                          AppLocalizations.of(context)!
                                              .invalidValue),
                                  (validValue) => null);
                        }
                      }),
                  onFocusChange: (hasFocus) {
                    if (widget.fieldHasFocus != hasFocus) {
                      widget.fieldHasFocus = hasFocus;
                    }
                  },
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width > 500 ? 160 : 120,
                child: VehDistUnitsField(),
              ),
            ],
          );
        });
  }
}
