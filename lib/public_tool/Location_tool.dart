import 'package:flutter/services.dart';

class LocationService {
  static const platform = MethodChannel('samples.flutter.dev/location');

  Future<String> getLocation() async {
    try {
      final String location = await platform.invokeMethod('getLocation');
      return location;
    } on PlatformException catch (e) {
      return "Failed to get location: '${e.message}'.";
    }
  }
}