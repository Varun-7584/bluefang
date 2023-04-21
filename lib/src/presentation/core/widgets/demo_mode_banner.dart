// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/application/DemoModeBloc/demo_mode_bloc.dart';
import 'package:bluefang/src/presentation/constants/global_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages, unused_import
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DemoModeBanner extends StatelessWidget {
  double fontSize = 22;

  /// MaterialBanner marking that the app is in demo mode.
  ///
  /// Must be called like a widget for each page that wants to mark if the app is in demo mode.
  /// In order to include it in a screen that uses a BlocBuilder for the body, the banner needs to be included above the BlocBuilder:
  /// ```
  /// Scaffold(
  ///   body: Column(
  ///     children: [
  ///       DemoModeBanner(),
  ///       Expanded(
  ///         child: BlocBuilder<Bloc, State>(
  ///         <rest of code>
  ///         ),
  ///       ),
  ///     ]
  ///   )
  ///
  /// ```
  ///
  /// This code displays the banner between the AppBar and the rest of the screen.
  DemoModeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double usedFontSize = fontSize;
    if (MediaQuery.of(context).size.width < 300) {
      usedFontSize -= 8;
    } else if (MediaQuery.of(context).size.width < 375) {
      usedFontSize -= 6;
    } else if (MediaQuery.of(context).size.width > 500) {
      usedFontSize += 8;
    }
    return BlocBuilder<DemoModeBloc, DemoModeState>(builder: (context, state) {
      return state.isDemo
          ? MaterialBanner(
              content: BFText.headingOne(
                  AppLocalizations.of(context)!.demoModeOn,
                  fontSize: usedFontSize),
              actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, GlobalRoutes.fleetManager);
                    },
                    child: BFText.caption(
                        AppLocalizations.of(context)!.turnDemoOff),
                  )
                ])
          : SizedBox.shrink();
    });
  }
}
