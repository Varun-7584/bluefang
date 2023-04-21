import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Card to display firmware version information.
///
/// Requires no additional parameters, but takes an optional [Key].
///
/// [author] Bailie Livingston.
class DtFirmwareVersion extends HookWidget {
  final String firmwareVersion;
  const DtFirmwareVersion({Key? key, required this.firmwareVersion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BFCardVehicleDetail(
      text: AppLocalizations.of(context)!.firmwareVersion,
      imagePath: "assets/images/FirmwareVersion.png",
      subtext: firmwareVersion,
    );
  }
}
