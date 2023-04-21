import 'package:bluefang/package/bit_manipulation/bit_manipulation.dart';
import 'package:bluefang/src/domain/core/mt_changed_values.dart';
import 'package:bluefang/src/domain/core/mt_mixin.dart';
import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/domain/site/site_value_objects.dart';
import 'package:bluefang/src/domain/vehicle/vehicle.dart';
import 'package:bluefang/src/infrastructure/site/site_dtos.dart';

class MTSite with MTMixin {
  String siteIdHex;
  SiteID siteId;
  UserID userIdMod;
  DateTimeMod dateTimeRep;
  MTSite._({
    required this.siteIdHex,
    required this.siteId,
    required this.userIdMod,
    required this.dateTimeRep,
  });

  factory MTSite.incoming(Map<String, Object> json) {
    return MTSite._(
      siteIdHex: json["siteIdHex"].toString(),
      siteId: SiteID(0),
      userIdMod: UserID(10),
      dateTimeRep: DateTimeMod.now(),
    );
  }

  MTChangedValues parseAndGetChangedValues({required MTSite newValue}) {
    if (newValue.siteIdHex != siteIdHex) {
      _parseObject();
      newValue._parseObject();
      final MTChangedValues changedValues = mtChangedValues(newValue: newValue);
      return changedValues;
    } else {
      return MTChangedValues.empty();
    }
  }

  void _parseObject() {
    final siteIdValue = BitManipulation.hexToDecimal(siteIdHex);
    siteId = SiteID(siteIdValue);
  }

  void updatefromDatabase(Vehicle vehicle) {
    siteId = vehicle.siteId;
    userIdMod = vehicle.userIdMod;
    dateTimeRep = vehicle.dateTimeRep;
  }

  factory MTSite.existing(String dtBtRaw) {
    return MTSite._(
      siteIdHex: dtBtRaw.substring(14, 16),
      siteId: SiteID(0),
      userIdMod: UserID(10),
      dateTimeRep: DateTimeMod.subtract(const Duration(hours: 1)),
    );
  }
  @override
  List<Object> get mtTracked => toJson().keys.toList();
  @override
  Map<String, Object?> toJson() => {
        SiteDBFields.siteID: siteId.getOrCrash(),
        SiteDBFields.userIdMod: userIdMod.getOrCrash(),
        SiteDBFields.dateTimeMod: dateTimeRep.getOrCrash(),
      };
}
