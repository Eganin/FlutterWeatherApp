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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: () {},
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
                      .fetchWeatherForecastWithCity(cityName: _cityName);
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
                    child: SpinKitDoubleBounce(
                      color: Colors.black,
                      size: 100,
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
