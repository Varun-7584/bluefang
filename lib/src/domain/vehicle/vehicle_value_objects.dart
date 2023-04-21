import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/core/value_objects.dart';
import 'package:bluefang/src/domain/core/value_validators.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_transformers.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_validators.dart';
import 'package:dartz/dartz.dart';


class VehID extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  static const int maxLength = 12;
  ///The vehicle “number” normally assigned by each fleet to identify the vehicle.
  ///Most fleets use 3 or 4 digit numbers but some are longer and include alphanumberic characters.
  ///
  ///Range [10 Bytes Alpha numberic with special symbols  (ASCII 32 to 126) ]
  ///
  ///Editable [Yes]
  ///
  ///WP calls it UnitID
  ///
  ///Type: String
  factory VehID(String input) {
    return VehID._(validateStringNotEmpty(input)
        .flatMap((result) => validateMaxStringLength(result, maxLength))
        .flatMap(validateASCII_32To126));
  }
  const VehID._(this.value);
}

///License Plate#
///Range[USA is 7 characters long max. Total 10 characters worth of space as some like to add the state  Example CA-WRT675 ]
///Can have null values.
///Editable [Yes]
///Type String
class VehPlateID extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  static const int maxLength = 12;
  factory VehPlateID(String input) {
    return VehPlateID._(validateStringNotEmpty(input)
        .flatMap((result) => validateMaxStringLength(result, maxLength)));
  }
  const VehPlateID._(this.value);
}

/// NHSTA standardized VIN#
/// Range [17 Bytes Alpha numberic (no symbols) ASCII 48 to 57 (0-9) and 65 to 90 (A-Z) EXCLUDING I,O,Q,Z ]
/// Editable [Yes]
/// Type String
class VinID extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory VinID(String input, {bool bypassVerification = false}) {
    return VinID._(validateStringNotEmpty(input)
        //Bypass the validation if the length is equal to 1, because we are making a fake VIN for them instead. 
        .flatMap((result) => validateVIN(result, VINTYPE.VIN17, bypassVerification: bypassVerification)));
  }
  const VinID._(this.value);

  static String fakeWMI(){
    return "QQQ";
  }
}

/// NHSTA standardized VIN
/// (First 8 characters plus 10th character skips 9th character as it is a checksum character)
/// Range [8 Bytes Alpha numberic (no symbols) ASCII 48 to 57 (0-9) and 65 to 90 (A-Z) EXCLUDING I,O,Q ]
/// Editable [Yes. Indirectly as VINID]
/// Type: String
class VinID9 extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  static const int maxLength = 9;

  factory VinID9(String input) {
    return VinID9._(validateStringNotEmpty(input)
        .flatMap((input) => validateVIN(input, VINTYPE.VIN9)));
  }

  /// Takes a String of VINID and converts it into VINID9.
  factory VinID9.fromVinId(String input) {
    return VinID9._(convertToVinID9(input));
  }
  const VinID9._(this.value);
}

/// Received from NHSTA API.
/// Description: [Model of the vehicle (stored because it requires an internet query so only want to have to do that once)].
/// Editable [Yes. Indirectly as VINID]
/// Type String
class VehModelID extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory VehModelID(String input) {
    return VehModelID._(validateStringNotEmpty(input));
  }
  const VehModelID._(this.value);
}

/// Vehicle Manufacturer based on NHSTA vehiclemake table definitions
/// Range 2 Bytes (0 to 65,535 where 460=Ford; 65535= undefined(default)
class VehMake extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory VehMake(int input) {
    return VehMake._(validateIntRange(input: input, min: 0, max: 65535));
  }
  const VehMake._(this.value);
}

/// Vehicle Type based on NHSTA fueltype table definitions
/// Range: 1 Byte (0 to 255 where 1=Diesel; 2=Electric, 4=Gas, 7=CNG, 8=LNG etc  255 = undefined(default)
/// Editable: Yes, picked from a list
/// Type: Int
class VehFuelType extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory VehFuelType(int input) {
    return VehFuelType._(validateIntRange(input: input, min: 0, max: 255));
  }
  const VehFuelType._(this.value);
}

/// Fuel Tank Capacity
/// Range: [0,999]
/// Editable: Yes.
/// Type Int
class VehFuelCapacity extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory VehFuelCapacity(int input) {
    return VehFuelCapacity._(
        validateIntRange(input: input, min: 0, max: 65535));
  }
  const VehFuelCapacity._(this.value);
}

///Units of Fuel for this vehicle type
///Range from 0 to 255. Where 251-244 are reserved and 255 is undefined.
///Type Int
class UOMFuel extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory UOMFuel(int input) {
    return UOMFuel._(validateIntRange(input: input, min: 0, max: 255));
  }
  const UOMFuel._(this.value);
}

///The length of the vehicle in Feet… common in description for both buses and trailers.
class VehLength extends ValueObject<double> {
  @override
  final Either<ValueFailure<double>, double> value;

  factory VehLength(double input) {
    return VehLength._(validateDoubleRange(input: input, min: 0, max: 99));
  }
  const VehLength._(this.value);
}

/// Vehicle Class 1 to 8. Value received by the query to NHSTA
class VehClass extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory VehClass(int input) {
    return VehClass._(validateIntRange(input: input, min: 1, max: 8));
  }
  const VehClass._(this.value);
}

/// Vehicle Year, 2001 to current year + 2 (last two digits only)
class VehYear extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory VehYear(int input) {
    return VehYear._(validateIntRange(
        input: input, min: 1, max: (DateTime.now().year + 2) - 2000));
  }
  const VehYear._(this.value);

  // Converts Input VehYear like 2021,2022 etc to 22,23 to store it on the database
}
