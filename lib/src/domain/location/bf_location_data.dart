class BFLocationData {
  final double latitude;
  final double longitude;

  BFLocationData({required this.latitude, required this.longitude});

  @override
  String toString() {
    return "Latitude: $latitude , Longitude: $longitude";
  }
}

// Status of a permission request to use location services.
enum BFPermissionStatus {
  /// The permission to use location services has been granted for high accuracy.
  granted,

  /// The permission has been granted but for low accuracy. Only valid on iOS 14+.
  grantedLimited,

  /// The permission to use location services has been denied by the user. May
  /// have been denied forever on iOS.
  denied,

  /// The permission to use location services has been denied forever by the
  /// user. No dialog will be displayed on permission request.
  deniedForever
}
