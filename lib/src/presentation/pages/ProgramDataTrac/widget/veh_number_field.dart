// ignore_for_file: must_be_immutable, no_logic_in_create_state


import 'package:bluefang/src/application/ProgrammDataTrac/FormBloc/programdatatracform_bloc.dart';
import 'package:bluefang/src/presentation/core/widgets/bluefang_image_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VehNumberField extends StatefulWidget {
  String vehNumber;
  VehNumberField({Key? key, required this.vehNumber}) : super(key: key);

  @override
  State<VehNumberField> createState() => VehNumberFieldState(vehNumber: vehNumber);

}

class VehNumberFieldState extends State<VehNumberField>{
  String vehNumber;
  VehNumberFieldState({required this.vehNumber}) : super();
  final textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.text = vehNumber;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgramdatatracformBloc, ProgramdatatracformState>(
        buildWhen: (p, c) =>
            p.isEditing != c.isEditing,
        builder: (context, state) {          
          //log("Received state change.", name: "veh_number_field.dart");
          return BFInputAndImage(
            textController: textEditingController,
            hintText: AppLocalizations.of(context)!.vehicleNumber,
            imagePath: "assets/images/VehicleNumberIcon.png",
            label: AppLocalizations.of(context)!.vehicleNumber,
            outline: true,
            maxLength: 11,
            onChanged: (value) => context
                .read<ProgramdatatracformBloc>()
                .add(ProgramdatatracformEvent.vehicleNumberChanged(value)),
            validator: (value) {
              if (textEditingController.text == "") {
                return '${AppLocalizations.of(context)!.vehicleNumber} ${AppLocalizations.of(context)!.fieldEmpty}';
              }
              return context
                  .read<ProgramdatatracformBloc>()
                  .state
                  .programmedDataTrac
                  .vehicle
                  .vehId
                  .value
                  .fold(
                      (failure) => failure.maybeMap(
                          empty: (f) =>
                              '${AppLocalizations.of(context)!.vehicleNumber} ${AppLocalizations.of(context)!.fieldEmpty}',
                          orElse: () =>
                              AppLocalizations.of(context)!.invalidValue),
                      (validValue) => null);
            },
            inputFormatterList: [FilteringTextInputFormatter.deny(RegExp("[{}|~`]"))],
          );
        });
  }
}
