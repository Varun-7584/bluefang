// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_const_constructors_in_immutables, use_build_context_synchronously

import 'dart:developer';

import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/application/DemoModeBloc/demo_mode_bloc.dart';
import 'package:bluefang/src/application/FleetManager/fleet_manager_bloc.dart';
import 'package:bluefang/src/application/ServerApiBloc/server_api_cubit.dart';
import 'package:bluefang/src/presentation/core/widgets/demo_mode_banner.dart';
import 'package:bluefang/src/presentation/pages/fleetmanager/delete_database_button.dart';
import 'package:bluefang/src/presentation/pages/fleetmanager/demo_mode_field.dart';
import 'package:bluefang/src/presentation/pages/fleetmanager/language_picker.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

double bxheight = 10;

class FleetManagerSettingsScreen extends StatelessWidget {
  FleetManagerSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FleetManagerBloc bloc = BlocProvider.of<FleetManagerBloc>(context, listen: true);
    FirebaseAnalytics.instance.logEvent(
      name: 'screen_view',
      parameters: {
        'firebase_screen': "Fleet Manager Setttings Screen",
        'firebase_screen_class': "FleetManagerSettingsScreen",
      },
    );
    return Scaffold(
        appBar: bFAppBar(
            title: AppLocalizations.of(context)!.fleetManagerSettingsScreen,
            leading: BackButton(onPressed: () {
              Navigator.pop(context);
            })),
        backgroundColor: kcWhite,
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              DemoModeBanner(),
              LanguagePicker(),
              EnableDemoModeField(),
              Card(
                color: kcLightGreyColor,
                child: SwitchListTile(
                  value: bloc.state.showInRangeVehicles,
                  onChanged: (value){
                    bloc.add(FleetManagerEvent.changeVehiclesShown(showInRangeVehicles: value));
                  },
                  title: Text(AppLocalizations.of(context)!.displayInRangeVehiclesOnly, style: bodyStyle.copyWith(color: kcPrimaryColor)),
                  activeColor: kcPrimaryColor
                ),
              ),
              SizedBox(height: 10),
              if (!context.read<DemoModeBloc>().state.isDemo)
                DeleteDatabaseButton(),
              SizedBox(height: 10),
              BFButtons(
                  title: AppLocalizations.of(context)!.cloudSync,
                  onTap: () async {
                    log("Button pressed");
                    final ServerApiCubit cubit = context.read<ServerApiCubit>();

                    //Test to make sure the site is up
                    await cubit.testConnection();

                    //Log in
                    await cubit.login(
                        username: "101",
                        companyNo: "151",
                        deviceID: "0",
                        pwd: "123");
                    final String token = cubit.state.token;
                    if (token.isEmpty) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(bFSnackBar(
                            content: "Error logging into server",
                            onActionClick: () {},
                            type: "error"
                          )
                        );
                    } else {
                      //log("Token from cubit: $token", name: "fleet_manager_screen.dart");
                      //Get updates
                      await cubit.getUpdates(
                          username: "101",
                          companyNo: "151",
                          deviceID: "0",
                          pwd: "123"
                      );
                      //Use context.read so that the latest state will be read. 
                      if (context.read<ServerApiCubit>().state.success){
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(bFSnackBar(
                            content: "Retrieved data from server",
                            onActionClick: () {},
                            type: "success"
                          )
                        );
                      }
                      else {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(bFSnackBar(
                            content: "Error getting data from server",
                            onActionClick: () {},
                            type: "error"
                          )
                        );
                      }
                      log("Date time in seconds: ${DateTime.now().millisecondsSinceEpoch / 1000}");
                      final FleetManagerBloc bloc =
                          BlocProvider.of<FleetManagerBloc>(context);
                      //Refresh the vehicle and sensor lists
                      bloc.add(FleetManagerEvent.refreshScreen());
                    }
                  }),
            ],
          ),
        ));
  }
}
