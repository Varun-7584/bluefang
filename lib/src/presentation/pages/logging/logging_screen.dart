import 'package:bluefang/injection.dart';
import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/application/LoggingBloc/logging_bloc.dart';
import 'package:bluefang/src/presentation/core/widgets/demo_mode_banner.dart';
import 'package:bluefang/src/presentation/pages/logging/log_item_list.dart';
import 'package:bluefang/src/presentation/pages/logging/logging_settings_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages, unused_import
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoggingScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  LoggingScreen({Key? key}) : super(key: key);

  @override
  State<LoggingScreen> createState() => LoggingScreenState();
}

class LoggingScreenState extends State<LoggingScreen> {
  double fontSize = 20;

  LoggingScreenState() : super() {
    // MUST check if the bloc is registered or else it will be disposed of and throw an error.
    // No, I don't know why. But this works. It's related to the bloc being a singleton.
    if (getIt.isRegistered<LoggingBloc>()) {
      getIt<LoggingBloc>();
    }
  }

  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance.logEvent(
      name: 'screen_view',
      parameters: {
        'firebase_screen': "Logging",
        'firebase_screen_class': "LoggingScreen",
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double usedFontSize = fontSize;

    if (MediaQuery.of(context).size.width < 375) {
      usedFontSize -= 8;
    } else if (MediaQuery.of(context).size.width > 500) {
      usedFontSize += 10;
    }
    return Scaffold(
      appBar: bFAppBar(
        title: "Logging",
        leading: BackButton(onPressed: () {
          Navigator.pop(context);
        }),
        trailingAction: const Icon(Icons.settings),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoggingSettingsScreen()));
        },
      ),
      backgroundColor: kcWhite,
      body: Column(
        children: [
          DemoModeBanner(),
          Expanded(
            child: BlocBuilder<LoggingBloc, LoggingState>(
              //buildWhen: (p, c) => (p.isLoading != c.isLoading) || (p.logItems != c.logItems),
              bloc: getIt<LoggingBloc>()..add(const LoggingEvent.getLogs()),
              builder: (context, state) {
                String filterOn = "OFF";
                String displayAll = "ALL";
                // log("Num items in log list: ${state.logItems.asList().length}");
                if (!state.isLoading) {
                  if (state.vehIdFilter ||
                      state.dtIdFilter ||
                      state.msgTypeFilter) {
                    filterOn = "ON";
                    displayAll = "ONLY";
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Card(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Row(
                                  children: [
                                    const Icon(Icons.filter_alt),
                                    BFText.headingFive(
                                      "Filter: $filterOn Display $displayAll",
                                      color: kcBlack,
                                      fontSize: usedFontSize,
                                    ),
                                    const SizedBox(width: 15),
                                    if (state.vehIdFilter ||
                                        state.dtIdFilter ||
                                        state.msgTypeFilter)
                                      Flexible(
                                        child: BFButtons(
                                            title: "Clear Filters",
                                            onTap: () {
                                              context.read<LoggingBloc>().add(
                                                  LoggingEvent.clearFilters());
                                            }),
                                      )
                                    else
                                      const SizedBox(),
                                  ],
                                ),
                                if (state.vehIdFilter)
                                  Row(children: [
                                    BFText.headingFive(
                                      "Vehicle Number: ${state.vehId}",
                                      fontSize: usedFontSize,
                                      color: kcBlack,
                                    ),
                                  ])
                                else
                                  const SizedBox(),
                                if (state.dtIdFilter)
                                  Row(children: [
                                    BFText.headingFive(
                                      "DTSVT SN: ${state.dtId}",
                                      fontSize: usedFontSize,
                                      color: kcBlack,
                                    ),
                                  ])
                                else
                                  const SizedBox(),
                                if (state.msgTypeFilter)
                                  Row(children: [
                                    BFText.headingFive(
                                      "Message Type: ${state.msgType}",
                                      fontSize: usedFontSize,
                                      color: kcBlack,
                                    ),
                                  ])
                                else
                                  const SizedBox(),
                              ])),
                        ),
                        Expanded(
                          child: LogItemList(),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
