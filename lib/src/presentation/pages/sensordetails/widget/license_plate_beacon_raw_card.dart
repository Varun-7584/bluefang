import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Displays the raw form of the Bluetooth beacon from the DataTrac.
///
/// Requires no additional parameters, but takes an optional [Key].
///
/// [author] Bailie Livingston.
class DtLicensePlateBeaconRaw extends HookWidget {
  final String data;
  const DtLicensePlateBeaconRaw({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BFCardVehicleDetail(
      text: AppLocalizations.of(context)!.licensePlateRawBeacon,
      imagePath: "assets/images/SignalStrength.png",
      subtext: data.length > 13 ? data.substring(13, data.length) : data,
    );
  }
}
