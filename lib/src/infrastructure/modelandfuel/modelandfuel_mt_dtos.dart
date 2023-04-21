import 'package:bluefang/package/bit_manipulation/bit_manipulation.dart';
import 'package:bluefang/src/domain/core/mt_mixin.dart';
import 'package:bluefang/src/infrastructure/modelandfuel/modelandfuel_dtos.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'modelandfuel_mt_dtos.freezed.dart';

@freezed
class MTModelAndFuelDto with _$MTModelAndFuelDto, MTMixin, BitManipulation {
  MTModelAndFuelDto._();
  factory MTModelAndFuelDto({
    required int vehFuelType,
    required double vehFuelCapacity,
    required int userIdRep,
    required int dateTimeRep,
  }) = _MTModelAndFuelDto;
// For any consfusion regarding the numbers used here like (3,8), (0,3) we are parsing the data from Hex to Decimal.
  factory MTModelAndFuelDto.fromHex(
      {required String hex, required int userIdRep, required int dateTimeRep}) {
    final eleventhByteHex = hex.substring(22, 24);
    final String eleventhByte = BitManipulation.hexToBinary(eleventhByteHex);

    return MTModelAndFuelDto(
      vehFuelType: int.parse(eleventhByte.substring(5, 8),
          radix: 2), // See documentation. It contains 5 bits.
      vehFuelCapacity: BitManipulation.hexToDecimal(hex.substring(24, 28)) / 10,
      // Here this is divided by 10 because of the following reason.
      // Fuel Capacity (litres) (stored as liters * 10)  So 1010.5 Liter Tank capacity is stored as an integer 10105
      userIdRep: userIdRep,
      dateTimeRep: dateTimeRep,
    );
  }
  @override
  List<Object> get mtTracked => toJson().keys.toList();

  @override
  Map<String, Object?> toJson() => {
        ModelAndFuelDBFields.vehFuelType: vehFuelType,
        ModelAndFuelDBFields.vehFuelCapacity: vehFuelCapacity,
        ModelAndFuelDBFields.userIDRep: userIdRep,
        ModelAndFuelDBFields.dateTimeRep: dateTimeRep,
      };
}
