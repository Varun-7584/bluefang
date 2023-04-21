import 'package:bluefang/src/domain/core/mt_mixin.dart';
import 'package:bluefang/src/infrastructure/site/site_dtos.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'site_mt_dtos.freezed.dart';

@freezed
class MTSiteDto with _$MTSiteDto, MTMixin {
  MTSiteDto._();
  factory MTSiteDto({
    required int siteId,
    required int userIdMod,
    required int dateTimeRep,
  }) = _MTSiteDto;

  factory MTSiteDto.fromHex(
      {required String hex, required int userIdMod, required int dateTimeRep}) {
    final parsedSiteId = hex.substring(28, 30);
    return MTSiteDto(
        siteId: int.parse(parsedSiteId, radix: 16),
        userIdMod: userIdMod,
        dateTimeRep: dateTimeRep);
  }
  @override
  List<Object> get mtTracked => toJson().keys.toList();
  @override
  Map<String, Object?> toJson() => {
        SiteDBFields.siteID: siteId,
        SiteDBFields.userIdMod: userIdMod,
        SiteDBFields.dateTimeMod: dateTimeRep,
      };
}
