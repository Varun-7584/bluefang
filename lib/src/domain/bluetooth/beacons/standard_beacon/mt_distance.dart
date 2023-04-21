import 'package:bluefang/package/bit_manipulation/bit_manipulation.dart';
import 'package:bluefang/src/domain/core/mt_changed_values.dart';
import 'package:bluefang/src/domain/core/mt_mixin.dart';
import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/domain/distance/distance.dart';
import 'package:bluefang/src/domain/location/bf_location_data.dart';
import 'package:bluefang/src/domain/sensor/sensor_value_objects.dart';
import 'package:bluefang/src/infrastructure/distance/distance_dtos.dart';

class MTDistance with MTMixin {
  ParseStatus status;
  String dtLifeMilesHex;
  DtLifeMiles dtLifeMiles;
  GpsLat gpsLat;
  GpsLon gpsLon;
  UserID userIdMod;
  DateTimeMod dateTimeMod;
  UserID userIdRep;
  DateTimeMod dateTimeRep;

  MTDistance._(
      {required this.status,
      required this.dtLifeMilesHex,
      required this.dtLifeMiles,
      required this.gpsLat,
      required this.gpsLon,
      required this.userIdMod,
      required this.userIdRep,
      required this.dateTimeMod,
      required this.dateTimeRep});

  factory MTDistance.incoming(Map<String, Object> json) {
    return MTDistance._(
      status: ParseStatus.unparsedBeacon,
      dtLifeMilesHex: json["dtLifeMilesHex"].toString(),
      dtLifeMiles: DtLifeMiles(0),
      gpsLat: GpsLat(0),
      gpsLon: GpsLon(0),
      userIdMod: UserID(0),
      dateTimeMod: DateTimeMod.now(),
      userIdRep: UserID(0),
      dateTimeRep: DateTimeMod.now(),
    );
  }

  factory MTDistance.existing(String dtBtRaw) {
    return MTDistance._(
      status: ParseStatus.unparsedBeacon,
      dtLifeMilesHex: dtBtRaw,
      dtLifeMiles: DtLifeMiles(0),
      gpsLat: GpsLat(0),
      gpsLon: GpsLon(0),
      userIdMod: UserID(0),
      dateTimeMod: DateTimeMod.now(),
      userIdRep: UserID(0),
      dateTimeRep: DateTimeMod.now(),
    );
  }

  void updateFromDatabase(Distance distance) {
    status = ParseStatus.parsedBeacon;
    dtLifeMiles = distance.dtLifeMiles;
    gpsLat = distance.gpsLat;
    gpsLon = distance.gpsLon;
    userIdMod = distance.userIdMod;
    userIdRep = distance.userIdRep;
    dateTimeMod = distance.dateTimeMod;
    dateTimeRep = distance.dateTimeRep;
  }

  void updateGPSData(BFLocationData locationData) {
    gpsLat = GpsLat(locationData.latitude);
    gpsLon = GpsLon(locationData.longitude);
  }

  MTChangedValues parseAndGetChangedValues({required MTDistance newValue}) {
    if (newValue.dtLifeMilesHex != dtLifeMilesHex) {
      _parseValues();
      newValue._parseValues();
      final MTChangedValues changedValues = mtChangedValues(newValue: newValue);
      return changedValues;
    } else {
      return MTChangedValues.empty();
    }
  }

  void _parseValues() {
    if (status == ParseStatus.unparsedBeacon) {
      dtLifeMiles = DtLifeMiles(BitManipulation.hexToDecimal(dtLifeMilesHex));
    }
  }

  @override
  List<Object> get mtTracked => toJson().keys.toList();

  @override
  Map<String, Object?> toJson() => {
        DistanceDBFields.dtLifeMiles: dtLifeMiles.getOrCrash(),
        DistanceDBFields.dateTimeMod: dateTimeMod.getOrCrash(),
        DistanceDBFields.dateTimeRep: dateTimeRep.getOrCrash(),
        DistanceDBFields.gpsLat: gpsLat.getOrCrash(),
        DistanceDBFields.gpsLon: gpsLon.getOrCrash(),
        DistanceDBFields.userIDRep: userIdRep.getOrCrash(),
        DistanceDBFields.userIdMod: userIdMod.getOrCrash()
      };
}

enum ParseStatus { parsedBeacon, unparsedBeacon }
