import 'package:flutter/material.dart';
import 'package:weather_full_app/models/weather_forecast_model.dart';
import 'package:weather_full_app/utils/forecast_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const DetailView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data.list;
    var pressure = forecastList[0].pressure * 0.750062;
    var humidity = forecastList[0].humidity;
    var wind = forecastList[0].speed;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Util.getItem(
              icon: FontAwesomeIcons.thermometerThreeQuarters,
              value: pressure.round(),
              units: 'mm Hg'),
          Util.getItem(
            icon: FontAwesomeIcons.cloudRain,
            value: humidity,
            units: '%',
          ),
          Util.getItem(
            icon: FontAwesomeIcons.wind,
            value: wind.toInt(),
            units: 'm/s',
          ),
        ],
      ),
    );
  }
}
