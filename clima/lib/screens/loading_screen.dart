// ignore_for_file: avoid_print, unused_local_variable, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //Start point
  @override
  void initState() {
    super.initState();
    getLocationData();
    print("initstate called!...");
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

//end Point
  @override
  void deactivate() {
    super.deactivate();
    print("deactivate called!...");
  }

  @override
  Widget build(BuildContext context) {
    print("Bulid Called..");

    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
