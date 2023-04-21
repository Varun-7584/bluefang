import 'package:bluefang/src/domain/bluetooth/beacons/factory/beacon_factory.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/i_beacon.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/standard_beacon/mt_distance.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/standard_beacon/mt_model_n_fuel.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/standard_beacon/mt_sensor.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/standard_beacon/mt_site.dart';
import 'package:bluefang/src/domain/bluetooth/beacons/standard_beacon/standard_beacon_realtime_values.dart';
import 'package:bluefang/src/domain/core/mt_mixin.dart';
import 'package:bluefang/src/domain/sensor/sensor.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';

class StandardBeacon with MTMixin implements IBeacon {
  String hexValue;
  int manufacturerId;
  DtID dtId;
  BeaconType beaconType;
  bool vehicleBeaconEnabled;
  bool licensePlateBeaconEnabled;
  bool vinBeaconEnabled;
  MTModelAndFuel mtModelAndFuel;
  MTSensor mtSensor;
  MTSite mtSite;
  MTDistance mtDistance;
  SBRealTimeValues realTimeValues;
  int companyId;

  StandardBeacon._({
    required this.hexValue,
    required this.manufacturerId,
    required this.dtId,
    required this.beaconType,
    required this.vehicleBeaconEnabled,
    required this.licensePlateBeaconEnabled,
    required this.vinBeaconEnabled,
    required this.mtModelAndFuel,
    required this.mtSensor,
    required this.mtSite,
    required this.mtDistance,
    required this.realTimeValues,
    required this.companyId, // This denotes the company ID that is eligible to program this device - part of the security solution.
  });

  factory StandardBeacon.incoming(Map<String, Object> json) {
    final String companyIdValue = json["companyId"].toString();
    return StandardBeacon._(
      dtId: DtID(int.parse(json["dtId"].toString())),
      hexValue: json["hexValue"].toString(),
      companyId: int.parse(companyIdValue),
      manufacturerId: int.parse(json["manufacturerId"].toString()),
      beaconType: BeaconType.standardBeacon,
      vehicleBeaconEnabled:
          int.parse(json["vehicleBeaconEnabled"].toString()) == 1 && true,
      licensePlateBeaconEnabled:
          int.parse(json["licensePlateBeaconEnabled"].toString()) == 1 && true,
      vinBeaconEnabled:
          int.parse(json["vinBeaconEnabled"].toString()) == 1 && true,
      mtModelAndFuel: MTModelAndFuel.incoming(json),
      mtSensor: MTSensor.incoming(json),
      mtSite: MTSite.incoming(json),
      mtDistance: MTDistance.incoming(json),
      realTimeValues: SBRealTimeValues.incoming(json),
    );
  }

  factory StandardBeacon.existingValuesFromDB(Sensor sensor) {
    final String dtBtRaw = sensor.dtBtRaw;
    return StandardBeacon._(
      hexValue: "",
      manufacturerId: 0,
      dtId: sensor.dtId,
      beaconType: BeaconType.standardBeacon,
      vehicleBeaconEnabled: false,
      licensePlateBeaconEnabled: false,
      vinBeaconEnabled: false,
      mtModelAndFuel: MTModelAndFuel.existing(dtBtRaw),
      mtSensor: MTSensor.existingValuesFromDB(sensor),
      mtSite: MTSite.existing(dtBtRaw),
      mtDistance: MTDistance.existing(dtBtRaw),
      realTimeValues: SBRealTimeValues.existing(),
      companyId: 0,
    );
  }

  @override
  BeaconType get beaconTypes => BeaconType.standardBeacon;

  @override
  DtID get dtID => dtId;

  @override
  String get hex => hexValue;

  @override
  Map<String, Object?> toJson() {
    return {
      "hexValue": hexValue,
      "manufacturerId": manufacturerId,
      "dtId": dtId,
      "beaconType": BeaconType.standardBeacon,
      "vehicleBeaconEnabled": vehicleBeaconEnabled,
      "licensePlateBeaconEnabled": licensePlateBeaconEnabled,
      "vinBeaconEnabled": vinBeaconEnabled,
      "mtModelAndFuel": mtModelAndFuel.toJson(),
      "mtSensor": mtSensor.toJson(),
      "mtSite": mtSite.toJson(),
      "mtDistance": mtDistance.toJson(),
      "realTimeValues": realTimeValues.toJson(),
      "companyId": companyId,
    };
  }

  @override
  List<Object> get mtTracked => toJson().keys.toList();
}
