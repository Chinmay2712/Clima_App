
import 'package:flutter/material.dart';
import 'package:clima_app/services/weather.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude; // Store latitude
  double? longitude; // Store longitude

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {

    var weatherData = await WeatherModel().getLocationWeather();
    // Check for permissions
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ), // Display some UI while fetching location
      ),
    );
  }
}
