import 'package:flutter/material.dart';
import 'package:weather_full_app/models/weather_forecast_model.dart';
import 'package:weather_full_app/utils/forecast_util.dart';

// ignore: non_constant_identifier_names
Widget ForecastCard({AsyncSnapshot snapshot, int index}) {
  List<WeatherList> forecastList = snapshot.data.list;
  var dayOfWeek = '';
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullData = Util.getFormattedDate(dateTime: date);
  dayOfWeek = fullData.split(',')[0];
  var temperatureMin = forecastList[index].temp.max.toStringAsFixed(0);
  var icon = forecastList[index].getIconUrl();
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            dayOfWeek,
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      '$temperatureMin C',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Image.network(
                    icon,
                    scale: 1.2,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
