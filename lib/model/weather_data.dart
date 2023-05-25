import 'package:weather_app_flutter/model/weather_data_all.dart';
import 'package:weather_app_flutter/model/weather_data_daily.dart';
import 'package:weather_app_flutter/model/weather_data_hourly.dart';

class WeatherData {
  final WeatherDataAll? weather;
  final WeatherDataHourly? weatherDataHourly;
  final WeatherDataDaily? weatherDataDaily;

  WeatherData([this.weather, this.weatherDataHourly, this.weatherDataDaily]);

  // function to fetch these values
  WeatherDataAll getCurrentWeather() => weather!;
  WeatherDataHourly getHourlyWeather() => weatherDataHourly!;
  WeatherDataDaily getDailyWeather() => weatherDataDaily!;
}
