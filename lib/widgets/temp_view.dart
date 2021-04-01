import 'package:flutter/material.dart';
import 'package:weather_full_app/models/weather_forecast_model.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const TempView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data.list;
    var icon = forecastList[0].getIconUrl();
    var temperature = forecastList[0].temp.day.toStringAsFixed(0);
    var description = forecastList[0].weather[0].description.toUpperCase();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          icon,
          scale: 0.4,
          color: Colors.black,
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          children: [
            Text(
              '$temperature C',
              style: TextStyle(fontSize: 54, color: Colors.black),
            ),
            Text(
              description,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
