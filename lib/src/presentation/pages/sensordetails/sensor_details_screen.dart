// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_if_elements_to_conditional_expressions, must_be_immutable

import 'package:bluefang/injection.dart';
import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/package/observer/watchlist.dart';
import 'package:bluefang/src/application/ProgrammDataTrac/FormBloc/programdatatracform_bloc.dart';
import 'package:bluefang/src/application/SensorDetails/bloc/sensordetails_bloc.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/i_program_datatrac_repo.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/infrastructure/core/helpermethods/formatting_methods.dart';
import 'package:bluefang/src/presentation/constants/global_routes.dart';
import 'package:bluefang/src/presentation/core/widgets/demo_mode_banner.dart';
import 'package:bluefang/src/presentation/pages/sensordetails/widget/battery_level_card.dart';
import 'package:bluefang/src/presentation/pages/sensordetails/widget/firmware_version_card.dart';
import 'package:bluefang/src/presentation/pages/sensordetails/widget/license_plate_beacon_raw_card.dart';
import 'package:bluefang/src/presentation/pages/sensordetails/widget/life_dist_card.dart';
import 'package:bluefang/src/presentation/pages/sensordetails/widget/revs_per_dist_display_card.dart';
import 'package:bluefang/src/presentation/pages/sensordetails/widget/rotational_angle_card.dart';
import 'package:bluefang/src/presentation/pages/sensordetails/widget/rotational_frequency_card.dart';
import 'package:bluefang/src/presentation/pages/sensordetails/widget/security_status_card.dart';
import 'package:bluefang/src/presentation/pages/sensordetails/widget/serial_number_card.dart';
import 'package:bluefang/src/presentation/pages/sensordetails/widget/signal_strength_card.dart';
import 'package:bluefang/src/presentation/pages/sensordetails/widget/speed_card.dart';
import 'package:bluefang/src/presentation/pages/sensordetails/widget/standard_beacon_raw_card.dart';
import 'package:bluefang/src/presentation/pages/sensordetails/widget/vehicle_number_beacon_raw_card.dart';
import 'package:bluefang/src/presentation/pages/sensordetails/widget/vin_beacon_raw_card.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

double bxheight = 10;

class SensorDetailsScreen extends StatefulWidget {
  final DtID dataTracID;
  bool reprogramming = false;

  /// Create the SensorDetails Screen and initialize the instance members.
  SensorDetailsScreen({
    Key? key,
    required this.dataTracID,
    required this.reprogramming,
  }) : super(key: key);

  @override
  State<SensorDetailsScreen> createState() => _SensorDetailsScreenState();
}

class _SensorDetailsScreenState extends State<SensorDetailsScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseAnalytics.instance.logEvent(
      name: 'screen_view',
      parameters: {
        'firebase_screen': "Sensor Details",
        'firebase_screen_class': "SensorDetailsScreen",
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SensorDetailsScaffold(
      dataTracID: widget.dataTracID,
      reprogrammingSensor: widget.reprogramming,
    );
  }
}

class SensorDetailsScaffold extends StatefulWidget {
  final DtID dataTracID;
  bool reprogrammingSensor;

  SensorDetailsScaffold(
      {Key? key, required this.dataTracID, required this.reprogrammingSensor})
      : super(key: key);

  @override
  State<SensorDetailsScaffold> createState() => _SensorDetailsScaffoldState();
}

class _SensorDetailsScaffoldState extends State<SensorDetailsScaffold> {
  double fontSize = 22;

  ProgrammedDataTrac programmedDataTrac = ProgrammedDataTrac.empty();

