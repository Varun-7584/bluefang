import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/core/value_transformers.dart';
import 'package:bluefang/src/domain/vehicle/vehicle.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
import 'package:dartz/dartz.dart';

/// Removes any space and speical characters from the VIN Number
String normalizeVIN(String number) => removeSpecialCharacters(
    removeSpaceCharacterFromString(number.toUpperCase()));

VinID9 getVinID9(VinID vinID) {
  final String vinIDString = vinID.getOrCrash();
  // Default vinID is 0 and we want to return VINID9 as 0 when we are checking for the unprogrammed sensors.

  if (vinIDString == Vehicle.defualtVINID) {
    return VinID9(Vehicle.defualtVINID);
  }
  final String vinID9 = vinIDString.substring(0, 8) + vinIDString[9];
  return VinID9(vinID9);
}

Either<ValueFailure<String>, String> convertToVinID9(String vinID) {
  final String vinID9 = vinID.substring(0, 8) + vinID[9];
  if (vinID9.isNotEmpty) {
    return right(vinID9);
  } else {
    return left(ValueFailure.empty(failedValue: vinID));
  }
}

// VehYear
int getVehYear(int number) {
  final strNumber = number.toString();
  final transformedVehYear = strNumber.substring(strNumber.length - 2);
  return int.parse(transformedVehYear);
}
