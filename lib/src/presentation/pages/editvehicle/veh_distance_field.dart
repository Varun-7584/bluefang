// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, no_logic_in_create_state

import 'dart:developer';

import 'package:bluefang/src/application/EditVehicle/editvehicle_bloc.dart';
import 'package:bluefang/src/presentation/core/widgets/bluefang_image_text_input.dart';
import 'package:bluefang/src/presentation/pages/editvehicle/veh_dist_units_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VehDistanceField extends StatefulWidget {
  String vehLifeDist; 

  /// Gets and stores the distance the vehicle has traveled.
  ///
  /// Includes the distance units field next to the distance field itself.
  VehDistanceField({required this.vehLifeDist}) : super();

  @override
  State<VehDistanceField> createState() => VehDistanceFieldState(vehLifeDist: vehLifeDist);

}
  
class VehDistanceFieldState extends State<VehDistanceField>{
  String vehLifeDist; 
  VehDistanceFieldState({required this.vehLifeDist}) : super();
  final textEditingController = TextEditingController();

  @override
  void initState(){
    super.initState();
    //final EditVehicleState state = getIt<EditVehicleBloc>().state;
    textEditingController.text = vehLifeDist;
          //state.programmedDataTrac.distance.dtLifeMiles.value.fold((l) => "0", (r) => r).toString();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditVehicleBloc, EditVehicleState>(
        buildWhen: (p, c) {
      return p.isEditing != c.isEditing;
    }, builder: (context, state) {
      
      return Row(
        children: <Widget>[
          Expanded(
              child: BFInputAndImage(
            edgeMargin: 0,
            textController: textEditingController,
            inputFormatterList: [FilteringTextInputFormatter.digitsOnly],
            imagePath: "assets/images/DistanceIcon.png",
            hintText: AppLocalizations.of(context)!.vehicleDistance,
            label: AppLocalizations.of(context)!.vehicleDistance,
            outline: true,
            maxLength: 8,
            onChanged: (String value) {
              try {
                context.read<EditVehicleBloc>().add(
                    EditVehicleEvent.presetDistanceChanged(
                        int.parse(value)));
              } catch (e, s) {
                if (e is FormatException) {
                  log("Invalid integer entered: $value (may be empty)",
                      name: "VehDistanceField");
                  context.read<EditVehicleBloc>().add(
                    EditVehicleEvent.presetDistanceChanged(0));
                } else {
                  log("Error: ",
                      name: "VehDistanceField", error: e, stackTrace: s);
                }
              }
            },
            keyboardType: TextInputType.number,
            validator: (_) {
              if (textEditingController.text != "") {
                return context
                    .read<EditVehicleBloc>()
                    .state
                    .programmedDataTrac
                    .distance
                    .dtLifeMiles
                    .value
                    .fold(
                        (failure) => failure.maybeMap(
                              invalidRange: (f) =>
                                  '${AppLocalizations.of(context)!.invalidRange} ${f.max}',
                              invalidIntValue: (f) =>
                                  AppLocalizations.of(context)!.invalidIntValue,
                              orElse: () =>
                                  AppLocalizations.of(context)!.invalidValue,
                            ),
                        (validValue) => null);
              } else {
                return "${AppLocalizations.of(context)!.vehicleDistance} ${AppLocalizations.of(context)!.fieldEmpty}";
              }
            },
          )),
          SizedBox(
            width: MediaQuery.of(context).size.width > 500 ? 160 : 100,
            child: VehDistUnitsField(),
          ),
        ],
      );
    });
  }
}
