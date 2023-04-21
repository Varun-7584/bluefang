// ignore_for_file: must_be_immutable

import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/application/LanguageSupport/language_bloc.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_en.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_es.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_fr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class VehLifeDistanceField extends HookWidget {
  String subtext;
  int units;
  String timestamp;
  VehLifeDistanceField({Key? key, required this.subtext, required this.units, required this.timestamp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String uom = context.read<LanguageBloc>().state.language == "es"
        ? ReferenceTableDataES.uomDistance[units] ?? "km"
        : (context.read<LanguageBloc>().state.language == "fr"
            ? ReferenceTableDataFR.uomDistance[units] ?? "km"
            : ReferenceTableDataEN.uomDistance[units] ?? "km");
    return BFCardVehicleDetail(
      // TODO: Add parameter to take the UOM and display that here
      text:
          "${AppLocalizations.of(context)!.life} $uom",
      subtext: subtext,
      imagePath: "assets/images/DistanceIcon.png",
      trailingText: timestamp,
    );
  }
}
