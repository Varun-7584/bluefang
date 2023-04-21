// ignore_for_file: must_be_immutable, no_logic_in_create_state, prefer_const_constructors, prefer_final_fields

import 'package:bluefang/src/application/AddNewVehicle/addvehicle_bloc.dart';
import 'package:bluefang/src/presentation/core/widgets/bluefang_image_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VinField extends StatefulWidget {
  bool fieldHasFocus = true;
  VinField({Key? key}) : super(key: key);
  @override
  State<VinField> createState() => VinFieldState();
}

class VinFieldState extends State<VinField>{
  
  final textEditingController = TextEditingController();
  Icon all17Icon = Icon(Icons.clear, color: Colors.red);

  VinFieldState() : super();

  @override
  void initState(){
    super.initState();
    final AddVehicleState state = context.read<AddVehicleBloc>().state;
    textEditingController.text = state.vehicle.vinId.getOrCrash();
    if (textEditingController.text.length == 17){
      all17Icon = Icon(Icons.check, color: Colors.green);
    } 
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddVehicleBloc, AddVehicleState>(
      buildWhen: (p, c) => p.isEditing != c.isEditing,
      builder: (context, state) {
      /// Currently, if the user selects the VIN box and then tries to program the datatrac, it will not check for the length requirement.
        return Focus(
          child:BFInputAndImage(
            textController: textEditingController,
            imagePath: "assets/images/VINIcon.png",
            hintText: AppLocalizations.of(context)!.vin,
            outline: true,
            maxLength: 17,
            label: AppLocalizations.of(context)!.vin,
            suffixIcon: all17Icon,
            onChanged: (String value){ 
              //onFieldSubmitted();

              if (value.length == 17){
                setState(() {
                  all17Icon = Icon(Icons.check, color: Colors.green);
                });
              }
              else {
                setState(() {
                  all17Icon = Icon(Icons.clear, color: Colors.red);
                });
              }
              context
                .read<AddVehicleBloc>()
                .add(AddVehicleEvent.vinNumberChanged(value));
            },
            validator: (input) {
              return validateTheInput(context, textEditingController.text,
                  hasFocus: widget.fieldHasFocus);
            }
          ),
          onFocusChange: (hasFocus) {
            if (hasFocus != widget.fieldHasFocus) {
              widget.fieldHasFocus = hasFocus;
            }
          }
        );
      }
    );
  }

  String? validateTheInput(BuildContext context, String text,
      {bool hasFocus = true}) {
    if (!hasFocus && text.length < 17) {
      return AppLocalizations.of(context)!.vinTooShort;
    }
    return context
        .read<AddVehicleBloc>()
        .state
        .vehicle
        .vinId
        .value
        .fold(
            (failure) => failure.maybeMap(
                  empty: (f) =>
                      '${AppLocalizations.of(context)!.vin} ${AppLocalizations.of(context)!.fieldEmpty}',
                  orElse: () => AppLocalizations.of(context)!.invalidValue,
                ),
            (validValue) => null);
  }
}
