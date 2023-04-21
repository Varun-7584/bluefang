// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls, unused_local_variable

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bluefang/injection.dart';
import 'package:bluefang/package/bit_manipulation/bit_manipulation.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/i_program_datatrac_repo.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac_failures.dart';
import 'package:bluefang/src/domain/bluetooth/bluetooth_result.dart';
import 'package:bluefang/src/domain/bluetooth/i_bluetooth_repository.dart';
import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/domain/distance/i_distance_repository.dart';
import 'package:bluefang/src/domain/logging/i_logitem_repository.dart';
import 'package:bluefang/src/domain/logging/log_item.dart';
import 'package:bluefang/src/domain/logging/logging_value_objects.dart';
import 'package:bluefang/src/infrastructure/bluetooth/dtos/bfbluetoothscanresult_dtos.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'programming_status_event.dart';
part 'programming_status_state.dart';
part 'programming_status_bloc.freezed.dart';

@injectable
class ProgrammingStatusBloc
    extends Bloc<ProgrammingStatusEvent, ProgrammingStatusState> {
  List<StreamSubscription> streamSubList = [];
  bool continueWriting = true;
  bool serviceFound = false;
  bool rxCharFound = false;
  bool txCharFound = false;
  final IBluetoothRepository bluetoothRepository;
  final IProgrammedDataTracRepository _programmedDataTracRepository;
  final ILogItemRepository _logItemRepository;

  static const txChar =
      "6e400003-b5a3-f393-e0a9-e50e24dcca9e";
  static const rxChar =
      "6e400002-b5a3-f393-e0a9-e50e24dcca9e";

  ProgrammingStatusBloc(this.bluetoothRepository, this._programmedDataTracRepository, this._logItemRepository) : super(ProgrammingStatusState.initial()) {
    int resultIndex = -1;
    log("Bloc Created", name: "Programming_status_bloc.dart");

    /// Called when the screen is first loaded
    on<_Started>((event, emit) async {
      await bluetoothRepository.pause();
      continueWriting = true;
      emit(ProgrammingStatusState.initial());

        if (continueWriting) {
          List<ScanResult> result = [];
          try {
            result = await FlutterBluePlus.instance.startScan(timeout: Duration(seconds: 5)) as List<ScanResult>;

            resultIndex = getResultIndex(result, event.dataTrac.sensor.dtId.getOrCrash());
          } 
          catch (ex){
            log("Scan failed because another scan was already in progress.");
          }

          try {
            if (resultIndex == -1){
              for (int i = 0; i < 5; i++){
                await FlutterBluePlus.instance.stopScan();
                result = await FlutterBluePlus.instance.startScan(timeout: Duration(seconds: 5)) as List<ScanResult>;
                resultIndex = getResultIndex(result, event.dataTrac.sensor.dtId.getOrCrash());
                if (resultIndex > -1){
                  break;
                }
              }
            }
          }
          catch (ex){
            log("Exception while scanning: $ex");
          }
          
          if (resultIndex > -1 && result.isNotEmpty){

            final ScanResult r = result.elementAt(resultIndex);
            try {
                //Make sure we aren't already connected to the device
                if (!(await FlutterBluePlus.instance.connectedDevices).contains(
                        r.device)
                    ) {
                  //log("Had not connected to device; connecting now");
                  await r.device.connect(autoConnect: false);
                  //await FlutterBluePlus.instance.stopScan();
                  add(ProgrammingStatusEvent.connected(true));
                  await r.device.mtu.first;
                  log("Mtu: ${await r.device.mtu.first}");
                  final int response = await r.device.requestMtu(165);
                  log("New Mtu: $response");
                  //Get the mileage and the company id from the beacon
                  final BFBluetoothScanResult bluetoothScanResult = BFBluetoothScanResultDtos.fromScanResults(r).toDomain();
                  await getIt<IBluetoothRepository>().processBeacons(bluetoothScanResult);


                  final List<BluetoothService> serviceList = await r.device.discoverServices();
                  
                  for (final s in serviceList) {
                    //log("Service UUID: ${s.uuid}", name: "programming_status_bloc.dart");
                    if (s.uuid.toString() == "6e400001-b5a3-f393-e0a9-e50e24dcca9e") {
                      serviceFound = true;
                      final actualTxChar = s.characteristics.firstWhere((element) => element.uuid.toString() == txChar);
                      final success = await actualTxChar.setNotifyValue(true);
                      if (success){
                        log("Set notify value.");
                      }
                      else {
                        log("**Failed to set notify value.**");
                      }
                      
                      final actualRxChar = s.characteristics.firstWhere((element) => element.uuid.toString() == rxChar);
                      //log("Char UUID: ${char.uuid}");
                      if (continueWriting) {
                        continueWriting = false;
                        //TODO: change CID for production
                        final List<int> payload = await createPayload(event.dataTrac, event.changedValuesMap, 0, realPassword: event.realPassword);
                        log("Payload: $payload");                       
                        await actualRxChar.write(payload); 
                        add(ProgrammingStatusEvent.updated(true));
                        log("Wrote to device.");

                        // final readResult = await actualRxChar.read();
                        // log("Read result: $readResult");
                      }  
                      //r.device.disconnect();
                      bool readYet = false;

                      final txCharSubscription = actualTxChar.value.listen((value) async {
                        if (!readYet){
                          if (value.isNotEmpty){
                            try {
                              readYet = true;
                              log("Value: $value");
                              log("Command code: ${value[18]}");
                              if (value[18] != 0){
                                add(ProgrammingStatusEvent.verificationFailed());
                                final logItemResult = await _logItemRepository.add(
                                  logItem: LogItem(
                                    dateTime: DateTimeMod.now(), 
                                    messageType: MessageType.fromString(MessageTypeEnum.ERR_V.name), 
                                    descShort: "Error", 
                                    recordId: 0, 
                                    valueOld: "", 
                                    valueNew: "", 
                                    descFull: "Error verifying the values written to the datatrac. Command code: ${value[18]}", 
                                    vehId: event.dataTrac.vehicle.vehId, 
                                    dtId: event.dataTrac.vehicle.dtId
                                  )
                                );
                                
                                if (logItemResult.isLeft()){
                                  log("Error writing to log table: $logItemResult", name: "programming_status_bloc.dart");
                                }
                              }
                              else {
                                add(ProgrammingStatusEvent.verified(true));
                              }
                            }
                            catch (ex){
                              readYet = false;
                            }
                          }
                        }
                      });
                      //No way to await the stream, so we have to wait a set amount of time to see if we can cancel the stream yet
                      await Future.delayed(Duration(seconds: 5));
                      //If it hasn't been successfully read yet, wait a few more seconds
                      if (!readYet){
                        await Future.delayed(Duration(seconds: 3));
                        if (!readYet){
                          log("Timed out on verification. Waited 8 seconds.");
                        }
                      }

                      //Cancel the subscription so we won't receive updates after the event handler is done
                      await txCharSubscription.cancel();
                      //Disconnect from the device
                      await r.device.disconnect();
                      //Make sure the scan has stopped
                      await FlutterBluePlus.instance.stopScan();

                      //If we succeeded programming the DataTrac, move to the next screen and resume scanning
                      if (state.isVerified){
                        dartz.Either<ProgrammedDataTracFailure, dartz.Unit> success;
                        //log("Event datatrac: ${event.dataTrac}", name: "programming_status_bloc.dart");
                        if (event.wiping){
                          log("Deleting vehicle with dtID ${event.dataTrac.sensor.dtId.getOrCrash()}");
                          success = await _programmedDataTracRepository.delete(
                            dtID: event.dataTrac.sensor.dtId
                          );
                        }
                        else if (event.isEditing){
                          success = await _programmedDataTracRepository.update(
                            programmedDataTrac: event.dataTrac
                          );
                        }
                        else {
                          success = await _programmedDataTracRepository.add(
                            programmedDataTrac: event.dataTrac
                          );
                        }
                        if (success.isLeft()){
                          emit(state.copyWith(
                            writingFailed: true
                          ));
                        }
                        else {
                          emit(state.copyWith(
                            isWritten: true
                          ));
                          await Future.delayed(Duration(seconds: 2));
                          bluetoothRepository.resume();
                          emit(
                            state.copyWith(changeScreen: true, homeScreen: event.wiping)
                          );
                        }
                      }
                      else {
                        emit(state.copyWith(
                          verificationFailed: true
                        ));
                        
                      }
                    }
                  }
                  if (!serviceFound){
                    add(ProgrammingStatusEvent.updateFailed());
                    r.device.disconnect();
                    await FlutterBluePlus.instance.stopScan();
                  }
                } else {
                  log("Error: Already connected to device.");
                  throw Exception("Already connected to device");
                }
            }
            catch (ex){
              log("Exception: $ex");
              await r.device.disconnect();
              await FlutterBluePlus.instance.stopScan();
              //bluetoothRepository.resume();
            }
          }
          else {
            if (!super.isClosed){
              add(ProgrammingStatusEvent.connectionFailed());
              //Just in case
              await bluetoothRepository.pause();
            }
          }
        }
        else {

        }
    });
    on<_Connected>((event, emit) async {
      emit(state.copyWith(isConnected: event.isConnected));
    });
    on<_Updated>((event, emit) async {
      emit(state.copyWith(isProgrammed: event.isUpdated));
    });
    on<_Verified>((event, emit) async {
      emit(state.copyWith(isVerified: event.isVerified));
    });
    on<_ConnectionFailed>((event, emit) async {
      emit(state.copyWith(connectionFailed: true));
    });
    on<_UpdateFailed>((event, emit) async {
      emit(state.copyWith(updateFailed: true));
    });
    on<_VerificationFailed>((event, emit) async {
      emit(state.copyWith(verificationFailed: true));
    });
  }

  int getResultIndex(List<ScanResult> result, int dtId){
    return result.indexWhere((element){
      if (element.advertisementData.manufacturerData.containsKey(1687)){
        final mapOfBytes = element.advertisementData.manufacturerData;
        final List<int> listOfBytes = mapOfBytes.entries.first.value;
        final String incomingPartialHexWithoutIdentifier =
            BitManipulation.listOfBytesToHex(listOfBytes);
        final hexDataTracId = dtId;
        final dtIDhexString = hexDataTracId.toRadixString(16);
        if (incomingPartialHexWithoutIdentifier.contains(dtIDhexString.toUpperCase())){
          return true;
        }
        return false;
      }
      else {
        return false;
      }
    });
  }

  @override
  Future<void> close() async {
    await super.close();
    final List<BluetoothDevice> connectedDeviceList =
        await FlutterBluePlus.instance.connectedDevices;
    for (final connectedDevice in connectedDeviceList) {
      connectedDevice.disconnect();
    }
    await FlutterBluePlus.instance.stopScan();
    bluetoothRepository.resume();
  }

  /// Produces the Bluetooth payload from the DataTrac parameters.
  /// 
  /// Returns a list of integers in ASCII and hex.  
  Future<List<int>> createPayload(ProgrammedDataTrac dataTrac, Map<String, dynamic> changedValuesMap, int cid, {bool realPassword = true}) async {
    final List<int> returnList = [];
    List<int> asciiValueTemp = [];
    final asciiEncoder = AsciiEncoder();
    
    log("Changed values map:", name: "programming_status_bloc");
    for (final changedVal in changedValuesMap.entries){
      log("${changedVal.key} : ${changedVal.value}");
    }

    final distanceResult = await getIt<IDistanceRepository>().find(dtID: dataTrac.sensor.dtId);
    final int lifeMiles = distanceResult.fold((l) => 0, (r) => r.dtLifeMiles.getOrCrash()); 

    //There are currently only 12 parameters actually written to the datatrac. 
    //The command header (command, password, and company ID) is required; otherwise only send changed values
    //**Command**
    returnList.addAll(asciiEncoder.convert("01")); //Length - will always be one character for the command code
    returnList.addAll(asciiEncoder.convert("1")); //Type code
    returnList.addAll(asciiEncoder.convert("1"));  //Value

    //**Password**
    if (realPassword){
      log("Serial number: ${dataTrac.sensor.dtId.getOrCrash()} Life miles: $lifeMiles Cid: $cid");
      log("Password hex string: ${(dataTrac.sensor.dtId.getOrCrash() ^ (cid + lifeMiles)).toRadixString(16).toUpperCase().padLeft(8, '0')}");
      asciiValueTemp = asciiEncoder.convert(
        BitManipulation.murmrHash(
          BigInt.parse((dataTrac.sensor.dtId.getOrCrash() ^ (cid + lifeMiles)).toRadixString(16).padLeft(8, '0').toUpperCase(), radix: 16)
        ).toRadixString(16).toUpperCase().padLeft(8, '0')
      );
      log("Hash of password: $asciiValueTemp", name: "programming_status_bloc.dart");
    }
    else {
      asciiValueTemp = asciiEncoder.convert("PASSWORD");
    }
    returnList.addAll(asciiEncoder.convert(asciiValueTemp.length.toRadixString(16).padLeft(2, '0').toUpperCase()));
    returnList.addAll(asciiEncoder.convert("2")); //Type code
    returnList.addAll(asciiValueTemp);
    
    //**Company ID**
    asciiValueTemp = asciiEncoder.convert(cid.toRadixString(16).padLeft(4, '0'));
    returnList.addAll(asciiEncoder.convert(asciiValueTemp.length.toRadixString(16).padLeft(2, '0').toUpperCase()));
    returnList.addAll(asciiEncoder.convert("3"));
    returnList.addAll(asciiValueTemp);

    //**sensor_dtRpd**
    if (changedValuesMap.containsKey("dtRpd")){
      asciiValueTemp = asciiEncoder.convert((changedValuesMap["dtRpd"] as int).toRadixString(16).padLeft(3, '0').toUpperCase());
      returnList.addAll(asciiEncoder.convert(asciiValueTemp.length.toRadixString(16).padLeft(2, '0').toUpperCase()));
      returnList.addAll(asciiEncoder.convert("4"));
      returnList.addAll(asciiValueTemp);
    }

    //**sensor_dtUom**
    if (changedValuesMap.containsKey("dtUom")){
      asciiValueTemp = asciiEncoder.convert((changedValuesMap["dtUom"] as int).toRadixString(16).toUpperCase());
      returnList.addAll(asciiEncoder.convert(asciiValueTemp.length.toRadixString(16).padLeft(2, '0').toUpperCase()));
      returnList.addAll(asciiEncoder.convert("5"));
      returnList.addAll(asciiValueTemp);
    }

    //**Distance_dtLifeMiles**
    if (changedValuesMap.containsKey("dtLifeMiles")){
      asciiValueTemp = asciiEncoder.convert((changedValuesMap["dtLifeMiles"] as int).toRadixString(16).padLeft(6, '0').toUpperCase());
      returnList.addAll(asciiEncoder.convert("06"));
      returnList.addAll(asciiEncoder.convert("6"));
      returnList.addAll(asciiValueTemp);
    }

    //**MF_vehFuelType**
    if (changedValuesMap.containsKey("vehFuelType")){
      asciiValueTemp = asciiEncoder.convert((changedValuesMap["vehFuelType"] as int).toRadixString(16).padLeft(2, '0').toUpperCase());
      returnList.addAll(asciiEncoder.convert(asciiValueTemp.length.toRadixString(16).padLeft(2, '0').toUpperCase()));
      returnList.addAll(asciiEncoder.convert("7"));
      returnList.addAll(asciiValueTemp);
    }

    //**MF_vehFuelCapacity**
    if (changedValuesMap.containsKey("vehFuelCapacity")){
      asciiValueTemp = asciiEncoder.convert((changedValuesMap["vehFuelCapacity"] as int).toRadixString(16).padLeft(4, '0').toUpperCase());
      returnList.addAll(asciiEncoder.convert(asciiValueTemp.length.toRadixString(16).padLeft(2, '0').toUpperCase()));
      returnList.addAll(asciiEncoder.convert("8"));
      returnList.addAll(asciiValueTemp);
    }

    //**Veh_siteId**
    if (changedValuesMap.containsKey("siteId")){
      asciiValueTemp = asciiEncoder.convert((changedValuesMap["siteId"] as int).toRadixString(16).padLeft(2, '0').toUpperCase());
      returnList.addAll(asciiEncoder.convert(asciiValueTemp.length.toRadixString(16).padLeft(2, '0').toUpperCase()));
      returnList.addAll(asciiEncoder.convert("9"));
      returnList.addAll(asciiValueTemp);
    }

    //**Veh_vehId**
    if (changedValuesMap.containsKey("vehId")){
      asciiValueTemp = asciiEncoder.convert((changedValuesMap["vehId"] as String).toUpperCase());
      returnList.addAll(asciiEncoder.convert(asciiValueTemp.length.toRadixString(16).padLeft(2, '0').toUpperCase()));
      returnList.addAll(asciiEncoder.convert("A"));
      returnList.addAll(asciiValueTemp);
    }

    //**vinId**
    if (changedValuesMap.containsKey("vinId")){
      asciiValueTemp = asciiEncoder.convert((changedValuesMap["vinId"] as String).toUpperCase());
      returnList.addAll(asciiEncoder.convert(asciiValueTemp.length.toRadixString(16).padLeft(2, '0').toUpperCase()));
      returnList.addAll(asciiEncoder.convert("B"));
      returnList.addAll(asciiValueTemp);
    }

    //**vehPlateId**
    if (changedValuesMap.containsKey("vehPlateId")){
      asciiValueTemp = asciiEncoder.convert((changedValuesMap["vehPlateId"] as String).toUpperCase());
      returnList.addAll(asciiEncoder.convert(asciiValueTemp.length.toRadixString(16).padLeft(2, '0').toUpperCase()));
      returnList.addAll(asciiEncoder.convert("C"));
      returnList.addAll(asciiValueTemp);
    }

    //**End of Transmission**
    returnList.addAll(asciiEncoder.convert("01"));
    returnList.addAll(asciiEncoder.convert("F"));
    returnList.addAll(asciiEncoder.convert("!"));

    return returnList;
  }
}
