import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {

  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.low,
    distanceFilter: 100,
  );

  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    // Check for permissions
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      print('Location permissions are permanently denied.');
      return; // Exit the function if permission is denied
    }

    try {
      // Get the current position
      Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);
      latitude = position.latitude;
      longitude = position.longitude;// Print the position
    } catch (e) {
      print('Error getting location: $e'); // Handle errors
    }
  }
}