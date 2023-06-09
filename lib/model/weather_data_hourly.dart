class DataWeather {
  final int? temperature;
  final String? weatherIcon;
  final int? dt;

  DataWeather({
    required this.temperature,
    required this.weatherIcon,
    required this.dt,
  });
}

class WeatherDataHourly {
  final List<DataWeather> weatherList;

  WeatherDataHourly({required this.weatherList});

  factory WeatherDataHourly.fromJson(Map<String, dynamic> json) {
    final weatherDataList = List<Map<String, dynamic>>.from(
      json['list'] as List<dynamic>,
    );

    final List<DataWeather> weatherList = weatherDataList.map((weatherJson) {
      final main = weatherJson['main'] as Map<String, dynamic>;
      final dt = weatherJson['dt'] as int?;
      final weather = weatherJson['weather'][0] as Map<String, dynamic>;
      final temperature = (main['temp'] as num?)?.round();
      final weatherIcon = weather['icon'] as String;

      return DataWeather(
        temperature: temperature,
        weatherIcon: weatherIcon,
        dt: dt,
      );
    }).toList();

    return WeatherDataHourly(weatherList: weatherList);
  }
}
