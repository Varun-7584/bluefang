import 'package:bluefang/src/infrastructure/vehicle/vehicle_dtos.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('To Domain:', () {
    test('should fail when incorrect data is passed', () {
      const int unixDate = 1629237681;
      const VehicleDto vehicleDto = VehicleDto(
          vehId: '1234',
          vehPlateId: 'vehPlateID',
          vinId: 'vinID',
          siteId: 0,
          dtId: 123456789,
          userIdMod: 1234,
          dateTimeMod: unixDate,
          userIdRep: 1234,
          dateTimeRep: unixDate);

      expect(vehicleDto.toDomain().dateTimeMod.getOrCrash(), unixDate);
      expect(vehicleDto.toDomain().dateTimeRep.getOrCrash(), unixDate);
    });
  });
}
