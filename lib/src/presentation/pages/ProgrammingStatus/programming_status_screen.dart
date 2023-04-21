// ignore_for_file: prefer_const_constructors, must_be_immutable, use_build_context_synchronously, prefer_if_elements_to_conditional_expressions

import 'dart:developer';

import 'package:bluefang/injection.dart';
import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/application/FleetManager/fleet_manager_bloc.dart';
import 'package:bluefang/src/application/ProgrammingStatusBloc/programming_status_bloc.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac.dart';
import 'package:bluefang/src/domain/bluetooth/i_bluetooth_repository.dart';
import 'package:bluefang/src/presentation/constants/global_routes.dart';
import 'package:bluefang/src/presentation/core/widgets/bluefang_image_text_input.dart';
import 'package:bluefang/src/presentation/core/widgets/demo_mode_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
// ignore: depend_on_referenced_packages, unused_import
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';

class ProgrammingStatusScreen extends StatefulWidget {
  ProgrammedDataTrac dataTrac;
  Map<String, dynamic> changedValuesMap;
  bool isEditing;
  bool realPassword;
  bool wiping;

  // ignore: prefer_const_constructors_in_immutables
  ProgrammingStatusScreen(
      {Key? key, required this.dataTrac, required this.changedValuesMap, this.isEditing = false, this.realPassword = true, this.wiping = false})
      : super(key: key) {
        log("Datatrac: $dataTrac", name: "programming_status_screen.dart");
  }

  @override
  State<ProgrammingStatusScreen> createState() =>
      _ProgrammingStatusScreenState();
}

class _ProgrammingStatusScreenState extends State<ProgrammingStatusScreen> {
  TextEditingController connectingController = TextEditingController();

  TextEditingController programmingController = TextEditingController();

  TextEditingController verifyingController = TextEditingController();

  TextEditingController databaseController = TextEditingController();

  // @override
  // void initState() async {
  //   super.initState();
  //   // FirebaseAnalytics.instance.logEvent(
  //   //   name: 'screen_view',
  //   //   parameters: {
  //   //     'firebase_screen': "Programming Status",
  //   //     'firebase_screen_class': "ProgrammingStatusScreen",
  //   //   },
  //   // );
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    connectingController.text = "Connecting";
    programmingController.text = "Updating";
    verifyingController.text = "Verifying";
    databaseController.text = "Writing to Database";


    return BlocProvider<ProgrammingStatusBloc>(
      create: (context) => getIt<ProgrammingStatusBloc>()..add(ProgrammingStatusEvent.started(widget.dataTrac, widget.changedValuesMap, widget.isEditing, widget.realPassword, widget.wiping)),
      child: Scaffold(
        appBar: bFAppBar(
            title: AppLocalizations.of(context)!.programmingStatusScreen,
            leading: BackButton(onPressed: () {
              FlutterBluePlus.instance.stopScan();
              Navigator.pop(context);
            })),
        backgroundColor: kcWhite,
        body: Column(
          children: [
            DemoModeBanner(),
            // Flexible(
            //   child: 
            //   SingleChildScrollView(
            //     child: ConnectWithDevice(
            //       dataTrac: widget.dataTrac,
            //       changedValuesMap: widget.changedValuesMap
            //     ),
            //   ),
            // ),
            Row(children: [
              Flexible(
                child: StreamBuilder<bool>(
                    stream: FlutterBluePlus.instance.isScanning,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!) {
                          return Lottie.asset(
                            'assets/lottie/bluetooth_animation.json',
                            height: 150,
                            width: 150,
                          );
                        } else {
                          return SizedBox();
                        }
                      }
                      return SizedBox();
                    }),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: widget.dataTrac.sensor.dtReprogrammable.value
                              .getOrElse(() => 0) == 1
                      ? Image.asset("assets/images/DataTracReprogrammable.png",
                          height: 150, width: 150)
                      : Image.asset("assets/images/DataTracTamperproof.png",
                          height: 150, width: 150),
                ),
              ),
            ]),
            Expanded(
              child:
                  BlocConsumer<ProgrammingStatusBloc, ProgrammingStatusState>(
                listener: (context, state) {
                  if (state.changeScreen) {
                    if (!state.homeScreen){
                      log("Home screen was false");
                      Navigator.of(context)
                        ..popUntil((route) => route.isFirst)
                        ..pushNamed(GlobalRoutes.vehicleDetails,
                            arguments: {"dtID": widget.dataTrac.sensor.dtId});
                    }
                    else {
                      log("Home screen was true");
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    }
                  }
                },
                builder: (context, state) {
                  return ListView(children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
                      child: BFInputAndImage(
                        imagePath: 'assets/images/bluetoothConnect.png',
                        readOnly: true,
                        textController: connectingController,
                        suffixIcon: state.isConnected && !state.connectionFailed
                            ? Icon(Icons.check, color: Colors.green) : ( state.connectionFailed ? Icon(Icons.clear, color: Colors.red,)
                                : SizedBox()),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
                      child: BFInputAndImage(
                        imagePath: 'assets/images/datatracUpdate.png',
                        readOnly: true,
                        textController: programmingController,
                        suffixIcon: state.isProgrammed && !state.updateFailed
                            ? Icon(Icons.check, color: Colors.green) : ( state.updateFailed ? Icon(Icons.clear, color: Colors.red,)
                                : SizedBox()),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
                      child: BFInputAndImage(
                        imagePath: 'assets/images/datatracVerified.png',
                        readOnly: true,
                        textController: verifyingController,
                        suffixIcon:
                            state.isVerified && !state.verificationFailed
                                ? Icon(Icons.check, color: Colors.green) : ( state.verificationFailed ? Icon(Icons.clear, color: Colors.red,)
                                : SizedBox()),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
                      child: BFInputAndImage(
                        imagePath: 'assets/images/datatracVerified.png',
                        readOnly: true,
                        textController: databaseController,
                        suffixIcon:
                            state.isWritten && !state.writingFailed
                                ? Icon(Icons.check, color: Colors.green) : ( state.writingFailed ? Icon(Icons.clear, color: Colors.red,)
                                : SizedBox()),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: BFButtons(
                        title: "Cancel",
                        onTap: () async {
                          final bool confirmed = await showDialog<bool>(
                            context: context, 
                            builder: (context){
                              return AlertDialog(
                                title: Text("Cancel and return to the Fleet Manager screen?"),
                                actions: [
                                  TextButton(
                                    onPressed: (){
                                      Navigator.pop(context, false);
                                    },
                                    child: BFText.caption("No")
                                  ),
                                  TextButton(
                                    onPressed: (){
                                      Navigator.pop(context, true);
                                    },
                                    child: BFText.caption("Yes")
                                  ),
                                ]
                              );
                            }
                          ) ?? false;
                            if (confirmed){
                            Navigator.of(context).popUntil((route) => route.isFirst);
                            BlocProvider.of<FleetManagerBloc>(context).add(FleetManagerEvent.refreshScreen());
                          }
                        }
                      ),
                    ),
                    (state.connectionFailed || state.verificationFailed) ? Padding(
                      padding: EdgeInsets.all(8.0),
                      child: BFButtons(
                        title: "Retry",
                        onTap: (){
                          context.read<ProgrammingStatusBloc>().add(ProgrammingStatusEvent.started(widget.dataTrac, widget.changedValuesMap, widget.isEditing, widget.realPassword, widget.wiping));
                        }
                      ),
                    ) : SizedBox(),
                  ]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
