// ignore_for_file: avoid_field_initializers_in_const_classes, must_be_immutable, unnecessary_parenthesis, unnecessary_statements
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

/// Dropdown field to select the vehicle's oil type.
///
/// [author] Bailie Livingston. 
class VehOilTypeField extends HookWidget {
  VehOilTypeField({Key? key}) : super(key: key);

  String dropdownValue = "Oil Type";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FluidsformBloc, FluidsformState>(
        // This prevents the widget from rebuilding every time a key is pressed.
        buildWhen: (p, c) => p.isEditing != c.isEditing,
        builder: (context, state) {
          final String language = context.read<LanguageBloc>().state.language;
            dropdownValue = (
              context.read<LanguageBloc>().state.language == "es" ? 
              ReferenceTableDataES.oilType[context.read<FluidsformBloc>().state.oilType] ?? "S_Liters"
              : (context.read<LanguageBloc>().state.language == "fr"
                ? ReferenceTableDataFR.oilType[context.read<FluidsformBloc>().state.oilType] ?? "F_Liters"
                : ReferenceTableDataEN.oilType[context.read<FluidsformBloc>().state.oilType] ?? "Liters"
              )
            );
          return BFDropdown(
            label: AppLocalizations.of(context)!.oilType,
            itemList: (language == "es" 
              ? ReferenceTableDataES.oilType.values.toList() 
              : (language == "fr" 
                  ? ReferenceTableDataFR.oilType.values.toList()
                  : ReferenceTableDataEN.oilType.values.toList()
                )
            ),
            dropdownValue: dropdownValue,
            whenChanged: (String? value) {
              language == "es" 
                ? context.read<FluidsformBloc>().add(
                  FluidsformEvent.oilTypeChanged(
                    ReferenceTableDataES.oilType.keys.firstWhere(
                            (k) => ReferenceTableDataES.oilType[k] == value,
                            orElse: () => 0))
                )
                : (language == "fr"
                  ? context.read<FluidsformBloc>().add(
                      FluidsformEvent.oilTypeChanged(
                        ReferenceTableDataFR.oilType.keys.firstWhere(
                                (k) => ReferenceTableDataFR.oilType[k] == value,
                                orElse: () => 0))
                    )
                  : context.read<FluidsformBloc>().add(
                      FluidsformEvent.oilTypeChanged(
                        ReferenceTableDataEN.oilType.keys.firstWhere(
                                (k) => ReferenceTableDataEN.oilType[k] == value,
                                orElse: () => 0))
                    )
                  );
            },
            validator: (_) => null,
            dropdownLength: 6
          );
        });
  }
}
