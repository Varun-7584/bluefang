import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Displays the serial number of the [ProgramDataTrac].
///
/// Requires no additional parameters, but takes an optional [Key].
///
/// [author] Bailie Livingston.
class DtSerialNumberField extends HookWidget {
  final String serialNumber;
  const DtSerialNumberField({Key? key, required this.serialNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BFCardVehicleDetail(
        text: AppLocalizations.of(context)!.serialNum,
        imagePath: "assets/images/SignalStrength.png",
        subtext: serialNumber);
  }
}
