// ignore_for_file: prefer_const_constructors, prefer_final_locals, avoid_dynamic_calls

import 'dart:async';
import 'dart:developer';

import 'package:bluefang/injection.dart';
import 'package:bluefang/src/domain/aggregates/vehicleInfo/i_vehicle_info_repository.dart';
import 'package:bluefang/src/domain/aggregates/vehicleInfo/vehicle_info.dart';
import 'package:bluefang/src/domain/bluetooth/i_bluetooth_repository.dart';
import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/sensor/i_sensor_repository.dart';
import 'package:bluefang/src/domain/sensor/sensor.dart';
import 'package:bluefang/src/infrastructure/core/data/reference_table_data_en.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';

part 'fleet_manager_event.dart';
part 'fleet_manager_bloc.freezed.dart';
part 'fleet_manager_state.dart';

/// Bloc to handle Fleet Manager events.
/// 
/// Not injectable/usable with `getIt` because of how `getIt` handles injecting classes:
/// 
/// If a class is not a singleton, `getIt` creates a new instance every time the class is called. 
/// Each new instance of a `bloc` doesn't interact with the others, meaning that using `getIt` causes separate `blocs` to be created. 
/// This is not what the caller is usually trying to acheive. Usually, the caller wants to reference the same bloc in multiple places. 
/// 
/// However, using the `bloc` as a singleton in `getIt` fails because `getIt` closes singletons as soon as the widget they are called in is destroyed.
/// This means that if a singleton `bloc` is created in a page or last referenced in a page, it gets closed when the user navigates out of the page.
/// It is possible to circumvent this by checking if a `bloc` is registered before using it outside of the page it is usually used in (or created in), but that method sometimes fails.
/// 
/// Because of this, it is much easier to reference `blocs` through the widget tree `context` whenever possible. 
/// Fleet Manager is only used in the widget tree, so I removed it from `getIt`.
class FleetManagerBloc extends Bloc<FleetManagerEvent, FleetManagerState> {
  List<List<VehicleInfo>> vehTypeList = [];
  Timer? refreshTimer;

  FleetManagerBloc() : super(FleetManagerState.initial()) {
    /// When starting the screen, gather data for both the vehicles and the datatracs
    on<_Started>((event, emit) async {
      
      //Change to check showInRangeOnly first
      //Refresh vehicle list
      final vehicleListTemp = state.showInRangeVehicles ? await getIt<IVehicleInfoRepository>().findAllActive() : await getIt<IVehicleInfoRepository>().findAll();
      
      //TODO: Change back once testing is done
      final datatracListTemp =
          await getIt<ISensorRepository>().getUnprogrammedSensors();

      KtList<VehicleInfo> vehicleList = vehicleListTemp
          .getOrElse((){
            log("Error getting vehicle list; returning empty list.", name: "fleet_manager_bloc.dart");
            return KtList.empty();
          })
          .toMutableList()
          .sortedBy<int>((a) {
        return a.vehYear.getOrCrash();
      });

      generateVehicleTypeList(vehicleList: vehicleList);

      emit(FleetManagerState(
        vehicleList:
            vehicleListTemp.getOrElse(() => KtList.empty()).toMutableList(),
        datatracList:
            datatracListTemp.getOrElse(() => KtList.empty()).toMutableList(),
        descendingSort: false,
        currentSort: VehicleListSortOrder.none,
        vehByType: vehTypeList,
        listForm: event.listForm ?? true,
        showInRangeVehicles: false
      ));

      refreshTimer = Timer.periodic(Duration(seconds: 5), (timer) => add(FleetManagerEvent.refreshScreen()));
    });

    on<_GetSensorList>((event, emit) async {
      final datatracListTemp =
          await getIt<ISensorRepository>().getUnprogrammedSensors();

      emit(
        state.copyWith(
          datatracList: datatracListTemp.getOrElse(() => KtList.empty()).toMutableList()
        ),
      );

    });

    //When the vehicle list is requested, check the sort order
    on<_GetVehicleList>((event, emit) async {
      final vehicleListTemp = state.showInRangeVehicles ? await getIt<IVehicleInfoRepository>().findAllActive() : await getIt<IVehicleInfoRepository>().findAll();
      KtList<VehicleInfo> vehicleList = sortVehicleList(sortedBy: event.sortedBy, descending: event.descending, vehicleListTemp: vehicleListTemp);
      
      emit(state.copyWith(
        vehicleList: vehicleList.toMutableList(),
        descendingSort: event.descending,
        currentSort: event.sortedBy,
        listForm: event.listForm,
      ));
    });

    on<_RefreshScreen>((event, emit) async {

      getIt<IBluetoothRepository>().start();

      //Wait three seconds to give it time to pick up more beacons
      await Future.delayed(Duration(seconds: 3));

      //Refresh vehicle list
      final vehicleListTemp = state.showInRangeVehicles ? await getIt<IVehicleInfoRepository>().findAllActive() : await getIt<IVehicleInfoRepository>().findAll();
      //Reapply sort
      KtList<VehicleInfo> vehicleList = sortVehicleList(sortedBy: state.currentSort, descending: state.descendingSort, vehicleListTemp: vehicleListTemp);
      //Generate vehicle type list
      generateVehicleTypeList(vehicleList: vehicleList);
      //Refresh sensor list
      final datatracListTemp = await getIt<ISensorRepository>().getUnprogrammedSensors();
      //Emit new lists
      emit(
        state.copyWith(
          vehicleList: vehicleList.toMutableList(),
          datatracList: datatracListTemp.getOrElse(() => KtList.empty()).toMutableList()
        )
      );
    });
    
    on<_ChangeVehiclesShown>((event, emit) async {
      //Refresh vehicle list
      final vehicleListTemp = event.showInRangeVehicles ? await getIt<IVehicleInfoRepository>().findAllActive() : await getIt<IVehicleInfoRepository>().findAll();
      //Reapply sort
      KtList<VehicleInfo> vehicleList = sortVehicleList(sortedBy: state.currentSort, descending: state.descendingSort, vehicleListTemp: vehicleListTemp);
      //Generate vehicle type list
      generateVehicleTypeList(vehicleList: vehicleList);
      //Refresh sensor list
      final datatracListTemp = await getIt<ISensorRepository>().getUnprogrammedSensors();
      //Emit new lists
      emit(
        state.copyWith(
          vehicleList: vehicleList.toMutableList(),
          datatracList: datatracListTemp.getOrElse(() => KtList.empty()).toMutableList(),
          showInRangeVehicles: event.showInRangeVehicles
        )
      );
    });
  }

