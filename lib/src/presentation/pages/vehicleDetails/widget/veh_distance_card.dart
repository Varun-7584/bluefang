// ignore_for_file: must_be_immutable, prefer_interpolation_to_compose_strings

import 'package:bluefang/package/bluefang_ui/src/widgets/bluefang_vehicle_details.dart';
import 'package:bluefang/src/application/LanguageSupport/language_bloc.dart';
import 'package:bluefang/src/application/UserPreferencesBloc/userpreferences_bloc.dart';
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

class VehDistanceCard extends HookWidget {
  final String dateTimeMod;
  String distTraveled;
  final int uom;

  /// Displays the dstance the vehicle has traveled.
  VehDistanceCard(
      {Key? key,
      required this.dateTimeMod,
      required this.distTraveled,
      required this.uom
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    distTraveled = FormattingMethods.insertCommas(distTraveled);
    return BFCardVehicleDetail(
      text: AppLocalizations.of(context)!.vehicleDistance,
      subtext: distTraveled + " " +
          (context.read<LanguageBloc>().state.language == "es"
              ? ReferenceTableDataES.uomDistance[uom] ??
                  "km"
              : (context.read<LanguageBloc>().state.language == "fr"
                  ? ReferenceTableDataFR.uomDistance[uom] ??
                      "km"
                  : ReferenceTableDataEN.uomDistance[uom] ?? "km"
                )
          ),
      trailingText: dateTimeMod,
      imagePath: "assets/images/DistanceIcon.png",
    );
  }
}
