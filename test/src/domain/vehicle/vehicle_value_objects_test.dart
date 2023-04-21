import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/vehicle/vehicle_value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart' as matcher;

void main() {
  // ANCHOR VehID
  group('Vehicle ID (VehID): ', () {
    test('should create VehID when value is correct', () {
      // arrange
      const str = "W123445";
      final vehID = VehID(str);
      // assert
      expect(vehID.getValueOrError(), str);
    });
    test('should give an error when value exceeds 10 digits', () {
      // arrange
      const str = '12345678901';
      final vehID = VehID(str).failureOrUnit.fold((l) => l, (r) => r);
      // assert
      expect(vehID, const matcher.TypeMatcher<ExceedingLength>());
    });
    test('should return Empty when no VehID is supplied', () {
      // arrange
      const str = '';
      final vehID = VehID(str).failureOrUnit.fold((l) => l, (r) => r);
      // assert
      expect(vehID, const matcher.TypeMatcher<Empty>());
    });
    test(
        'should return Invalid Values when the ASCII characters is beyond range',
        () {
      // arrange
      const str = 'W=12312';
      final vehID = VehID(str).failureOrUnit.fold((l) => l, (r) => r);
      // assert
      expect(vehID, const matcher.TypeMatcher<InvalidValue>());
    });
  });

// ANCHOR VehPlateID
  group('Vehicle Plate ID (VehPlateID): ', () {
    test('should return error when value is empty', () {
      const str = '';
      final vehplateID = VehPlateID(str).failureOrUnit.fold((l) => l, (r) => r);
      // assert
      expect(vehplateID, const matcher.TypeMatcher<Empty>());
    });
    test('should return error when value is greater than 10 characters', () {
      const str = '12345678901';
      final vehplateID = VehPlateID(str).failureOrUnit.fold((l) => l, (r) => r);
      // assert
      expect(vehplateID, const matcher.TypeMatcher<ExceedingLength>());
    });
    test('should create a VehPlateID when correct values are passed', () {
      const str = '1234567890';
      final vehplateID = VehPlateID(str).getValueOrError();
      // assert
      expect(vehplateID, str);
    });
  });

  // ANCHOR VINID
  group('VINID : ', () {
    test(
        'Carry out VIN validation. 17 character long. 12 to 17 must be numbers, no symbols. And letters I,O and Q are not allowed',
        () {
      // arrange
      const str = '1LNHL9DKXEG604241';
      final vinID = VinID(str);
      // assert
      expect(vinID.getValueOrError(), str);
    });

    test('should return Empty failure when empty VIN is supplied', () {
      // arrange
      final vinID = VinID('').failureOrUnit.fold((l) => l, (r) => r);
      // assert
      expect(vinID, const matcher.TypeMatcher<Empty>());
    });

    test(
        'should return InvalidVin failure when characters like I O and Q are supplied',
        () {
      // arrange
      const str = "1FDGI5GY4JEB75728";
      final vinID = VinID(str).failureOrUnit.fold((l) => l, (r) => r);

      // assert
      expect(vinID, const matcher.TypeMatcher<InvalidVIN>());
    });

    test(
        'should return InvalidVin failure when 12-17 characters are not numbers',
        () {
      // arrange
      const str = "1GGGD2718G118736A";
      final vinID = VinID(str).failureOrUnit.fold((l) => l, (r) => r);
      // assert
      expect(vinID, const matcher.TypeMatcher<InvalidVIN>());
    });

    test('should remove special characters when introduced', () {
      // arrange
      const str = "1GGG-D2718G1187367";
      final vinID = VinID(str).getValueOrError();
      // assert
      expect(vinID, '1GGGD2718G1187367');
    });
  });
// ANCHOR VehID9
  group('VinID9', () {
    test('should return error when value is empty', () {
      const str = '';
      final vehplateID = VinID9(str).failureOrUnit.fold((l) => l, (r) => r);
      // assert
      expect(vehplateID, const matcher.TypeMatcher<Empty>());
    });
    test('should return error when value is greater than 9 characters', () {
      const str = '1234556567890';
      final vinID9 = VinID9(str).failureOrUnit.fold((l) => l, (r) => r);
      // assert
      expect(vinID9, const matcher.TypeMatcher<InvalidVIN>());
    });
    test('should return error when invalid characters I, J, Q are passed', () {
      // arrange
      const str = '1HASIN2R6';
      final vinID9 = VinID9(str).failureOrUnit.fold((l) => l, (r) => r);
      // assert
      expect(vinID9, const matcher.TypeMatcher<InvalidVIN>());
    });
    test('should create a VinID9 when correct values are passed', () {
      // arrange
      const str = '1HA4ANAA6';
      final vinID9 = VinID9(str).getValueOrError();
      // assert
      expect(vinID9, str);
    });
  });
  //ANCHOR VehModelID
  group('VehModelID ', () {
    test('should return error when the value is empty', () {
      //arrange
      const str = '';
      final vehModelID = VehModelID(str).getValueOrError();
      expect(vehModelID, const matcher.TypeMatcher<Empty>());
    });

    test('should return the value of vehicle model ID when not empty', () {
      //arrange
      const str = 'Taruas';
      final vehModelID = VehModelID(str).getValueOrError();
      expect(vehModelID, str);
    });
  });

  //ANCHOR VehFuelType
  group('VehFuelType ', () {
    test('should return error when the value is less than 0', () {
      //arrange
      const integer = -1;
      final vehModelID = VehFuelType(integer).getValueOrError();
      expect(vehModelID, const matcher.TypeMatcher<InvalidRange>());
    });

    test('should return error when the value is greater than 255', () {
      //arrange
      const integer = 256;
      final vehModelID = VehFuelType(integer).getValueOrError();
      expect(vehModelID, const matcher.TypeMatcher<InvalidRange>());
    });

    test('should return the value of vehicle model ID for correct range', () {
      //arrange
      const integer = 255;
      final vehModelID = VehFuelType(integer).getValueOrError();
      expect(vehModelID, integer);
    });
  });

  //ANCHOR UOMFuel
  group('UOMFuel ', () {
    test('should return error when the value is less than 0', () {
      //arrange
      const integer = -1;
      final vehModelID = UOMFuel(integer).getValueOrError();
      expect(vehModelID, const matcher.TypeMatcher<InvalidRange>());
    });

    test('should return error when the value is greater than 255', () {
      //arrange
      const integer = 256;
      final vehModelID = UOMFuel(integer).getValueOrError();

      expect(vehModelID, const matcher.TypeMatcher<InvalidRange>());
    });

    // test('should return error when the value is 251,252,253 or 254', () {
    //   //arrange
    //   const integer = 251;

    //   final vehModelID = UOMFuel(integer).getValueOrError();
    //   expect(vehModelID, const matcher.TypeMatcher<InvalidUOM>());
    // });

    test('should return the value of vehicle model ID for correct range', () {
      //arrange
      const integer = 255;
      final vehModelID = UOMFuel(integer).getValueOrError();
      expect(vehModelID, integer);
    });
  });
  //ANCHOR VehFuelCapacity
  group('VehFuelCapacity ', () {
    test('should return error when the value is less than 0', () {
      //arrange
      const integer = -1099999;
      final vehModelID = VehFuelCapacity(integer).getValueOrError();
      expect(vehModelID, const matcher.TypeMatcher<InvalidDoubleRange>());
    });

    test('should return error when the value is greater than 999', () {
      //arrange
      const integer = 10002;
      final vehModelID = VehFuelCapacity(integer).getValueOrError();
      expect(vehModelID, const matcher.TypeMatcher<InvalidDoubleRange>());
    });

    test('should return the value of vehicle model ID for correct range', () {
      //arrange
      const integer = 999;
      final vehModelID = VehFuelCapacity(integer).getValueOrError();
      expect(vehModelID, integer);
    });
  });
}
