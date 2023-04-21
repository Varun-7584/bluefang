import 'package:bluefang/src/domain/location/bf_location_data.dart';

abstract class ILocationService {
  Future<BFLocationData> getCurrentLocation();
  Future<bool> requestService();
  Future<bool> isServiceEnabled();
  Future<BFPermissionStatus> getPermissionStatus();
}
