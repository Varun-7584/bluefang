// ignore_for_file: must_be_immutable, unnecessary_parenthesis

import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
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
  VehFuelUnits({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPreferencesBloc, UserPreferencesState>(
        buildWhen: (p, c) => p.fuelUOM != c.fuelUOM,
        builder: (context, state) {
          final String language = context.read<LanguageBloc>().state.language;
          controller.text = (language == "es"
              ? ReferenceTableDataES.uomFuel[state.fuelUOM] ?? "S_Undefined"
              : (language == "fr"
                  ? ReferenceTableDataFR.uomFuel[state.fuelUOM] ?? "F_Undefined"
                  : ReferenceTableDataEN.uomFuel[state.fuelUOM] ??
                      "Undefined"));
          return BFTextInput(
              fixedWidth: 110,
              label: AppLocalizations.of(context)!.units,
              readOnly: true,
              textController: controller,
              outline: true);
        });
  }
}
