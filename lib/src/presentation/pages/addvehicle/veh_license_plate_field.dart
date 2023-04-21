// ignore_for_file: must_be_immutable, no_logic_in_create_state, prefer_const_constructors_in_immutables


import 'package:bluefang/src/application/AddNewVehicle/addvehicle_bloc.dart';
import 'package:bluefang/src/presentation/core/widgets/bluefang_image_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VehLicensePlateField extends StatefulWidget {
  //String vehLicensePlate;

  VehLicensePlateField(
    //{required this.vehLicensePlate}
  ) : super();

  @override
  State<VehLicensePlateField> createState() => VehLicensePlateFieldState(
    //vehLicensePlate: vehLicensePlate
    );
}

class VehLicensePlateFieldState extends State<VehLicensePlateField>{
  final textEditingController = TextEditingController();
  //String vehLicensePlate;
  /// Field to get the vehicle's license plate number.
  ///
  /// ```
  /// const VehLicensePlateField({Key? key})
  /// ```
  VehLicensePlateFieldState(
    //{required this.vehLicensePlate}
    ) : super();

  @override
  void initState(){
    super.initState();
    final AddVehicleState state = context.read<AddVehicleBloc>().state;
    textEditingController.text = state
              .vehicle.vehPlateId.value
              .fold((l) => "0", (r) => r);
  }

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<AddVehicleBloc, AddVehicleState>(
        buildWhen: (p, c) => p.isEditing != c.isEditing,
        builder: (context, state) {
          return BFInputAndImage(
            imagePath: "assets/images/LicensePlateIcon.png",
            textController: textEditingController,
            hintText: AppLocalizations.of(context)!.licensePlate,
            label: AppLocalizations.of(context)!.licensePlate,
            outline: true,
            maxLength: 12,
            onChanged: (String value) => context
                .read<AddVehicleBloc>()
                .add(AddVehicleEvent.vehicleLicensePlateNumberChanged(
                    value)),
            validator: (_) => context
                .read<AddVehicleBloc>()
                .state
                .vehicle
                .vehPlateId
                .value
                .fold(
                    (failure) => failure.maybeMap(
                        empty: (f) =>
                            '${AppLocalizations.of(context)!.licensePlate} ${AppLocalizations.of(context)!.fieldEmpty}',
                        orElse: () => null),
                    (validValue) => null),
          );
        });
  }
}
