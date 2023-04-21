// ignore_for_file: unnecessary_parenthesis, implementation_imports

import 'package:bluefang/package/bluefang_ui/src/widgets/bluefang_vehicle_details.dart';
import 'package:bluefang/src/application/LanguageSupport/language_bloc.dart';
import 'package:bluefang/src/domain/sensor/sensor.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_en.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_es.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_fr.dart';
import 'package:bluefang/src/presentation/pages/sensordetails/sensor_details_screen.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/src/provider.dart';

class VehDataTracCard extends HookWidget {
  final Sensor sensor;
  final String revsPerDist;
  final int uom;
  final bool reprogrammable;

  /// Displays the dstance the vehicle has traveled.
  const VehDataTracCard(
      {Key? key,
      required this.sensor,
      required this.revsPerDist,
      required this.uom,
      required this.reprogrammable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String uomDistanceStr = ( context.read<LanguageBloc>().state.language == "es"
      ? ReferenceTableDataES.uomDistance[uom] ?? "Undef"
      : ( context.read<LanguageBloc>().state.language == "fr"
          ? ReferenceTableDataFR.uomDistance[uom] ?? "Undef"
          : ReferenceTableDataEN.uomDistance[uom] ?? "Undef"
      )
    );
    return BFCardVehicleDetail(
      text: "DataTrac SVT",
      subtext:
          "$revsPerDist ${AppLocalizations.of(context)!.revolutions}/$uomDistanceStr",
      trailingIcon: true,
      imagePath: reprogrammable
          ? "assets/images/DataTracReprogrammable.png"
          : "assets/images/DataTracTamperproof.png",
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    SensorDetailsScreen(dataTracID: sensor.dtId, reprogramming: true)));
      },
    );
  }
}
