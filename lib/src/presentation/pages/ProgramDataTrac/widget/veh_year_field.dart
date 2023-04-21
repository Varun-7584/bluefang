// ignore_for_file: require_trailing_commas, must_be_immutable, avoid_redundant_argument_values, sized_box_for_whitespace, no_logic_in_create_state

import 'package:bluefang/src/application/ProgrammDataTrac/FormBloc/programdatatracform_bloc.dart';
import 'package:bluefang/src/presentation/core/widgets/bluefang_image_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VehYearField extends StatefulWidget {
  int vehYear;
  /// Gets and stores the vehicle's model year.
  ///
  /// Defaults to displaying the current year or the last entered year.
  /// The year is selected with a calendar picker, which displays from 2001 to two years beyond the current year.
  VehYearField({Key? key, required this.vehYear}) : super(key: key);

  @override
  State<VehYearField> createState() => VehYearFieldState(vehYear: vehYear);
}
class VehYearFieldState extends State<VehYearField>{
  final textEditingController = TextEditingController();
  int vehYear;
  DateTime _selectedDate = DateTime.now();
  String _previousText = "";

  VehYearFieldState({required this.vehYear}) : super();

  @override
  void initState(){
    super.initState();
    textEditingController.text = (vehYear + 2000).toString();
    _selectedDate = DateTime.utc(vehYear);
  }


  @override
  Widget build(BuildContext context) {
    textEditingController.addListener(() {
      if (textEditingController.text != _previousText) {
        context.read<ProgramdatatracformBloc>().add(
            ProgramdatatracformEvent.vehicleModelYearChanged(
                int.tryParse(textEditingController.text) == null
                    ? 01
                    : int.parse(textEditingController.text) - 2000));
        _previousText = textEditingController.text;
      }
    });
    return BlocBuilder<ProgramdatatracformBloc, ProgramdatatracformState>(
        buildWhen: (p, c) => p.isEditing != c.isEditing,
        builder: (context, state) {
          
          return BFInputAndImage(
            imagePath: "assets/images/ModelYearIcon.png",
            readOnly: true,
            textController: textEditingController,
            suffixIcon: const Icon(Icons.calendar_today),
            label: AppLocalizations.of(context)!.vehicleModelYear,
            outline: true,
            focusedBorderColor: Colors.blue,
            onSuffixTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Container(
                      // Need to use container to add size constraint.
                      width: 300,
                      height: 500, // 150
                      child: YearPicker(
                        firstDate: DateTime(2001, 1),
                        lastDate: DateTime(DateTime.now().year + 2),
                        // save the selected date to _selectedDate DateTime variable.
                        // It's used to set the previous selected date when
                        // re-showing the dialog.
                        selectedDate: _selectedDate,
                        onChanged: (DateTime dateTime) {
                          _selectedDate = dateTime;
                          textEditingController.text = dateTime.year.toString();
                          // close the dialog when year is selected.
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                },
              );
            },
            validator: (_) => context
                .read<ProgramdatatracformBloc>()
                .state
                .programmedDataTrac
                .modelAndFuel
                .vehYear
                .value
                .fold(
                    (failure) => failure.maybeMap(
                          empty: (f) =>
                              '${AppLocalizations.of(context)!.vehicleModelYear} ${AppLocalizations.of(context)!.fieldEmpty}',
                          invalidRange: (f) =>
                              AppLocalizations.of(context)!.invalidValue,
                          orElse: () =>
                              AppLocalizations.of(context)!.invalidValue,
                        ),
                    (validValue) => null),
          );
        });
  }
}
