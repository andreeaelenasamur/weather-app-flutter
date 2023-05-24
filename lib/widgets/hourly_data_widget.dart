import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_flutter/controller/global_controller.dart';
import 'package:weather_app_flutter/model/weather_data_hourly.dart';
import 'package:weather_app_flutter/utils/custom_colors.dart';

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  HourlyDataWidget({Key? key, required this.weatherDataHourly})
      : super(key: key);

  // card index
  RxInt cardIndex = GlobalController().getIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          alignment: Alignment.topCenter,
          child: const Text("Today", style: TextStyle(fontSize: 18)),
        ),
        hourlyList(),
      ],
    );
  }

  Widget hourlyList() {
    return Container(
      height: 160,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataHourly.weatherList.length > 12
            ? 15
            : weatherDataHourly.weatherList.length,
        itemBuilder: (context, index) {
          return Obx(
            (() => GestureDetector(
                  onTap: () {
                    cardIndex.value = index;
                  },
                  child: Container(
                    width: 90,
                    margin: const EdgeInsets.only(left: 20, right: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0.5, 0),
                              blurRadius: 30,
                              spreadRadius: 1,
                              color: CustomColors.dividerLine.withAlpha(150))
                        ],
                        gradient: cardIndex.value == index
                            ? const LinearGradient(colors: [
                                CustomColors.firstGradientColor,
                                CustomColors.secondGradientColor
                              ])
                            : null),
                    child: HourlyDetails(
                      index: index,
                      cardIndex: cardIndex.toInt(),
                      temp: weatherDataHourly.weatherList[index].temperature!,
                      timeStamp: weatherDataHourly.weatherList[index].dt!,
                      weatherIcon:
                          weatherDataHourly.weatherList[index].weatherIcon!,
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}

// hourly details class
class HourlyDetails extends StatelessWidget {
  int temp;
  int index;
  int cardIndex;
  int timeStamp;
  String weatherIcon;

  HourlyDetails(
      {Key? key,
      required this.index,
      required this.cardIndex,
      required this.timeStamp,
      required this.temp,
      required this.weatherIcon})
      : super(key: key);

  String getTime(final timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 250);
    String x = DateFormat('jm').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            getTime(timeStamp),
            style: TextStyle(
                color: cardIndex == index
                    ? Colors.white
                    : CustomColors.textColorBlack),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: Image.asset(
            "assets/weather/$weatherIcon.png",
            height: 40,
            width: 40,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            "$tempº",
            style: TextStyle(
                color: cardIndex == index
                    ? Colors.white
                    : CustomColors.textColorBlack),
          ),
        )
      ],
    );
  }
}
