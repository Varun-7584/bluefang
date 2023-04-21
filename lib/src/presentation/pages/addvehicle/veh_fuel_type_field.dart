// ignore_for_file: must_be_immutable, unnecessary_statements, unnecessary_parenthesis
import 'package:bluefang/src/application/AddNewVehicle/addvehicle_bloc.dart';
import 'package:bluefang/src/application/LanguageSupport/language_bloc.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_en.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_es.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_fr.dart';
import 'package:bluefang/src/presentation/core/widgets/bluefang_image_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Dropdown field to select the vehicle's fuel type.
///
/// [author] Bailie Livingston.
///
/// ```
/// const VehFuelTypeField({Key? key})
/// ```
class VehFuelTypeField extends HookWidget {
  VehFuelTypeField({Key? key}) : super(key: key);
  String dropdownValue = "Fuel Type";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddVehicleBloc, AddVehicleState>(
        // This prevents the widget from rebuilding every time a key is pressed.
        buildWhen: (p, c) => p.isEditing != c.isEditing,
        builder: (context, state) {
          final String language = context.read<LanguageBloc>().state.language;
          dropdownValue = (
              language == "es" ? 
              ReferenceTableDataES.vehicleFuelType[context.read<AddVehicleBloc>().state.modelAndFuel.vehFuelType.getOrCrash()] ?? "S_Undefined"
              : (language == "fr"
                ? ReferenceTableDataFR.vehicleFuelType[context.read<AddVehicleBloc>().state.modelAndFuel.vehFuelType.getOrCrash()] ?? "F_Undefined"
                : ReferenceTableDataEN.vehicleFuelType[context.read<AddVehicleBloc>().state.modelAndFuel.vehFuelType.getOrCrash()] ?? "Undefined"
              )
            );
          return BFDropdownAndImage(
            label: AppLocalizations.of(context)!.fuelType,
            itemList: (language == "es" 
              ? ReferenceTableDataES.vehicleFuelType.values.toList() 
              : (language == "fr" 
                  ? ReferenceTableDataFR.vehicleFuelType.values.toList()
                  : ReferenceTableDataEN.vehicleFuelType.values.toList()
                )
            ),
            dropdownValue: dropdownValue,
            imagePath: "assets/images/FuelIcon.png",
            whenChanged: (String value) {
              language == "es" 
                ? context.read<AddVehicleBloc>().add(
                  AddVehicleEvent.fuelTypeChanged(
                    ReferenceTableDataES.vehicleFuelType.keys.firstWhere(
                            (k) => ReferenceTableDataES.vehicleFuelType[k] == value,
                            orElse: () => 0))
                )
                : (language == "fr"
                  ? context.read<AddVehicleBloc>().add(
                      AddVehicleEvent.fuelTypeChanged(
                        ReferenceTableDataFR.vehicleFuelType.keys.firstWhere(
                                (k) => ReferenceTableDataFR.vehicleFuelType[k] == value,
                                orElse: () => 0))
                    )
                  : context.read<AddVehicleBloc>().add(
                      AddVehicleEvent.fuelTypeChanged(
                        ReferenceTableDataEN.vehicleFuelType.keys.firstWhere(
                                (k) => ReferenceTableDataEN.vehicleFuelType[k] == value,
                                orElse: () => 0))
                    )
                  );
            },
            validator: (_) => context
                .read<AddVehicleBloc>()
                .state
                .modelAndFuel
                .vehFuelType
                .value
                /// When completed, check these conditions
                .fold(
                  /// Check the value to see if it failed using the maybeMap().
                  ///  If any of the conditions inside the maybeMap are met, the value has failed.
                  (failure) => failure.maybeMap(
                      /// The fuel type cannot be empty.
                      empty: (f) =>
                          '${AppLocalizations.of(context)!.fuelType} ${AppLocalizations.of(context)!.fieldEmpty}',
                      /// For any other issues.
                      orElse: () => AppLocalizations.of(context)!.invalidValue),
                  /// Don't give an error message if the input was valid.
                  (validValue) => null,
                ),
            dropdownLength: 6
          );
        });
  }
}
