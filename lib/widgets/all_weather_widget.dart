import 'package:flutter/material.dart';
import 'package:weather_app_flutter/model/weather_data_all.dart';
import 'package:weather_app_flutter/utils/custom_colors.dart';

class AllWeatherWidget extends StatelessWidget {
  final WeatherDataAll weatherDataAll;

  const AllWeatherWidget({Key? key, required this.weatherDataAll})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final List<Weather> weatherList = weatherDataAll.list![0];
    // final Weather weatherData = weatherList[0];
    // final String? description = weatherData.description;
    // final int? id = weatherData.id;
    // final String? main = weatherData.main;
    // final String? icon = weatherData.icon;
    return Column(
      // Text('$description ${weatherDataCurrent.current.humidity}')
      children: [
        // temperature area
        temperaturAreaWidget(),

        const SizedBox(
          height: 20,
        ),
        // more details - windspeed, humidity, clouds
        currentWeatherMoreDetailsWidget(),
      ],
    );
  }

  Widget currentWeatherMoreDetailsWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: CustomColors.cardColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset("assets/icons/windspeed.png"),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: CustomColors.cardColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset("assets/icons/clouds.png"),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: CustomColors.cardColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset("assets/icons/humidity.png"),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SizedBox(
            height: 20,
            width: 60,
            child: Text(
              "${weatherDataAll.weatherList[0].windSpeed}km/h",
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
            width: 60,
            child: Text(
              "${weatherDataAll.weatherList[0].allClouds}%",
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
            width: 60,
            child: Text(
              "${weatherDataAll.weatherList[0].humidity}%",
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          )
        ]),
      ],
    );
  }

  Widget temperaturAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/weather/${weatherDataAll.weatherList[0].weatherIcon}.png",
          height: 80,
          width: 80,
        ),
        Container(
          height: 50,
          width: 1,
          color: CustomColors.dividerLine,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "${weatherDataAll.weatherList[0].temperature}º",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 68,
                color: CustomColors.textColorBlack,
              )),
          TextSpan(
              text: weatherDataAll.weatherList[0].weatherMain,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.grey,
              ))
        ]))
      ],
    );
  }
}