  @override
  Widget build(BuildContext context) {
    double usedFontSize = fontSize;
    if (MediaQuery.of(context).size.width > 500) {
      usedFontSize += 10;
    } else if (MediaQuery.of(context).size.width < 375) {
      usedFontSize -= 8;
    }

    return BlocProvider(
      create: (context) => getIt<SensordetailsBloc>()
        ..add(
          SensordetailsEvent.displaySensor(dataTracID: widget.dataTracID),
        ),
      child: Scaffold(
          appBar: bFAppBar(
              title: AppLocalizations.of(context)!.sensorDetails,
              leading: BackButton(onPressed: () {
                Navigator.pop(context);
              })),
          backgroundColor: kcWhite,
          body: Column(children: [
            DemoModeBanner(),
            Expanded(
              child: BlocBuilder<SensordetailsBloc, SensordetailsState>(
                builder: (context, state) {
                  if (!state.isLoading) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          children: <Widget>[
                            state.sensor.dtReprogrammable.value.getOrElse(() => 0) == 1
                                ? Image.asset(
                                    "assets/images/DataTracReprogrammable.png",
                                    height: usedFontSize * 5,
                                    width: usedFontSize * 5)
                                : Image.asset(
                                    "assets/images/DataTracTamperproof.png",
                                    height: usedFontSize * 5,
                                    width: usedFontSize * 5),
                            SizedBox(height: bxheight),
                            VehLifeDistanceField(
                                subtext: state
                                    .distance.dtLifeMiles
                                    .getOrCrash()
                                    .toString(),
                                units: state.sensor.dtUom
                                    .getOrCrash(),
                                timestamp:
                                    "${FormattingMethods.formatDate(state.distance.dateTimeRep.getOrCrash(), Localizations.localeOf(context).toString())}\n${FormattingMethods.formatTime(state.distance.dateTimeMod.getOrCrash())}"),
                            SizedBox(height: bxheight),
                            VehRevsPerDistField(
                              subtext: state.sensor.dtRpd
                                  .getOrCrash()
                                  .toString(),
                              userSet: state.sensor.userIdMod
                                  .getOrCrash()
                                  .toString(),
                              timeSet: state
                                  .sensor.dateTimeMod
                                  .getOrCrash(),
                              uom: state.sensor.dtUom.value
                                  .getOrElse(() => 0),
                            ),
                            SizedBox(height: bxheight),
                            DtSecurityStatusField(
                                isSecure: state
                                    .sensor.dtSecure
                                    .getOrCrash()
                                    .toString()),
                            SizedBox(height: bxheight),
                            DtBatteryLevel(
                                batteryLevel: state
                                    .sensor.dtLoBat
                                    .getOrCrash()
                                    .toString()),
                            SizedBox(height: bxheight),
                            DtSerialNumberField(
                                serialNumber: state
                                    .sensor.dtIdHumanReadable
                                    .getOrCrash()),
                            SizedBox(height: bxheight),
                            DtFirmwareVersion(
                                firmwareVersion:
                                    "M${state.sensor.dtFirmVerMsp.getOrCrash()} BT${state.sensor.dtFirmVerBT5Ap.getOrCrash()} SDK${state.sensor.dtFirmVerBT5Sdk.getOrCrash()}"),
                            SizedBox(height: bxheight),
                            DtRotationalFrequency(
                              data: state.rotationalFrequency,
                            ),
                            SizedBox(height: bxheight),
                            VehSpeed(data: state.speed),
                            SizedBox(height: bxheight),
                            DtSignalStrength(data: state.signalStrength),
                            SizedBox(height: bxheight),
                            DtRotationalAngle(
                              data: state.rotationalAngle,
                            ),
                            SizedBox(height: bxheight),
                            DtStandardBeaconRaw(
                              rawBeacon: state.sensor.dtBtRaw,
                            ),
                            SizedBox(height: bxheight),
                            DtVehNumberBeaconRaw(
                              data: state.vehicleBeaconHex,
                            ),
                            SizedBox(height: bxheight),
                            DtVinBeaconRaw(
                              data: state.vinBeaconHex,
                            ),
                            SizedBox(height: bxheight),
                            DtLicensePlateBeaconRaw(
                                data: state.licensePlateBeaconHex),
                            SizedBox(height: bxheight),
                          ],
                        ));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            Card(
              child: BFButtons(
                  title: "Program Data Trac",
                  onTap: () async {
                    if (widget.reprogrammingSensor) {
                      //Get the full datatrac from the database; assume we'll find one since the 
                      (await getIt<IProgrammedDataTracRepository>().find(dtID: widget.dataTracID)).fold(
                        (l){programmedDataTrac = ProgrammedDataTrac.empty();},
                        (r){programmedDataTrac = r;}
                      );
                      getIt<ProgramdatatracformBloc>().add(
                          ProgramdatatracformEvent.initialized(
                              widget.dataTracID,
                              dartz.some(programmedDataTrac)));
                    } else {
                      getIt<ProgramdatatracformBloc>().add(
                          ProgramdatatracformEvent.initialized(
                              widget.dataTracID, dartz.none()));
                    }
                    Navigator.pushNamed(
                      context,
                      GlobalRoutes.programDataTrac,
                      arguments: {
                        "dtID": widget.dataTracID,
                        "editedProgrammedDataTrac": widget.reprogrammingSensor
                            ? programmedDataTrac
                            : ProgrammedDataTrac.empty(),
                      },
                    );
                  }),
            ),
          ])),
    );
  }

  @override
  void dispose() {
    super.dispose();
    WatchList().dispose();
  }
}
