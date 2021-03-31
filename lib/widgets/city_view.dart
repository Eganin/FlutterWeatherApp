import 'package:flutter/material.dart';
import 'package:weather_full_app/models/weather_forecast_model.dart';
import 'package:weather_full_app/utils/forecast_util.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const CityView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data.list;
    var city = snapshot.data.city.name;
    var country = snapshot.data.city.country;
    var formattedDate =
        DateTime.fromMicrosecondsSinceEpoch(forecastList[0].dt * 1000);

    return Container(
      child: Column(
        children: [
          Text(
            '$city, $country',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 27,
              color: Colors.black,
            ),
          ),
          Text(
            '${Util.getFormattedDate(dateTime: formattedDate)}',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
