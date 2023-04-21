import 'package:bluefang/package/bit_manipulation/bit_manipulation.dart';
import 'package:bluefang/src/domain/core/mt_changed_values.dart';
import 'package:bluefang/src/domain/core/mt_mixin.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
import 'package:bluefang/src/infrastructure/modelandfuel/modelandfuel_dtos.dart';

class MTModelAndFuel with MTMixin {
  String fuelTypeAndCap;
  VehFuelType vehFuelType;
  VehFuelCapacity vehFuelCapacity;
  int userIdRep;
  int dateTimeRep;
  MTModelAndFuel._({
    required this.fuelTypeAndCap, //11 to 13 byte.
    required this.vehFuelType,
    required this.vehFuelCapacity,
    required this.userIdRep,
    required this.dateTimeRep,
  });

  factory MTModelAndFuel.incoming(Map<String, Object> json) {
    return MTModelAndFuel._(
      fuelTypeAndCap: json["fuelTypeAndCap"].toString(),
      vehFuelType: VehFuelType(0),
      vehFuelCapacity: VehFuelCapacity(0),
      userIdRep: 0,
      dateTimeRep: DateTime.now().millisecondsSinceEpoch,
    );
  }

  MTChangedValues parseAndGetChangedValues({required MTModelAndFuel newValue}) {
    if (newValue.fuelTypeAndCap != fuelTypeAndCap) {
      _parseValues();
      newValue._parseValues();
      final MTChangedValues changedValues = mtChangedValues(newValue: newValue);
      return changedValues;
    } else {
      return MTChangedValues.empty();
    }
  }

  void _parseValues() {
    final String eleventhByteBinary =
        BitManipulation.hexToBinary(fuelTypeAndCap.substring(0, 2));
    final int vehFuelTypeValue = int.parse(eleventhByteBinary.substring(5, 8));
    final int vehFuelCapacityValue =
        BitManipulation.hexToDecimal(fuelTypeAndCap.substring(2, 6));
    vehFuelType = VehFuelType(vehFuelTypeValue);
    vehFuelCapacity = VehFuelCapacity(vehFuelCapacityValue);
  }

  factory MTModelAndFuel.existing(String dtBtRaw) {
    return MTModelAndFuel._(
      fuelTypeAndCap: dtBtRaw.substring(8, 14),
      vehFuelType: VehFuelType(0),
      vehFuelCapacity: VehFuelCapacity(0),
      userIdRep: 0,
      dateTimeRep: DateTime.now()
          .subtract(const Duration(days: 1))
          .millisecondsSinceEpoch,
    );
  }

  @override
  List<Object> get mtTracked => toJson().keys.toList();

  @override
  String toString() {
    return "fuelTypeAndCap: $fuelTypeAndCap Json: ${toJson()}";
  }

  @override
  Map<String, Object?> toJson() => {
        ModelAndFuelDBFields.vehFuelType: vehFuelType.getOrCrash(),
        ModelAndFuelDBFields.vehFuelCapacity: vehFuelCapacity.getOrCrash(),
        ModelAndFuelDBFields.userIDRep: userIdRep,
        ModelAndFuelDBFields.dateTimeRep: dateTimeRep,
      };
}
