import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_transformers.dart';
import 'package:dartz/dartz.dart';

// ignore: constant_identifier_names
enum VINTYPE { VIN17, VIN9 }

/// Validates the vin through regex.
bool isValidVin(String vin, VINTYPE type) {
  final String sanitizedInput = normalizeVIN(vin);
  const vinRegex =
      r"""^(?<wmi>[A-HJ-NPR-Z\d]{3})(?<vds>[A-HJ-NPR-Z\d]{5})(?<check>[\dX])(?<vis>(?<year>[A-HJ-NPR-Z\d])(?<plant>[A-HJ-NPR-Z\d])(?<seq>[A-HJ-NPR-Z\d]([\dX]{5})))$""";
  const vin9Regex =
      r"""^(?<wmi>[A-HJ-NPR-Z\d]{3})(?<vds>[A-HJ-NPR-Z\d]{5})(?<check>[A-HJ-NPR-Z\d])""";
  return RegExp(type == VINTYPE.VIN9 ? vin9Regex : vinRegex)
      .hasMatch(sanitizedInput);
}

/// Validation takes palce through regex and by comparing the number of digits.
///
/// For regular VIN [Length = 17].
///
/// For VINID9 [Length = 9].
Either<ValueFailure<String>, String> validateVIN(String input, VINTYPE type, {bool bypassVerification = false}) {
  final String sanitizedInput = normalizeVIN(input);
  int length;

  if (bypassVerification){
    return right(input);
  }
  else if ((input.length == 17 || input.length == 9) && input.substring(0, 3) == VinID.fakeWMI()){
    return right(input);
  }

  if (type == VINTYPE.VIN9) {
    length = 9;
  } else {
    length = 17;
  }
  // Validating with Regex taken from vin_decoder and by checking the length of the VIN Number.
  if (isValidVin(sanitizedInput, type) && sanitizedInput.length == length) {
    return right(sanitizedInput);
  } else if (sanitizedInput.length > length) {
    return left(
        ValueFailure.exceedingLength(failedValue: sanitizedInput, max: length));
  } else if (sanitizedInput.length <= length) {
    return right(sanitizedInput);
  } else {
    return left(ValueFailure.invalidVIN(failedValue: sanitizedInput));
  }
}

/// Retuns an error if the values fall in the range of 251 to 254 because these are reserved values.
Either<ValueFailure<int>, int> validateFuelUOM(int input) {
  if (input >= 0 && input <= 250 || input == 255) {
    return right(input);
  } else {
    return left(ValueFailure.invalidUOM(failedValue: input));
  }
}
