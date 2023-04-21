import 'package:bluefang/src/domain/core/mt_mixin.dart';
import 'package:bluefang/src/infrastructure/distance/distance_dtos.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'distance_mt_dtos.freezed.dart';

@freezed
class MTDistanceDto with _$MTDistanceDto, MTMixin {
  MTDistanceDto._();
  factory MTDistanceDto({
    required int dtId,
    required int dtLifeMiles,
    required double gpsLat,
    required double gpsLon,
    required int userIdMod,
    required int dateTimeMod,
    required int userIdRep,
    required int dateTimeRep,
  }) = _MTDistanceDto;

  factory MTDistanceDto.fromHex(String hex, double gpsLon, double gpsLat,
      int userIdMod, int userIdRep, int dateTimeMod, int dateTimeRep) {
    return MTDistanceDto(
      dtId: int.parse(hex.substring(4, 12), radix: 16),
      dtLifeMiles: int.parse(hex.substring(30, 36), radix: 16),
      gpsLat: gpsLat,
      gpsLon: gpsLon,
      userIdMod: userIdMod,
      dateTimeMod: dateTimeMod,
      userIdRep: userIdRep,
      dateTimeRep: dateTimeRep,
    );
  }

  @override
  List<Object> get mtTracked => toJson().keys.toList();

  @override
  Map<String, Object?> toJson() => {
        DistanceDBFields.dtId: dtId,
        DistanceDBFields.dtLifeMiles: dtLifeMiles,
        DistanceDBFields.dateTimeMod: dateTimeMod,
        DistanceDBFields.dateTimeRep: dateTimeRep,
        DistanceDBFields.gpsLat: gpsLat,
        DistanceDBFields.gpsLon: gpsLon,
        DistanceDBFields.userIDRep: userIdRep,
        DistanceDBFields.userIdMod: userIdMod
      };
}
