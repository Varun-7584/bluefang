// ignore_for_file: require_trailing_commas, avoid_print, prefer_const_constructors, avoid_bool_literals_in_conditional_expressions, prefer_interpolation_to_compose_strings, prefer_if_elements_to_conditional_expressions, unnecessary_parenthesis, must_be_immutable, no_logic_in_create_state, prefer_const_constructors_in_immutables, use_build_context_synchronously

import 'dart:developer';

import 'package:app_settings/app_settings.dart';
import 'package:bluefang/injection.dart';
import 'package:bluefang/package/bit_manipulation/bit_manipulation.dart';
import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:bluefang/src/application/DemoModeBloc/demo_mode_bloc.dart';
import 'package:bluefang/src/application/FleetManager/fleet_manager_bloc.dart';
import 'package:bluefang/src/application/ServerApiBloc/server_api_cubit.dart';
import 'package:bluefang/src/domain/aggregates/vehicleInfo/i_vehicle_info_repository.dart';
import 'package:bluefang/src/domain/aggregates/vehicleInfo/vehicle_info.dart';
import 'package:bluefang/src/domain/bluetooth/i_bluetooth_repository.dart';
import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/sensor/i_sensor_repository.dart';
import 'package:bluefang/src/domain/sensor/sensor.dart';
import 'package:bluefang/src/domain/sensor/sensor_failure.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_en.dart';
import 'package:bluefang/src/presentation/constants/global_routes.dart';
import 'package:bluefang/src/presentation/core/widgets/demo_mode_banner.dart';
import 'package:bluefang/src/presentation/core/widgets/navigation_drawer_widget.dart';
import 'package:bluefang/src/presentation/pages/fleetmanager/datatrac_expandable_list.dart';
import 'package:bluefang/src/presentation/pages/fleetmanager/vehicle_expandable_type_list.dart';
import 'package:bluefang/src/presentation/pages/fleetmanager/vehicle_sortable_list.dart';
import 'package:bluefang/src/presentation/pages/qrcodereader/qr_code_reader_screen.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kt_dart/collection.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../package/utilities/bluetooth/bluetooth_permission.dart';
import 'fleet_manager_settings_screen.dart';

class FleetManagerScreen extends StatefulWidget {
  /// Displays the fleet information and serves as a navagation home.
  ///

  const FleetManagerScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FleetManagerScreen> createState() => FleetManagerScreenState();
}

