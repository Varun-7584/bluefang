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
class VehDefTypeField extends HookWidget {
  VehDefTypeField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FluidsformBloc, FluidsformState>(
        // This prevents the widget from rebuilding every time a key is pressed.
        buildWhen: (p, c) => p.isEditing != c.isEditing,
        builder: (context, state) {
          final String language = context.read<LanguageBloc>().state.language;
          return BFDropdown(
            label: AppLocalizations.of(context)!.defType,
            itemList: (language == "es" 
              ? ReferenceTableDataES.defType.values.toList() 
              : (language == "fr" 
                  ? ReferenceTableDataFR.defType.values.toList()
                  : ReferenceTableDataEN.defType.values.toList()
                )
            ),
            dropdownValue: (
              context.read<LanguageBloc>().state.language == "es" ? 
              ReferenceTableDataES.defType[context.read<FluidsformBloc>().state.defType] ?? "S_Liters"
              : (context.read<LanguageBloc>().state.language == "fr"
                ? ReferenceTableDataFR.defType[context.read<FluidsformBloc>().state.defType] ?? "F_Liters"
                : ReferenceTableDataEN.defType[context.read<FluidsformBloc>().state.defType] ?? "Liters"
              )
            ),
            whenChanged: (String? value) {
              language == "es" 
                ? context.read<FluidsformBloc>().add(
                  FluidsformEvent.defTypeChanged(
                    ReferenceTableDataES.defType.keys.firstWhere(
                            (k) => ReferenceTableDataES.defType[k] == value,
                            orElse: () => 0))
                )
                : (language == "fr"
                  ? context.read<FluidsformBloc>().add(
                      FluidsformEvent.defTypeChanged(
                        ReferenceTableDataFR.defType.keys.firstWhere(
                                (k) => ReferenceTableDataFR.defType[k] == value,
                                orElse: () => 0))
                    )
                  : context.read<FluidsformBloc>().add(
                      FluidsformEvent.defTypeChanged(
                        ReferenceTableDataEN.defType.keys.firstWhere(
                                (k) => ReferenceTableDataEN.defType[k] == value,
                                orElse: () => 0))
                    )
                  );
            },
            validator: (_) => null,
          );
        });
  }
}
