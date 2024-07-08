
import 'package:location/location.dart';

class LocationSerice {
  static final _location = Location();
  static bool _sericeEnabled = false;
  static PermissionStatus _permissionStatus = PermissionStatus.denied;

  static LocationData? currentLocation;

  static Future<void> init() async {
    await checkserice();
    if (_sericeEnabled) {
      checkPermission();
    }
  }

//=============joylashuv olish xizmati

  static Future<void> checkserice() async {
    _sericeEnabled = await _location.serviceEnabled();

    if (!_sericeEnabled) {
      _sericeEnabled = await _location.requestService();
      if (!_sericeEnabled) {
        return;
      }
    }
  }

  static Future<void> checkPermission() async {
    _permissionStatus = await _location.hasPermission();
    if (_permissionStatus == PermissionStatus.denied) {
      _permissionStatus = await _location.requestPermission();
      if (_permissionStatus != PermissionStatus.granted) {
        return;
      }
    }
  }

  static Future<void> fetchCurruntLocation() async {
    currentLocation = await _location.getLocation();
  }

  static Stream<LocationData> fetchLiveLocation() async* {
    yield* _location.onLocationChanged;
  }
}

