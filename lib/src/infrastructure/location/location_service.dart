import 'package:bluefang/src/domain/location/i_location_service.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import '../../domain/location/bf_location_data.dart';

@LazySingleton(as: ILocationService)
class LocationControls implements ILocationService {
  final Location _location;
  LocationControls(this._location);

  @override
  Future<BFLocationData> getCurrentLocation() async {
    bool serviceEnabled = await isServiceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
    }

    final BFPermissionStatus permissionGranted = await getPermissionStatus();
    if (permissionGranted == BFPermissionStatus.denied) {
      await _location.requestPermission();
    }

    final LocationData locationData = await _location.getLocation();

    final BFLocationData bfLocationData = BFLocationData(
        latitude: locationData.latitude ?? 0.0,
        longitude: locationData.longitude ?? 0.0);
    return bfLocationData;
  }

  @override
  Future<bool> requestService() async {
    final bool isActivated = await _location.requestService();
    return isActivated;
  }

  @override
  Future<bool> isServiceEnabled() async {
    return _location.serviceEnabled();
  }

  @override
  Future<BFPermissionStatus> getPermissionStatus() async {
    final PermissionStatus permissionStatus = await _location.hasPermission();
    switch (permissionStatus) {
      case PermissionStatus.granted:
        return BFPermissionStatus.granted;

      case PermissionStatus.grantedLimited:
        return BFPermissionStatus.grantedLimited;
      case PermissionStatus.denied:
        return BFPermissionStatus.denied;
      case PermissionStatus.deniedForever:
        return BFPermissionStatus.deniedForever;
    }
  }
}
