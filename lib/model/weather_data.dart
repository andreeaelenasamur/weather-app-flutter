import 'package:weather_app_flutter/model/weather_data_all.dart';
import 'package:weather_app_flutter/model/weather_data_hourly.dart';

class WeatherData {
  final WeatherDataAll? weather;
  final WeatherDataHourly? weatherDataHourly;

  WeatherData([this.weather, this.weatherDataHourly]);

  // function to fetch these values
  WeatherDataAll getCurrentWeather() => weather!;
  WeatherDataHourly getHourlyWeather() => weatherDataHourly!;
}
