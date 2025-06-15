import 'package:location/location.dart';

class LocationService {
  static final LocationService _instance = LocationService._internal();
  factory LocationService() => _instance;

  LocationService._internal();

  final Location _location = Location();
  LocationData? _cachedLocation;

  Future<LocationData> getLocation() async {
    if (_cachedLocation != null) return _cachedLocation!;

    bool serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) throw Exception('Location services are disabled.');
    }

    PermissionStatus permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        throw Exception('Location permissions are denied.');
      }
    }

    _cachedLocation = await _location.getLocation();
    return _cachedLocation!;
  }
}
