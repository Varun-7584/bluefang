// ignore_for_file: unnecessary_parenthesis, prefer_final_locals, unnecessary_statements
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

/// Field to get and store the units used for the vehicle's fuel.
///
/// ```
/// const VehFuelUnits({Key? key})
/// ```
class VehFuelUnits extends HookWidget {
  const VehFuelUnits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPreferencesBloc, UserPreferencesState>(
        buildWhen: (p, c) => p.fuelUOM != c.fuelUOM,
        builder: (context, state) {
          String language = context.read<LanguageBloc>().state.language;
          return BFDropdown(
            label: AppLocalizations.of(context)!.units,
            itemList: (language == "es" 
            ? ReferenceTableDataES.uomFuel.values.toList() 
            : (language == "fr" 
                ? ReferenceTableDataFR.uomFuel.values.toList()
                : ReferenceTableDataEN.uomFuel.values.toList()
              )
            ),
            edgeMargin: 0,
            whenChanged: (value) {
              language == "es" 
                ? context.read<UserPreferencesBloc>().add(
                  UserPreferencesEvent.storeFuelUOM(
                    ReferenceTableDataES.uomFuel.keys.firstWhere(
                            (k) => ReferenceTableDataES.uomFuel[k] == value,
                            orElse: () => 0))
                )
                : (language == "fr"
                  ? context.read<UserPreferencesBloc>().add(
                      UserPreferencesEvent.storeFuelUOM(
                        ReferenceTableDataFR.uomFuel.keys.firstWhere(
                                (k) => ReferenceTableDataFR.uomFuel[k] == value,
                                orElse: () => 0))
                    )
                  : context.read<UserPreferencesBloc>().add(
                      UserPreferencesEvent.storeFuelUOM(
                        ReferenceTableDataEN.uomFuel.keys.firstWhere(
                                (k) => ReferenceTableDataEN.uomFuel[k] == value,
                                orElse: () => 0))
                    )
                  );
            },
            dropdownValue: (
              context.read<LanguageBloc>().state.language == "es" ? 
              ReferenceTableDataES.uomFuel[context.read<UserPreferencesBloc>().state.fuelUOM] ?? "S_Liters"
              : (context.read<LanguageBloc>().state.language == "fr"
                ? ReferenceTableDataFR.uomFuel[context.read<UserPreferencesBloc>().state.fuelUOM] ?? "F_Liters"
                : ReferenceTableDataEN.uomFuel[context.read<UserPreferencesBloc>().state.fuelUOM] ?? "Liters"
              )
            ),
          );
        });
  }
}
