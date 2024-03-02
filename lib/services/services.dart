import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_response.dart';
import 'package:weather_app/ui/constants.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    final queryParametrs = {
      'q': city,
      'appid': apiKey,
      'units': 'metric'
    };

    final uri = Uri.https(
      'api.openweathermap.org', '/data/2.5/weather', queryParametrs);
      final response = await http.get(uri);

      // print(response.body);
      final json = jsonDecode(response.body);
      return WeatherResponse.fromJson(json);
  }
}