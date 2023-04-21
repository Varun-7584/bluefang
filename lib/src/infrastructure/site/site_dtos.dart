import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/domain/site/site.dart';
import 'package:bluefang/src/domain/site/site_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'site_dtos.freezed.dart';

@freezed
class SiteDto with _$SiteDto {
  const SiteDto._();
  const factory SiteDto({
    required int siteId,
    required String siteName,
    required double gpsLat,
    required double gpsLatTol,
    required double gpsLon,
    required double gpsLonTol,
    required int userIdMod,
    required int dateTimeMod,
  }) = _SiteDto;

  factory SiteDto.fromDomain(Site site) {
    return SiteDto(
      siteId: site.siteId.getOrCrash(),
      siteName: site.siteName.getOrCrash(),
      gpsLat: site.gpsLat.getOrCrash(),
      gpsLatTol: site.gpsLatTol.getOrCrash(),
      gpsLon: site.gpsLon.getOrCrash(),
      gpsLonTol: site.gpsLonTol.getOrCrash(),
      userIdMod: site.userIdMod.getOrCrash(),
      dateTimeMod: site.dateTimeMod.getOrCrash(),
    );
  }

  Site toDomain() {
    return Site(
      siteId: SiteID(siteId),
      siteName: SiteName(siteName),
      gpsLat: GpsLat(gpsLat),
      gpsLatTol: GpsLocTol(gpsLatTol),
      gpsLon: GpsLon(gpsLon),
      gpsLonTol: GpsLocTol(gpsLonTol),
      userIdMod: UserID(userIdMod),
      dateTimeMod: DateTimeMod.fromInt(dateTimeMod),
    );
  }

  factory SiteDto.fromJson(Map<String, dynamic> json) {
    return SiteDto(
      siteId: json['siteId'] as int,
      siteName: json['siteName'].toString(),
      gpsLat: json['gpsLat'] as double,
      gpsLatTol: json['gpsLatTol'] as double,
      gpsLon: json['gpsLon'] as double,
      gpsLonTol: json['gpsLonTol'] as double,
      userIdMod: json['userIdMod'] as int,
      dateTimeMod: json['dateTimeMod'] as int,
    );
  }

  Map<String, Object?> toJson() => {
        SiteDBFields.siteID: siteId,
        SiteDBFields.siteName: siteName,
        SiteDBFields.gpsLat: gpsLat,
        SiteDBFields.gpsLatTol: gpsLatTol,
        SiteDBFields.gpsLon: gpsLon,
        SiteDBFields.gpsLonTol: gpsLonTol,
        SiteDBFields.userIdMod: userIdMod,
        SiteDBFields.dateTimeMod: dateTimeMod,
      };
}

class SiteDBFields {
  static const String tableName = 'Site';
  static const String primaryKey = 'siteId';
  static const String siteID = 'siteId';
  static const String siteName = 'siteName';
  static const String gpsLat = 'gpsLat';
  static const String gpsLatTol = 'gpsLatTol';
  static const String gpsLon = 'gpsLon';
  static const String gpsLonTol = 'gpsLonTol';
  static const String userIdMod = 'userIdMod';
  static const String dateTimeMod = 'dateTimeMod';
}
