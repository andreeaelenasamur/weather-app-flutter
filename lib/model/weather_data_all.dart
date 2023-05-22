// instance for getting the api response
class DataWeather {
  final int? temperature;
  final int? humidity;
  final String? weatherDescription;
  final String? weatherIcon;
  final String? weatherMain;
  final int? allClouds;
  final double? windSpeed;

  DataWeather({
    required this.temperature,
    required this.humidity,
    required this.weatherDescription,
    required this.weatherIcon,
    required this.weatherMain,
    required this.allClouds,
    required this.windSpeed,
  });
}

class WeatherDataAll {
  final List<DataWeather> weatherList;

  WeatherDataAll({required this.weatherList});

  factory WeatherDataAll.fromJson(Map<String, dynamic> json) {
    final weatherDataList = List<Map<String, dynamic>>.from(
      json['list'] as List<dynamic>,
    );

    final List<DataWeather> weatherList = weatherDataList.map((weatherJson) {
      final main = weatherJson['main'] as Map<String, dynamic>;
      final weather = weatherJson['weather'][0] as Map<String, dynamic>;
      final clouds = weatherJson['clouds'] as Map<String, dynamic>;
      final wind = weatherJson['wind'] as Map<String, dynamic>;
      final temperature = (main['temp'] as num?)?.round();
      final humidity = (main['humidity'] as num?)?.round();
      final weatherDescription = weather['description'] as String;
      final weatherIcon = weather['icon'] as String;
      final weatherMain = weather['main'] as String;
      final allClouds = clouds['all'] as int;
      final windSpeed = (wind['speed'] as num?)?.toDouble();

      return DataWeather(
          temperature: temperature,
          humidity: humidity,
          weatherDescription: weatherDescription,
          weatherIcon: weatherIcon,
          weatherMain: weatherMain,
          windSpeed: windSpeed,
          allClouds: allClouds);
    }).toList();

    return WeatherDataAll(weatherList: weatherList);
  }
}
