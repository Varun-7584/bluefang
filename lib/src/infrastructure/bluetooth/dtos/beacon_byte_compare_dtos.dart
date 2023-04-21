import 'package:bluefang/src/domain/core/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beacon_byte_compare_dtos.freezed.dart';

@freezed
class StandardBeaconByteCompareDto with _$StandardBeaconByteCompareDto {
  const StandardBeaconByteCompareDto._();

  const factory StandardBeaconByteCompareDto({
    required String hex,
    required String dtId,
    required String dtBtRaw,
    required String dtLifeMiles,
    required String stuatusRPD,
    required String fuelTypeAndCap,
    required String siteId,
  }) = _StandardBeaconByteCompareDto;

  factory StandardBeaconByteCompareDto.fromHex(String hex) {
    if (hex.length != 46) {
      throw InvalidRange(
          failedValue: "Invalid hex value $hex \n ${StackTrace.current}",
          min: 46,
          max: 46);
    }
    return StandardBeaconByteCompareDto(
      hex: hex,
      dtId: hex.substring(4, 12),
      dtBtRaw: hex.substring(14, 41),
      dtLifeMiles: hex.substring(30, 36),
      stuatusRPD: hex.substring(14, 23) + hex.substring(40, 41),
      fuelTypeAndCap: hex.substring(23, 28),
      siteId: hex.substring(28, 30),
    );
  }

  factory StandardBeaconByteCompareDto.fromDtBtRaw(
      {required String dtBtRaw, required String dtId}) {
    // Here, full current hex is not the actual total current hex. We just have reconstructed
    // The full hex value (adding 0 to the missing values in dtbtraw).
    // It is helpful for extracting hex values by using using .substring methods.
    final fullCurrentHex = "9706${dtId}00${dtBtRaw}00000";
    return StandardBeaconByteCompareDto(
      hex: fullCurrentHex,
      dtBtRaw: dtBtRaw,
      dtId: dtId,
      dtLifeMiles: dtBtRaw.substring(16, 22),
      stuatusRPD: dtBtRaw.substring(0, 9) + dtBtRaw.substring(26, 27),
      fuelTypeAndCap: dtBtRaw.substring(9, 14),
      siteId: dtBtRaw.substring(14, 16),
    );
  }
}
