import 'package:geolocator/geolocator.dart' as geo;

class Location {
  double latitude;
  double longitude;

  Future<geo.Position> getlocation() async {
    try {
      geo.Position position = await geo.Geolocator()
          .getCurrentPosition(desiredAccuracy: geo.LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      return position;
    } catch (e) {
      print(e);
    }
  }
}
