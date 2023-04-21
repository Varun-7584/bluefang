// ignore_for_file: cast_nullable_to_non_nullable, avoid_redundant_argument_values, must_be_immutable, prefer_const_constructors, use_build_context_synchronously

import 'dart:developer';

import 'package:bluefang/injection.dart';
import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/application/ProgrammDataTrac/FormBloc/programdatatracform_bloc.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/i_program_datatrac_repo.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/presentation/constants/global_routes.dart';
import 'package:dartz/dartz.dart' as dz;

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRCodeReaderScreen extends StatefulWidget {
  const QRCodeReaderScreen({Key? key}) : super(key: key);

  @override
  State<QRCodeReaderScreen> createState() => _QRCodeReaderScreenState();
}

class _QRCodeReaderScreenState extends State<QRCodeReaderScreen> {
  MobileScannerController cameraController = MobileScannerController();
  //Will get reset every time screen is accessed
  bool codeFound = false;
  bool snackbarActive = false;

  // @override
  // void initState() async {
  //   super.initState();
  //   // FirebaseAnalytics.instance.logEvent(
  //   //   name: 'screen_view',
  //   //   parameters: {
  //   //     'firebase_screen': "QR Code Reader",
  //   //     'firebase_screen_class': "QRCodeReaderScreen",
  //   //   },
  //   // );
  // }

  @override
  Widget build(BuildContext context) {
    codeFound = false;
    return Scaffold(
      appBar: bFAppBar(
        title: AppLocalizations.of(context)!.qrCodeScreen,
        trailingAction: Row(
          children: [
            IconButton(
              icon: ValueListenableBuilder<TorchState>(
                valueListenable: cameraController.torchState,
                builder: (context, state, child) {
                  switch (state) {
                    case TorchState.off:
                      return const Icon(Icons.flash_off, color: Colors.grey);
                    case TorchState.on:
                      return const Icon(Icons.flash_on, color: Colors.yellow);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.toggleTorch(),
            ),
          ],
        ),
      ),
      body: Stack(children: [
        MobileScanner(
            allowDuplicates: false,
            controller: cameraController,
            onDetect: (barcode, args) async {
              if (barcode.rawValue == null) {
                log('Failed to scan Barcode');
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      BFText.body(AppLocalizations.of(context)!.qrCodeNotFound),
                ));
              } else {
                final String code = barcode.rawValue!;
                log('Barcode found! $code');
                if (!codeFound) {
                  codeFound = true;
                  log("QR Code: ${getDtIDFromQRCode(code)}");
                  final repository = getIt<IProgrammedDataTracRepository>();
                  final dataTracID = getDtIDFromQRCode(code);
                  if (!dataTracID.isValid()) {
                    log(AppLocalizations.of(context)!.qrCodeNotFound);

                    //ScaffoldMessenger.of(context).clearSnackBars();
                    if (!snackbarActive) {
                      snackbarActive = true;
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                              content: BFText.body(
                                  AppLocalizations.of(context)!.qrCodeNotFound),
                              duration:
                                  Duration(seconds: 1, milliseconds: 500)))
                          .closed
                          .then((value) {
                        snackbarActive = false;
                      });
                    }
                    codeFound = false;
                  } else {
                    codeFound = true;
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: BFText.body(
                            AppLocalizations.of(context)!.qrCodeFound),
                        duration: Duration(seconds: 1, milliseconds: 500)));
                    final ProgrammedDataTrac? programmedDataTrac =
                        (await repository.find(dtID: dataTracID))
                            .fold((l) => null, (r) => r);
                    if (programmedDataTrac != null) {
                      //For some reason, testing to see if the bloc is registered prevents getIt from closing it.
                      //DO NOT REMOVE THIS IF STATEMENT unless you can make the code work withou it.
                      if (getIt.isRegistered<ProgramdatatracformBloc>()) {
                        final bloc = getIt<ProgramdatatracformBloc>();
                        //Go ahead and send the state out with the data trac information for this vehicle, if it exists
                        bloc.add(ProgramdatatracformEvent.initialized(
                            dataTracID, dz.some(programmedDataTrac)));
                        //Force the hydrated bloc to store that data trac information
                        bloc.hydrate();
                      } else {
                        log("No instance of Programdatatracform bloc available");
                      }
                    }
                    Navigator.of(context)
                      ..popUntil((route) => route.isFirst)
                      ..pushNamed(
                        GlobalRoutes.programDataTrac,
                        arguments: {
                          "dtID": dataTracID,
                          "editedProgrammedDataTrac": null
                        },
                      );
                  }
                }
              }
            }),
        Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * .25,
                color: Colors.black.withOpacity(.5)),
            Container(
              height: MediaQuery.of(context).size.height * .30,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.orange)),
            ),
            Expanded(
                child: ColoredBox(
              color: Colors.black.withOpacity(.5),
            ))
          ],
        ),
      ]),
    );
  }

  DtID getDtIDFromQRCode(String qrCodeString) {
    //If it doesn't have the hex string marker, fail. This prevents barcodes from being read that somehow translate to a valid DtID.
    if (!qrCodeString.contains("0x")) {
      return DtID(-1);
    }
    final String hexDtIDStr = "0x${qrCodeString.split("0x").last}";
    //Force it to fail if there is an error parsing the hex string
    int intVal = -1;
    try {
      intVal = int.parse(hexDtIDStr);
    } catch (ex) {
      log("Invalid hex value from QR Code.\n",
          name: "QrCodeReaderScreen.getDtIDFromQRCode", level: 1);
    }
    return DtID(intVal);
  }
}