  /// Creates the Vehicle Type list used in the Expandable vehicle list view. 
  void generateVehicleTypeList({required KtList<VehicleInfo> vehicleList}){
    //Reset the list each time
    int groupCount = 0;
    vehTypeList = [];
    vehTypeList.add([]);

    //Go through the list of vehicles
    for (int i = 0; i < vehicleList.asList().length; i++) {
      //Every time the VIN changes, add a new group and advance to it
      if (i > 0 && (vehicleList[i - 1].vinId9 != vehicleList[i].vinId9)) {
        vehTypeList.add([]);
        groupCount++;
      }
      //Adds the vehicle at the current index to the currently selected group.
      vehTypeList[groupCount].add(vehicleList[i]);
    }
    //Sort within each group by vehicle number
    for (int i = 0; i < vehTypeList.length; i++) {
      vehTypeList[i].sort((a, b) {
        return a.vehId.getOrCrash().compareTo(b.vehId.getOrCrash());
      });
    }
    return;
  }

  KtList<VehicleInfo> sortVehicleList({required VehicleListSortOrder sortedBy, required bool descending, required Either<ValueFailure<dynamic>, KtList<VehicleInfo>> vehicleListTemp}){
    KtList<VehicleInfo> vehicleList;
    if (sortedBy == VehicleListSortOrder.number &&
        descending == false) {
      vehicleList = vehicleListTemp
          .getOrElse(() => KtList.empty())
          .toMutableList()
          .sortedBy<String>((a) {
        return a.vehId.getOrCrash();
      });
    } else if (sortedBy == VehicleListSortOrder.distance &&
        descending == false) {
      vehicleList = vehicleListTemp.getOrElse(() => KtList.empty())
          .toMutableList()
          .sortedBy<int>((a) {
        return a.dtLifeMiles.getOrCrash();
      });
    } else if (sortedBy == VehicleListSortOrder.time &&
        descending == false) {
      vehicleList = vehicleListTemp.getOrElse(() => KtList.empty())
          .toMutableList()
          .sortedBy<int>((a) {
        return a.sensorLastRead.getOrCrash();
      });
    }
    //Still need the makeID added to the VehicleInfo object
    else if (sortedBy == VehicleListSortOrder.type &&
        descending == false) {
      vehicleList = vehicleListTemp.getOrElse(() => KtList.empty())
          .toMutableList()
          .sortedBy<int>((a) {
        return a.vehYear.getOrCrash();
      });
    } else if (sortedBy == VehicleListSortOrder.number &&
        descending == true) {
      vehicleList = vehicleListTemp.getOrElse(() => KtList.empty())
          .toMutableList()
          .sortedByDescending<String>((a) {
        return a.vehId.getOrCrash();
      });
    } else if (sortedBy == VehicleListSortOrder.distance &&
        descending == true) {
      vehicleList = vehicleListTemp.getOrElse(() => KtList.empty())
          .toMutableList()
          .sortedByDescending<int>((a) {
        return a.dtLifeMiles.getOrCrash();
      });
    } else if (sortedBy == VehicleListSortOrder.time &&
        descending == true) {
      vehicleList = vehicleListTemp.getOrElse(() => KtList.empty())
          .toMutableList()
          .sortedByDescending<int>((a) {
        return a.sensorLastRead.getOrCrash();
      });
    }
    //Still need the makeID added to the VehicleInfo object
    else if (sortedBy == VehicleListSortOrder.type &&
        descending == true) {
      vehicleList = vehicleListTemp.getOrElse(() => KtList.empty())
          .toMutableList()
          .sortedByDescending<int>((a) {
        return a.vehType.getOrCrash();
      });
    } else {
      vehicleList =
          vehicleListTemp.getOrElse(() => KtList.empty()).toMutableList();
    }

    return vehicleList;
  }

  @override
  Future<void> close() async {
    refreshTimer?.cancel();
    return super.close();
  }

}
