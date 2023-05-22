import 'package:weather_app_flutter/model/weather_data_all.dart';

class WeatherData {
  final WeatherDataAll? weather;
  // final WeatherDataAll? weather;

  WeatherData([this.weather]);

  // function to fetch these values
  WeatherDataAll getCurrentWeather() => weather!;
  // WeatherDataAll getCurrentWeather() => weather!;
}
