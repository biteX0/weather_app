import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_data.dart';
import 'package:weather_app/models/weather_models.dart';

class FetchWeatherApi {
  WeatherData? weatherData;

  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiUrl(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString));

    return weatherData!;
  }
}

String apiUrl(var lat, var lon) {
  String url;

  url =
      "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=37279a3be9eb5678a378e453112f694d&units=metric";
  return url;
}
