// ignore_for_file: non_constant_identifier_names, type_annotate_public_apis, unnecessary_statements, prefer_const_constructors, avoid_log, avoid_types_as_parameter_names, type_init_formals, unused_field
import 'dart:developer';
import 'dart:math' as math;

import 'package:bloc/bloc.dart';
import 'package:bluefang/injection.dart';
import 'package:bluefang/package/observer/watchlist.dart';
import 'package:bluefang/src/domain/aggregates/ProgrammedDataTrac/program_datatrac_failures.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/i_beacon.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/standard_beacon/sensor_speed.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/standard_beacon/signal_strength.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/standard_beacon/standard_beacon.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/vehicle_beacons/license_plate_beacon.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/vehicle_beacons/vehicle_number_beacon.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/vehicle_beacons/vin_number_beacon.dart';
import 'package:bluefang/src/domain/bluetooth/i_bluetooth_repository.dart';
import 'package:bluefang/src/domain/distance/distance.dart';
import 'package:bluefang/src/domain/distance/distance_failure.dart';
import 'package:bluefang/src/domain/distance/i_distance_repository.dart';
import 'package:bluefang/src/domain/sensor/i_sensor_repository.dart';
import 'package:bluefang/src/domain/sensor/sensor.dart';
import 'package:bluefang/src/domain/sensor/sensor_failure.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:stats/stats.dart';

part 'sensordetails_bloc.freezed.dart';
part 'sensordetails_event.dart';
part 'sensordetails_state.dart';

@injectable

/// Bloc handler for the Sensor Details screen.
///
/// [author] Bailie Livingston.
/// Establishes the bloc to handle the [SensordetailsEvent]s and [SensordetailsState]s.
class SensordetailsBloc extends Bloc<SensordetailsEvent, SensordetailsState> {
  final IBluetoothRepository _bluetoothRepository;
  final ISensorRepository _sensorRepository;
  final IDistanceRepository _distanceRepository;

  Either<SensorFailure, Sensor>? sensorResponse;
  Either<DistanceFailure, Distance>? distanceResponse;
  Sensor? theSensor;
  Distance? theDistance;
  List<int> signals = [];
  num maxValue = -1000;

  /// Instantiates the bloc and injects the programmedDataTracRepository.
  SensordetailsBloc(this._bluetoothRepository, this._sensorRepository, this._distanceRepository)
      : super(SensordetailsState.initial()) {
    // Listen to the stream to detect changed values.

    // Listen to the stream of beacon objects.

    WatchList().getScribeStream().listen((event) {
      if (event == true && theSensor != null && theDistance != null){
        if (!super.isClosed) {
          add(_DisplaySensor(dataTracID: theSensor!.dtId));
        }
      }
    });

    on<_BeaconAlert>((event, emit) async {
      try {
        final IBeacon beacon = event.beacon;

        if (beacon.dtID == theSensor!.dtId) {
          if (!super.isClosed) {
            log("RECEIVED A NEW BEACON FOR DTID: ${beacon.toJson()}",
                name: "sensordetails_bloc.dart");
            if (beacon is StandardBeacon) {
              if (signals.length < 10) {
                signals.add(beacon.realTimeValues.signalStrength);
              } else {
                signals.remove(0);
                signals[0] = beacon.realTimeValues.signalStrength;
              }
              final SignalStrength signalStrength = SignalStrength.fromStats(
                  Stats.fromData(signals),
                  beacon.realTimeValues.signalStrength);
              maxValue =
                  math.max(maxValue, beacon.realTimeValues.signalStrength);
              signalStrength.updateMax(maxValue);
              final newState = state.copyWith(
                standardBeaconHex: beacon.hex,
                rotationalFrequency: beacon.realTimeValues.rotationalFrequency,
                rotationalAngle: beacon.realTimeValues.rotationalAngle,
                signalStrength: signalStrength.getParsedData(),
                speed: SensorSpeed(beacon.mtSensor.dtRpd,
                        beacon.realTimeValues.rotationalFrequency)
                    .getSpeed(),
              );

              emit(newState);
            }
            if (beacon is LicensePlateBeacon) {
              emit(state.copyWith(licensePlateBeaconHex: beacon.hex));
            }
            if (beacon is VehicleNumberBeacon) {
              emit(state.copyWith(vehicleBeaconHex: beacon.hex));
            }
            if (beacon is VinNumberBeacon) {
              emit(state.copyWith(vinBeaconHex: beacon.hex));
            }
          }
        }
      } catch (ex) {
        log("Error reading beacon.", error: ex);
      }
    });

    on<_DisplaySensor>((event, emit) async {
      try {
        // Handling emitting real time values.
        final String dtID = event.dataTracID.getOrCrash().toString();
        WatchList().watchValue(dtID);

        getIt<IBluetoothRepository>().streamOfBeacons.listen((IBeacon beacon) {
          if (!super.isClosed) {
            add(_BeaconAlert(beacon: beacon));
          }
        });

        //Get Sensor for this dtId
        sensorResponse =
            await _sensorRepository.find(dtID: event.dataTracID);

        sensorResponse!.fold((Failure) {
          log("Failed to find datatrac.", name: "sensordetails_bloc");
        }, (sensor) {
          theSensor = sensor;
        });

        //Get Distance for this dtId
        distanceResponse =
            await _distanceRepository.find(dtID: event.dataTracID);

        distanceResponse!.fold((Failure) {
          log("Failed to find datatrac.", name: "sensordetails_bloc");
        }, (distance) {
          theDistance = distance;
        });

        if (theDistance == null || theSensor == null) {
          log("data trac is null", name: "sensordetails_bloc.dart");
        } else {
          emit(state.copyWith(
            sensor: theSensor!, 
            distance: theDistance!,
            isLoading: false
          ));
        }
      } catch (e) {
        log("There was an error processing the DisplayVehicle event.",
            error: e);
      }
    });
  }
}
