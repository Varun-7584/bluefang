import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/core/mt_mixin.dart';
import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/domain/site/site_value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'site.freezed.dart';

@freezed
class Site with _$Site, MTMixin {
  Site._();

  /// Creates a new Site from the given parameters. 
  /// 
  /// All parameters are validated partially by creating the object, since it runs validation on the 
  factory Site({
    required SiteID siteId,
    required SiteName siteName,
    required GpsLat gpsLat,
    required GpsLocTol gpsLatTol,
    required GpsLon gpsLon,
    required GpsLocTol gpsLonTol,
    required UserID userIdMod,
    required DateTimeMod dateTimeMod,
  }) = _Site;

  factory Site.empty() => Site(
        siteId: SiteID(0),
        siteName: SiteName('default'),
        gpsLat: GpsLat(0),
        gpsLatTol: GpsLocTol(0),
        gpsLon: GpsLon(0),
        gpsLonTol: GpsLocTol(0),
        userIdMod: UserID(0),
        dateTimeMod: DateTimeMod(DateTime.now()),
      );
  @override
  // TODO: implement mtTracked
  List<Object> get mtTracked => ["Site_siteName"];

  /// Converts the current Site object to JSON. 
  /// 
  /// If any of the values are invalid, the method will throw an error and stop. 
  @override
  Map<String, Object?> toJson() => {
        'Site_siteId': siteId.getOrCrash(),
        'Site_siteName': siteName.getOrCrash(),
        'Site_gpsLat': gpsLat.getOrCrash(),
        'Site_gpsLatTol': gpsLatTol.getOrCrash(),
        'Site_gpsLon': gpsLon.getOrCrash(),
        'Site_gpsLonTol': gpsLonTol.getOrCrash(),
        'Site_userIdMod': userIdMod.getOrCrash(),
        'Site_dateTimeMod': dateTimeMod.getOrCrash(),
      };

  Map<Object, List<Object?>> getChangedValues(Site newSite) {
    return changedValues(newValue: newSite);
  }

  /// Creates a new Site from the map representation of a JSON string.
  /// 
  /// Only a few of the parameters can handle the json value having an incorrect type. 
  factory Site.fromJson(Map<String, dynamic> json) {
    return Site(
      siteId: SiteID((json["Site_siteId"] as String?) == null
          ? 200
          : int.parse(json["Site_siteId"] as String)),
      siteName: SiteName((json["Site_siteName"] as String?) == null
          ? ""
          : json["Site_siteName"] as String),
      gpsLat: GpsLat(json['Site_gpsLat'] as double),
      gpsLatTol: GpsLocTol(json['Site_gpsLatTol'] as double),
      gpsLon: GpsLon(json['Site_gpsLon'] as double),
      gpsLonTol: GpsLocTol(json['Site_gpsLonTol'] as double),
      userIdMod: UserID(json['Site_userIdMod'] as int),
      dateTimeMod: DateTimeMod.fromInt(json['Site_dateTimeMod'] as int),
    );
  }

  Option<ValueFailure<dynamic>> get failureOption {
    return dateTimeMod.failureOrUnit
        .andThen(siteId.failureOrUnit)
        .andThen(siteName.failureOrUnit)
        .andThen(userIdMod.failureOrUnit)
        .fold(
          (f) => some(f),
          (r) => none(),
        );
  }
}
