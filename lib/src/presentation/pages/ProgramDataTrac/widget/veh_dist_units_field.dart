// ignore_for_file: unnecessary_statements, unnecessary_parenthesis

import 'package:bluefang/package/bluefang_ui/src/widgets/bluefang_dropdown.dart';
import 'package:bluefang/src/application/LanguageSupport/language_bloc.dart';
import 'package:bluefang/src/application/ProgrammDataTrac/FormBloc/programdatatracform_bloc.dart';
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
class VehDistUnitsField extends HookWidget {
  const VehDistUnitsField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgramdatatracformBloc, ProgramdatatracformState>(
        buildWhen: (p, c) => (p.isEditing != c.isEditing || p.isSubmitting != c.isSubmitting || p.showErrorMessages != c.showErrorMessages),
        builder: (context, state) {
          final String language = context.read<LanguageBloc>().state.language;
          return BFDropdown(
            label: AppLocalizations.of(context)!.units,
            edgeMargin: 0,
            whenChanged: (String? value) {
              language == "es" 
                ? context.read<ProgramdatatracformBloc>().add(
                  ProgramdatatracformEvent.uomChanged(
                    ReferenceTableDataES.uomDistance.keys.firstWhere(
                            (k) => ReferenceTableDataES.uomDistance[k] == value,
                            orElse: () => 0))
                )
                : (language == "fr"
                  ? context.read<ProgramdatatracformBloc>().add(
                      ProgramdatatracformEvent.uomChanged(
                        ReferenceTableDataFR.uomDistance.keys.firstWhere(
                                (k) => ReferenceTableDataFR.uomDistance[k] == value,
                                orElse: () => 0))
                    )
                  : context.read<ProgramdatatracformBloc>().add(
                      ProgramdatatracformEvent.uomChanged(
                        ReferenceTableDataEN.uomDistance.keys.firstWhere(
                                (k) => ReferenceTableDataEN.uomDistance[k] == value,
                                orElse: () => 0))
                    )
                  );
            },
            itemList: (language == "es" 
              ? ReferenceTableDataES.uomDistance.values.toList() 
              : (language == "fr" 
                  ? ReferenceTableDataFR.uomDistance.values.toList()
                  : ReferenceTableDataEN.uomDistance.values.toList()
                )
            ),
            validator: (_) => null,
            dropdownValue: language == "es" ? 
              ReferenceTableDataES.uomDistance[context.read<ProgramdatatracformBloc>().state.programmedDataTrac.sensor.dtUom.getOrCrash()] ?? "km"
              : (language == "fr"
                ? ReferenceTableDataFR.uomDistance[context.read<ProgramdatatracformBloc>().state.programmedDataTrac.sensor.dtUom.getOrCrash()] ?? "km"
                : ReferenceTableDataEN.uomDistance[context.read<ProgramdatatracformBloc>().state.programmedDataTrac.sensor.dtUom.getOrCrash()] ?? "km"
              )
          );
        });
  }
}
