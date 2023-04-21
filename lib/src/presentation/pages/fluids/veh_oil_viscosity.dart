// ignore_for_file: avoid_field_initializers_in_const_classes, must_be_immutable, unnecessary_parenthesis, unnecessary_statements, prefer_final_locals
import 'package:bluefang/package/bluefang_ui/src/widgets/bluefang_dropdown.dart';
import 'package:bluefang/src/application/Fluids/fluids_form_bloc.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Dropdown field to select the vehicle's engine oil viscosity.
///
/// [author] Bailie Livingston.
///
class VehOilViscosityField extends HookWidget {
  VehOilViscosityField({Key? key}) : super(key: key);

  String dropdownValue = "Oil Type";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FluidsformBloc, FluidsformState>(
        // This prevents the widget from rebuilding every time a key is pressed.
        buildWhen: (p, c) => p.isEditing != c.isEditing,
        //NOTE: oil viscosity does not change with language
        builder: (context, state) {
          dropdownValue = ReferenceTableDataEN.oilVisc[context.read<FluidsformBloc>().state.oilVisc] ?? "Liters";
          return BFDropdown(
            dropdownLength: 6,
            label: AppLocalizations.of(context)!.oilViscosity,
            //Oil viscosity does not change wth language
            itemList: ReferenceTableDataEN.oilVisc.values.toList(),
            dropdownValue: dropdownValue,
            whenChanged: (String? value) {
              context.read<FluidsformBloc>().add(
                FluidsformEvent.oilViscosityChanged(
                  ReferenceTableDataEN.oilVisc.keys.firstWhere(
                          (k) => ReferenceTableDataEN.oilVisc[k] == value,
                          orElse: () => 0))
              );
            },
            validator: (_) => null,
          );
        }
      );
  }
}
