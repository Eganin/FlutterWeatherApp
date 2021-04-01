import 'package:flutter/material.dart';
import 'package:weather_full_app/models/weather_forecast_model.dart';

import 'forecast_card.dart';

class BottomListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const BottomListView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '7-Day Weather Forecast'.toUpperCase(),
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 140,
          padding: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context , index) => SizedBox(width : 8),
            itemCount: snapshot.data.list.length,
            itemBuilder: (context , index){
              return Container(
                // делавем ширину 2.7 от экрана по горизонтали
                width: MediaQuery.of(context).size.width / 2.7,
                height: 160,
                color: Colors.black87,
                child: ForecastCard(snapshot : snapshot , index : index),
              );
            },
          ),
        ),
      ],
    );
  }
}
