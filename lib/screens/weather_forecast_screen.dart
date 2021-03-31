import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_full_app/api/weather_api.dart';
import 'package:weather_full_app/models/weather_forecast_model.dart';

class WeatherForecastScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  Future<WeatherForecast> forecastObject;
  String _cityName = 'London';

  @override
  void initState() {
    forecastObject =
        WeatherApi().fetchWeatherForecastWithCity(cityName: _cityName);

    forecastObject.then((value) {
      print(value.list[0].weather[0].main);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        centerTitle: true,
      ),
    );
  }
}
