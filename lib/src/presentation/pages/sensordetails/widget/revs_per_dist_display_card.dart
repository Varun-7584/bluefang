import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/application/LanguageSupport/language_bloc.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_en.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_es.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_fr.dart';
import 'package:bluefang/src/infrastructure/core/helpermethods/formatting_methods.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class VehRevsPerDistField extends HookWidget {
  final String subtext;
  final int timeSet;
  final String userSet;
  final int uom;
  const VehRevsPerDistField(
      {Key? key,
      required this.subtext,
      required this.timeSet,
      required this.userSet,
      required this.uom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateStr = FormattingMethods.formatDate(timeSet, Localizations.localeOf(context).toString());
    final timeStr = FormattingMethods.formatTime(timeSet);

    final String uomStr = context.read<LanguageBloc>().state.language == "es"
        ? ReferenceTableDataES.uomDistance[uom] ?? "S_Undefined"
        : (context.read<LanguageBloc>().state.language == "fr"
            ? ReferenceTableDataFR.uomDistance[uom] ?? "F_Undefined"
            : ReferenceTableDataEN.uomDistance[uom] ?? "Undefined");

    return BFCardVehicleDetail(
      text: "${AppLocalizations.of(context)!.revolutions}/$uomStr",
      subtext: "$subtext Revs/$uomStr",
      imagePath: "assets/images/RevsPerDistIcon.png",
      trailingText:
          "${AppLocalizations.of(context)!.timeSet} \n$dateStr\n$timeStr\nBy: $userSet",
    );
  }
}
