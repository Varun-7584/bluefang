// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_redundant_argument_values

import 'package:bluefang/package/bluefang_ui/src/widgets/bluefang_vehicle_details.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class VehLicensePlateCard extends HookWidget {
  final String plateNumber;

  /// Displays the vehicle's license plate number.
  const VehLicensePlateCard({Key? key, required this.plateNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BFCardVehicleDetail(
      text: AppLocalizations.of(context)!.licensePlate,
      subtext: plateNumber,
      trailingIcon: false,
      imagePath: "assets/images/LicensePlateIcon.png",
    );
  }
}
