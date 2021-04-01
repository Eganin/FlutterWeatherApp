import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_full_app/api/weather_api.dart';
import 'package:weather_full_app/models/weather_forecast_model.dart';
import 'package:weather_full_app/screens/city_screen.dart';
import 'package:weather_full_app/widgets/bottom_list_view.dart';
import 'package:weather_full_app/widgets/city_view.dart';
import 'package:weather_full_app/widgets/detail_view.dart';
import 'package:weather_full_app/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  final WeatherForecast locationWeather;

  WeatherForecastScreen({this.locationWeather});

  @override
  State<StatefulWidget> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  Future<WeatherForecast> forecastObject;
  String _cityName;

  @override
  void initState() {
    if (widget.locationWeather != null) {
      forecastObject = Future.value(widget.locationWeather);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        centerTitle: true,
        backgroundColor: Colors.black,
        // убирает переход на прошдую страницу
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast();
            });
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_city),
            onPressed: () async {
              String selectedCity =
                  await Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return CityScreen();
                },
              ));
              if (selectedCity != null) {
                setState(() {
                  _cityName = selectedCity;
                  forecastObject = WeatherApi()
                      .fetchWeatherForecast(cityName: _cityName, isCity: true);
                });
              }
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: FutureBuilder<WeatherForecast>(
              future: forecastObject,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      _Size(),
                      CityView(
                        snapshot: snapshot,
                      ),
                      _Size(),
                      TempView(
                        snapshot: snapshot,
                      ),
                      _Size(),
                      DetailView(
                        snapshot: snapshot,
                      ),
                      _Size(),
                      BottomListView(
                        snapshot: snapshot,
                      ),
                    ],
                  );
                } else {
                  return Center(
                    // new loader from library
                    child: Text(
                      'City not found\n Please enter correct city',
                      style: TextStyle(fontSize: 26),
                      textAlign: TextAlign.center,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget _Size() => SizedBox(
      height: 50,
    );