/// State for FleetManager screen
class FleetManagerScreenState extends State<FleetManagerScreen> {
  final numberCardKey = GlobalKey();
  final distanceCardKey = GlobalKey();
  final timeCardKey = GlobalKey();
  final typeCardKey = GlobalKey();
  final double defaultFontSize = 16;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async { 

      bool locationOn = false;
      bool bluetoothOn = false;


      //Location Services
      final isLocationPermanentlyDenied = await Permission.location.request().isPermanentlyDenied;
      if (!isLocationPermanentlyDenied && !(await Permission.location.isDenied)){
        // var locationPermissionRequest = await Permission.location.request();
        // while (locationPermissionRequest.isDenied && !locationPermissionRequest.isPermanentlyDenied){
        //   locationPermissionRequest = await Permission.location.request();
        // }
      }
      else {
        await showDialog(
          context: context, 
          builder: (BuildContext context) {  
            return AlertDialog(
              content: BFText.body(
                "Location Services are disabled for this app. If you do not allow the app to use Location Services, the Bluetooth capabilities will not work."
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    await AppSettings.openAppSettings();
                    Navigator.pop(context);
                  },
                  child: BFText.caption("Allow"),
                ),
                TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: BFText.caption("OK"),
                ),
              ]
            );
          }, 
        );
      }

      //Request Bluetooth permissions

      await BluetoothFunctions.checkBluetoothStatus(bluetoothOn,setState);
      await BluetoothFunctions.checkBluetoothPermission();
      await BluetoothFunctions.showBluetoothDialog(context,bluetoothOn);


      Permission.bluetooth.request();
      final isBluetoothPermanentlyDenied = await Permission.bluetooth.request().isPermanentlyDenied;
      if (!isBluetoothPermanentlyDenied){
      //   var bluetoothPermissionRequest = await Permission.bluetooth.request();
      //   while (bluetoothPermissionRequest.isDenied && !bluetoothPermissionRequest.isPermanentlyDenied){
          //bluetoothPermissionRequest = await Permission.bluetooth.request();
      //   }
      }
      if (isBluetoothPermanentlyDenied) {
        await showDialog(
          context: context, 
          builder: (BuildContext context) {  
            return AlertDialog(
              content: BFText.body(
                "Bluetooth is disabled for this app. If you do not allow the app to use Bluetooth, the Bluetooth capabilities will not work."
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    await AppSettings.openAppSettings();
                    Navigator.pop(context);
                  },
                  child: BFText.caption("Allow"),
                ),
                TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: BFText.caption("OK"),
                ),
              ]
            );
          }, 
        );
      }

       //Location Services
      if ((await Permission.location.isPermanentlyDenied) || (await Permission.location.isDenied)){
        await showDialog(
          context: context, 
          builder: (BuildContext context) {  
            return AlertDialog(
              content: BFText.body(
                "Location Services are disabled for this app. If you do not allow the app to use Location Services, the Bluetooth capabilities will not work."
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    await AppSettings.openAppSettings();
                    Navigator.pop(context);
                  },
                  child: BFText.caption("Allow"),
                ),
                TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: BFText.caption("OK"),
                ),
              ]
            );
          }, 
        );
      }

      //Request Bluetooth permissions
      if ((await Permission.bluetooth.isDenied) || (await Permission.bluetooth.isPermanentlyDenied)){
        await showDialog(
          context: context, 
          builder: (BuildContext context) {  
            return AlertDialog(
              content: BFText.body(
                "Bluetooth is disabled for this app. If you do not allow the app to use Bluetooth, the Bluetooth capabilities will not work."
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    await AppSettings.openAppSettings();
                    Navigator.pop(context);
                  },
                  child: BFText.caption("Allow"),
                ),
                TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: BFText.caption("OK"),
                ),
              ]
            );
          }, 
        );
      }

      //Make sure Bluetooth and Location are both turned on
      //Bluetooth
      if ((!(await FlutterBluePlus.instance.isOn) || !(await FlutterBluePlus.instance.isAvailable)) && ((await Permission.bluetooth.isDenied) || (await Permission.bluetooth.isPermanentlyDenied))){
        bluetoothOn = await showDialog<bool>(
          context: context,
          builder: (context){
            return AlertDialog(
              content: BFText.body(AppLocalizations.of(context)!.turnOnBluetoothBody),
              actions: [
                TextButton(
                  onPressed: () async {
                    await AppSettings.openAppSettings();
                    Navigator.pop(context, true);
                  },
                  child: BFText.caption(AppLocalizations.of(context)!.turnOnBluetooth),
                ),
                TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: BFText.caption(AppLocalizations.of(context)!.deny),
                ),
              ]
            );
          }
        ) ?? false;
      }
      else {
        bluetoothOn = true;
      }

      //Location
      if (await Permission.locationWhenInUse.serviceStatus.isDisabled && !((await Permission.location.isDenied) || (await Permission.location.isPermanentlyDenied))){
        locationOn = await showDialog<bool>(
          context: context,
          builder: (context){
            return AlertDialog(
              content: BFText.body(AppLocalizations.of(context)!.turnOnLocationBody),
              actions: [
                TextButton(
                  onPressed: () async {
                    await AppSettings.openLocationSettings();
                    Navigator.pop(context, true);
                  },
                  child: BFText.caption(AppLocalizations.of(context)!.turnOnLocation),
                ),
                TextButton(
                  onPressed: (){
                    Navigator.pop(context, false);
                  },
                  child: BFText.caption(AppLocalizations.of(context)!.deny),
                ),
              ]
            );
          }
        ) ?? false;
      }
      else {
        locationOn = true;
      }

      //If location and Bluetooth are both turned on, start Bluetooth scan and refresh from database
      if (locationOn && bluetoothOn){
        context.read<FleetManagerBloc>().add(FleetManagerEvent.started(context.read<DemoModeBloc>().state.isDemo ? false : true));
      }
      else {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: BFText.body("Bluetooth or Location Services are turned off. Without both Location Services and Bluetooth turned on, the app will not be able to read from or write to datatracs. To enable this functionality, please restart the app and turn Bluetooth and Location Services on."),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: BFText.caption("Ok")
              ),
            ]
          )
        );
      }
    });
    
    
    FirebaseAnalytics.instance.logEvent(
      name: 'screen_view',
      parameters: {
        'firebase_screen': "fleet_manager_screen",
        'firebase_screen_class': "FleetManagerScreen",
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double actualFontSize = defaultFontSize;
    if (MediaQuery.of(context).size.width > 500) {
      actualFontSize += 8;
    } else if (MediaQuery.of(context).size.width < 300) {
      actualFontSize -= 8;
    } else if (MediaQuery.of(context).size.width < 375) {
      actualFontSize -= 6;
    }
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: bFAppBar(
          title: AppLocalizations.of(context)!.fleetManagerScreen,
          trailingAction: const Icon(Icons.settings),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FleetManagerSettingsScreen()),
            );
          },
        ),
        backgroundColor: kcWhite,
        body: Column(
          children: [
            //FeaturesDisabledBanner(),
            DemoModeBanner(),
            Expanded(
              child: BlocBuilder<FleetManagerBloc, FleetManagerState>(
                  builder: (context, state) {
                return Column(
                  children: <Widget>[
                    ExpansionTile(
                        title: Image.asset("assets/images/stemcoLogo.jfif",
                            height: actualFontSize * 4),
                        controlAffinity: ListTileControlAffinity.leading,
                        children: [
                          BFText.body("Marketing Stuff Here"),
                        ]),
                    DatatracExpandableList(
                      sensorList: state.datatracList,
                    ),
                    // Buttons to sort the Fleet Management screen
                    Card(
                      color: kcLightGreyColor,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          BFText.headingOne("Vehicle",
                              fontSize: actualFontSize + 6),
                          Flexible(
                            flex: 0,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 3,
                                  key: numberCardKey,
                                  child: InkWell(
                                    onTap: state.listForm
                                        ? () {
                                            context
                                                .read<FleetManagerBloc>()
                                                .add(FleetManagerEvent
                                                    .getVehicleList(
                                                  sortedBy: VehicleListSortOrder
                                                      .number,
                                                  descending: (state
                                                              .currentSort ==
                                                          VehicleListSortOrder
                                                              .number)
                                                      ? !state.descendingSort
                                                      : false,
                                                  listForm: state.listForm,
                                                ));
                                          }
                                        : null,
                                    child: Card(
                                      color: state.listForm
                                          ? kcWhite
                                          : kcLightGreyColor,
                                      child: Padding(
                                          padding: EdgeInsets.all(2),
                                          child: Row(children: [
                                            Expanded(
                                              flex: 3,
                                              //child: FittedBox(
                                              child: BFText.body(
                                                  AppLocalizations.of(context)!
                                                      .numberButton,
                                                  fontSize: actualFontSize),
                                              //)
                                            ),
                                            (state.currentSort ==
                                                    VehicleListSortOrder.number)
                                                ? (state.descendingSort
                                                    ? Icon(Icons.arrow_downward,
                                                        size: actualFontSize)
                                                    : Icon(Icons.arrow_upward,
                                                        size: actualFontSize))
                                                : SizedBox(
                                                    width:
                                                        (MediaQuery.of(context)
                                                                    .size
                                                                    .width >
                                                                500
                                                            ? 2 * actualFontSize
                                                            : actualFontSize)),
                                          ])),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  key: distanceCardKey,
                                  child: InkWell(
                                    onTap: state.listForm
                                        ? () {
                                            context.read<FleetManagerBloc>().add(
                                                FleetManagerEvent.getVehicleList(
                                                    listForm: state.listForm,
                                                    sortedBy:
                                                        VehicleListSortOrder
                                                            .distance,
                                                    descending: (state
                                                                .currentSort ==
                                                            VehicleListSortOrder
                                                                .distance
                                                                )
                                                        ? !state.descendingSort
                                                        : false
                                                )
                                            );
                                          }
                                        : null,
                                    child: Card(
                                      color: state.listForm
                                          ? kcWhite
                                          : kcLightGreyColor,
                                      child: Padding(
                                          padding: EdgeInsets.all(2),
                                          child: Row(children: [
                                            BFText.body(
                                                AppLocalizations.of(context)!
                                                    .distanceButton,
                                                fontSize: actualFontSize),
                                            if (state.currentSort ==
                                                VehicleListSortOrder.distance)
                                              //Size is specified because otherwise the arrow will overflow
                                              if (state.descendingSort)
                                                Icon(Icons.arrow_downward,
                                                    size: actualFontSize)
                                              else
                                                Icon(Icons.arrow_upward,
                                                    size: actualFontSize)
                                            else
                                              SizedBox()
                                          ])),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  key: timeCardKey,
                                  child: InkWell(
                                    onTap: state.listForm
                                        ? () {
                                            context.read<FleetManagerBloc>().add(
                                                FleetManagerEvent.getVehicleList(
                                                    listForm: state.listForm,
                                                    sortedBy:
                                                        VehicleListSortOrder
                                                            .time,
                                                    descending: (state
                                                                .currentSort ==
                                                            VehicleListSortOrder
                                                                .time)
                                                        ? !state.descendingSort
                                                        : false));
                                          }
                                        : null,
                                    child: Card(
                                      color: state.listForm
                                          ? kcWhite
                                          : kcLightGreyColor,
                                      child: Padding(
                                        padding: EdgeInsets.all(2),
                                        child: Row(children: [
                                          BFText.body(
                                              AppLocalizations.of(context)!
                                                  .timeButton,
                                              fontSize: actualFontSize),
                                          if (state.currentSort ==
                                              VehicleListSortOrder.time)
                                            Expanded(
                                              child: (state.descendingSort
                                                  ? Icon(Icons.arrow_downward,
                                                      size: actualFontSize)
                                                  : Icon(Icons.arrow_upward,
                                                      size: actualFontSize)),
                                            ),
                                        ]),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 3,
                                    key: typeCardKey,
                                    child: InkWell(
                                        onTap: () {
                                          context.read<FleetManagerBloc>().add(
                                              FleetManagerEvent.getVehicleList(
                                                  listForm: !state.listForm,
                                                  sortedBy:
                                                      VehicleListSortOrder.type,
                                                  descending: (state
                                                              .currentSort ==
                                                          VehicleListSortOrder
                                                              .type)
                                                      ? !state.descendingSort
                                                      : false));
                                        },
                                        child: Card(
                                          child: Padding(
                                            padding: EdgeInsets.all(4),
                                            child: state.listForm
                                              ? Icon(Icons.list,
                                                  size: actualFontSize)
                                              : Icon(Icons.filter_list,
                                                  size:
                                                      actualFontSize
                                                )
                                          )
                                        )
                                    )
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 9,
                      child: state.listForm == true
                          ? VehicleSortableList(
                              itemList: state.vehicleList,
                            )
                          : VehicleExpandableList(
                              itemList: state.vehByType,
                            ),
                    ),
                    SizedBox(
                      height: actualFontSize * 6.5,
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
    );
  }

  Future<Either<ValueFailure, KtList<VehicleInfo>>> getVehicleList() async {
    return getIt<IVehicleInfoRepository>().findAll();
  }

  Future<Either<SensorFailure, KtList<Sensor>>> getDataTracList() async {
    return getIt<ISensorRepository>().getUnprogrammedSensors();
  }
}
