import 'dart:convert';
import 'package:weather_app_flutter/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_flutter/model/weather_data_all.dart';
import 'package:weather_app_flutter/utils/api_url.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;

  // processing the data from response -> to json
  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(WeatherDataAll.fromJson(jsonString));

    return weatherData!;
  }
}
