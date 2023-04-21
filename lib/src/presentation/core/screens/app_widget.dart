// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, require_trailing_commas, prefer_const_constructors_in_immutables, use_build_context_synchronously

import 'package:app_settings/app_settings.dart';
import 'package:bluefang/injection.dart';
import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/application/PermissionsBloc/permissions_bloc.dart';
import 'package:bluefang/src/presentation/pages/fleetmanager/fleet_manager_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import '../../../../package/utilities/bluetooth/bluetooth_permission.dart';
import '../../pages/auth/start_tracking.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => AppWidgetState();
}

class AppWidgetState extends State<AppWidget> {
  bool isWebbatUser = false;
  static bool isDeviceVerified = false;
  bool _isBluetoothOn = false;

  @override
  void initState() {
    super.initState();

    getUserSharedPreference().then((value) {
      if (value != null) {
        setState(() {
          isWebbatUser = true;
        });
      }
    });
    //ORDER IS IMPORTANT in this if condition - relies on short-ciruiting
    //Makes sure the bloc is created and that the permissions have not already been requested
    if (getIt.isRegistered<PermissionsBloc>() &&
        !getIt<PermissionsBloc>().state.permissionsRequested) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: kcLightGreyColor,
                content: SingleChildScrollView(
                  child: Column(children: [
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: BFText.headingOne("Permissions Request"),
                    ),
                    BFText.body(
                        "Bluefang needs to ask for permissions in order for things like the QR code reader, Bluetooth adapter, and settings storage can work correctly.",
                        fontWeight: FontWeight.normal),
                    SizedBox(height: 10),
                    BFText.headingFour("Location"),
                    BFText.body(
                        "Location Services is used to log the location where a DataTrac SVT was read.",
                        fontWeight: FontWeight.normal),
                    BFText.headingFour("Camera"),
                    BFText.body("The camera is used to scan QR codes.",
                        fontWeight: FontWeight.normal),
                    BFText.headingFour("Bluetooth"),
                    BFText.body(
                        "Bluetooth is used to read the DataTrac SVT devices. [Granted by default unless you are using an iOS 13+ phone]",
                        fontWeight: FontWeight.normal),
                    // BFText.headingFour(
                    //   "File Access"
                    // ),
                    // BFText.body(
                    //   "File Access is used to store the DataTrac SVT reading information.", fontWeight: FontWeight.normal
                    // ),
                  ]),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: BFText.caption("OK"),
                  ),
                ],
              );
            }).then((value) async {
          //Location Services
          final isLocationPermanentlyDenied =
              await Permission.location.request().isPermanentlyDenied;
          if (!isLocationPermanentlyDenied) {
            var locationPermissionRequest = await Permission.location.request();
            while (locationPermissionRequest.isDenied &&
                !locationPermissionRequest.isPermanentlyDenied) {
              locationPermissionRequest = await Permission.location.request();
            }
          } else {
            await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    content: BFText.body(
                        "Location Services are disabled for this app. If you do not allow the app to use Location Services, the Bluetooth capabilities will not work."),
                    actions: [
                      TextButton(
                        onPressed: () async {
                          await AppSettings.openAppSettings();
                          Navigator.pop(context);
                        },
                        child: BFText.caption("Allow"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: BFText.caption("OK"),
                      ),
                    ]);
              },
            );
          }

       //   Request Bluetooth permissions
       //    final isBluetoothPermanentlyDenied = await Permission.bluetooth.request().isPermanentlyDenied;
       //    if (!isBluetoothPermanentlyDenied) {
       //      var bluetoothPermissionRequest =
       //          await Permission.bluetooth.request();
       //      while (bluetoothPermissionRequest.isDenied &&
       //          !bluetoothPermissionRequest.isPermanentlyDenied) {
       //        bluetoothPermissionRequest = await Permission.bluetooth.request();
       //      }
       //    } else {
       //      showDialog(
       //        context: context,
       //        builder: (BuildContext context) {
       //          return AlertDialog(
       //            title: BFText.headingOne(
       //                "Allow Fleet Manager to Access Your Bluetooth?"),
       //            content: BFText.body(
       //                "If you do not allow the app to use Bluetooth, the Bluetooth capabilities will not work."),
       //            actions: [
       //              TextButton(
       //                onPressed: () {
       //                  openAppSettings();
       //                },
       //                child: Text("Allow",
       //                    style: TextStyle(color: kcSucessColor)),
       //              ),
       //              TextButton(
       //                onPressed: () {
       //                  SystemNavigator.pop();
       //                },
       //                child: Text("Exist",
       //                    style: TextStyle(color: kcErrorColor)),
       //              ),
       //            ],
       //          );
       //        },
       //      );
       //    }

       //   Request Bluetooth permissions
          await BluetoothFunctions.checkBluetoothStatus(_isBluetoothOn,setState);
          await BluetoothFunctions.checkBluetoothPermission();
          await BluetoothFunctions.showBluetoothDialog(context,_isBluetoothOn);
          // checkBluetoothStatus();
          // checkBluetoothPermission();
          // Future<void> _showBluetoothDialog() async {
          //   if (!_isBluetoothOn) {
          //     final FlutterBluetoothSerial bluetooth =
          //         FlutterBluetoothSerial.instance;
          //     bool? isOn = await bluetooth.isOn;
          //     if (!isOn!) {
          //       showDialog(
          //         context: context,
          //         builder: (BuildContext context) {
          //           return AlertDialog(
          //             title: BFText.headingOne(
          //                 "Allow Fleet Manager to Access Your Bluetooth?"),
          //             content: BFText.body(
          //                 "If you do not turn on or allow the app to use Bluetooth, "
          //                     "the Bluetooth capabilities will not work."),
          //             actions: [
          //               TextButton(
          //                 onPressed: () {
          //                   openAppSettings();
          //                 },
          //                 child: BFText.caption("Allow"),
          //               ),
          //               TextButton(
          //                 onPressed: () {
          //                   SystemNavigator.pop();
          //                 },
          //                 child: Text("Exist",
          //                     style: TextStyle(color: kcErrorColor)),
          //               ),
          //             ],
          //           );
          //         },
          //       );
          //     } else {
          //       _isBluetoothOn = true;
          //     }
          //   }
          // }
          // _showBluetoothDialog();
          getIt<PermissionsBloc>().add(PermissionsEvent.permissionsRequested());
        });
      });
    }
  }

  // Future<void> checkBluetoothStatus() async {
  //   final FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;
  //   bool? isOn = await bluetooth.isOn;
  //   setState(() {
  //     _isBluetoothOn = isOn!;
  //   });
  // }
  //
  // Future<void> checkBluetoothPermission() async {
  //   var permissionStatus = await Permission.bluetooth.status;
  //   if (!permissionStatus.isGranted) {
  //     await Permission.bluetooth.request();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: start_tracking(),
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // return isWebbatUser != false
          //     ? FleetManagerScreen()
          //     : (snapshot.hasData && isVerified)
          //     ? FleetManagerScreen()
          //     : start_tracking();
          if (isWebbatUser) {
            return FleetManagerScreen();
          } else if (isDeviceVerified) {
            FirebaseAuth.instance.signOut();
            return FleetManagerScreen();
          } else {
            return start_tracking();
          }
        },
      ),
    );
  }

  static Future<String?> getUserSharedPreference() async {
    final pref = await SharedPreferences.getInstance();
    isDeviceVerified = pref.getBool('isDeviceVerified')!;
    print(isDeviceVerified);
    return await pref.getString("userid");
  }
}
