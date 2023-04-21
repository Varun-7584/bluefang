// ignore_for_file: prefer_const_constructors, unnecessary_statements, unnecessary_parenthesis

import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/package/bluefang_ui/src/widgets/bluefang_dropdown.dart';
import 'package:bluefang/src/application/LanguageSupport/language_bloc.dart';
import 'package:bluefang/src/application/UserPreferencesBloc/userpreferences_bloc.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_en.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_es.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_fr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Field to get and hold the units used for distance.
///
/// ```
/// const VehDistUnitsField({Key? key})
/// ```
///
class VehOilUnitsField extends HookWidget {
  const VehOilUnitsField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPreferencesBloc, UserPreferencesState>(
        buildWhen: (p, c) => p.oilUOM != c.oilUOM,
        builder: (context, state) {
          final String language = context.read<LanguageBloc>().state.language;
          return BFDropdown(
            style: TextStyle(color: kcBlack),
            label: AppLocalizations.of(context)!.units,
            edgeMargin: 0,
            whenChanged: (String? value) {
              language == "es" 
                ? context.read<UserPreferencesBloc>().add(
                  UserPreferencesEvent.oilUomChanged(
                    ReferenceTableDataES.uomFluids.keys.firstWhere(
                            (k) => ReferenceTableDataES.uomFluids[k] == value,
                            orElse: () => 0))
                )
                : (language == "fr"
                  ? context.read<UserPreferencesBloc>().add(
                      UserPreferencesEvent.oilUomChanged(
                        ReferenceTableDataFR.uomFluids.keys.firstWhere(
                                (k) => ReferenceTableDataFR.uomFluids[k] == value,
                                orElse: () => 0))
                    )
                  : context.read<UserPreferencesBloc>().add(
                      UserPreferencesEvent.oilUomChanged(
                        ReferenceTableDataEN.uomFluids.keys.firstWhere(
                                (k) => ReferenceTableDataEN.uomFluids[k] == value,
                                orElse: () => 0))
                    )
                  );
            },
            itemList: (language == "es" 
              ? ReferenceTableDataES.uomFluids.values.toList() 
              : (language == "fr" 
                  ? ReferenceTableDataFR.uomFluids.values.toList()
                  : ReferenceTableDataEN.uomFluids.values.toList()
                )
            ),
            dropdownValue: (
              context.read<LanguageBloc>().state.language == "es" ? 
              ReferenceTableDataES.uomFluids[context.read<UserPreferencesBloc>().state.oilUOM] ?? "S_Liters"
              : (context.read<LanguageBloc>().state.language == "fr"
                ? ReferenceTableDataFR.uomFluids[context.read<UserPreferencesBloc>().state.oilUOM] ?? "F_Liters"
                : ReferenceTableDataEN.uomFluids[context.read<UserPreferencesBloc>().state.oilUOM] ?? "Liters"
              )
            ),
          );
        });
  }
}
