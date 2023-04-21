// ignore_for_file: avoid_field_initializers_in_const_classes, must_be_immutable, prefer_const_constructors_in_immutables, unnecessary_statements, unnecessary_parenthesis
import 'package:bluefang/package/bluefang_ui/src/widgets/bluefang_dropdown.dart';
import 'package:bluefang/src/application/Fluids/fluids_form_bloc.dart';
import 'package:bluefang/src/application/LanguageSupport/language_bloc.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_en.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_es.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_fr.dart';
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
class VehCoolantTypeField extends HookWidget {
  VehCoolantTypeField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FluidsformBloc, FluidsformState>(
        // This prevents the widget from rebuilding every time a key is pressed.
        buildWhen: (p, c) => p.isEditing != c.isEditing,
        builder: (context, state) {
          final String language = context.read<LanguageBloc>().state.language;
          return BFDropdown(
            label: AppLocalizations.of(context)!.coolantType,
            itemList: (language == "es"
                ? ReferenceTableDataES.coolantType.values.toList()
                : (language == "fr"
                    ? ReferenceTableDataFR.coolantType.values.toList()
                    : ReferenceTableDataEN.coolantType.values.toList())),
            dropdownValue: context.read<LanguageBloc>().state.language == "es"
                ? ReferenceTableDataES.coolantType[
                        context.read<FluidsformBloc>().state.coolantType] ??
                    "S_Liters"
                : (context.read<LanguageBloc>().state.language == "fr"
                    ? ReferenceTableDataFR.coolantType[
                            context.read<FluidsformBloc>().state.coolantType] ??
                        "F_Liters"
                    : ReferenceTableDataEN.coolantType[
                            context.read<FluidsformBloc>().state.coolantType] ??
                        "Liters"),
            whenChanged: (String? value) {
              language == "es"
                  ? context.read<FluidsformBloc>().add(FluidsformEvent.coolantTypeChanged(
                      ReferenceTableDataES.coolantType.keys.firstWhere(
                          (k) => ReferenceTableDataES.coolantType[k] == value,
                          orElse: () => 0)))
                  : (language == "fr"
                      ? context.read<FluidsformBloc>().add(
                          FluidsformEvent.coolantTypeChanged(ReferenceTableDataFR
                              .coolantType.keys
                              .firstWhere((k) => ReferenceTableDataFR.coolantType[k] == value,
                                  orElse: () => 0)))
                      : context
                          .read<FluidsformBloc>()
                          .add(FluidsformEvent.coolantTypeChanged(ReferenceTableDataEN.coolantType.keys.firstWhere((k) => ReferenceTableDataEN.coolantType[k] == value, orElse: () => 0))));
            },
            validator: (_) => null,
          );
        });
  }
}
