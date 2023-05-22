import 'package:flutter_dotenv/flutter_dotenv.dart';

String apiURL(var lat, var lon) {
  String url;
  print(dotenv.env['API_KEY']);
  url =
      "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=${dotenv.env['API_KEY']}&units=metric";
  return url;
}
