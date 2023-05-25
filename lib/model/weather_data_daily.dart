class DataWeather {
  final int? temperature;
  final int? tempMin;
  final int? tempMax;
  final String? weatherIcon;
  final int? dt;
  final String dt_txt;

  DataWeather({
    required this.temperature,
    required this.tempMax,
    required this.tempMin,
    required this.weatherIcon,
    required this.dt,
    required this.dt_txt,
  });
}

class WeatherDataDaily {
  final List<DataWeather> weatherList;

  WeatherDataDaily({required this.weatherList});

  factory WeatherDataDaily.fromJson(Map<String, dynamic> json) {
    final weatherDataList = List<Map<String, dynamic>>.from(
      json['list'] as List<dynamic>,
    );

    final List<DataWeather> weatherList = weatherDataList
        .map((weatherJson) {
          final main = weatherJson['main'] as Map<String, dynamic>;
          final dt = weatherJson['dt'] as int?;
          final weather = weatherJson['weather'][0] as Map<String, dynamic>;
          final temperature = (main['temp'] as num?)?.round();
          final tempMin = (main['temp_min'] as num?)?.round();
          final tempMax = (main['temp_max'] as num?)?.round();
          final weatherIcon = weather['icon'] as String;
          final dt_txt = weatherJson['dt_txt'] as String;

          return DataWeather(
            temperature: temperature,
            tempMax: tempMax,
            tempMin: tempMin,
            weatherIcon: weatherIcon,
            dt: dt,
            dt_txt: dt_txt,
          );
        })
        .where((element) => DateTime.parse(element.dt_txt).hour == 12)
        .toList();

    return WeatherDataDaily(weatherList: weatherList);
  }
}
