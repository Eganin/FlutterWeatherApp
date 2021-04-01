import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_full_app/api/weather_api.dart';
import 'package:weather_full_app/models/weather_forecast_model.dart';
import 'package:weather_full_app/screens/weather_forecast_screen.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  void getLocationData() async {
    WeatherForecast weatherInfo = await WeatherApi().fetchWeatherForecast();

    if (weatherInfo == null) {
      print('WeatherInfo was null: $weatherInfo');
      return;
    }

    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return WeatherForecastScreen(
          locationWeather: weatherInfo,
        );
      },
    ));
  }

  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.black87,
          size: 100,
        ),
      ),
    );
  }
}
