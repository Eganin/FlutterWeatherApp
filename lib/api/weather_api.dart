import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';
import 'package:weather_full_app/models/weather_forecast_model.dart';
import 'package:weather_full_app/utils/constants.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecastWithCity(
      {String cityName}) async {
    var queryParameters = {
      'APPID': Constants.WEATHER_APP_ID,
      'units': 'metric',
      'q': cityName,
    };

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, queryParameters);

    log('Request : ${uri.toString()}');

    var response = await get(uri);

    log(response.body);

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error response from api');
    }
  }
}
