import 'package:geolocator/geolocator.dart';

class Location {
  static Future<Position> getUserLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
      }
      throw Exception('Location permissions not granted');
    } catch (e) {
      throw Exception('Failed to fetch location');
    }
  }
}
