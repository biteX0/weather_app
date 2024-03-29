import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_models.dart';
import 'package:weather_app/ui/constants.dart';

class DataService {
  Future<WeatherDataCurrent> getWeather(String cityName) async {
    final queryParametrs = {
      'q': cityName,
      'appid': apiKey,
      'units': 'metric',
      'lang': langRu
    };

    final uri = Uri.https(
      'api.openweathermap.org', '/data/2.5/weather', queryParametrs);
      final response = await http.get(uri);

      // print(response.body);
      final json = jsonDecode(response.body);
      return WeatherDataCurrent.fromJson(json);
  }
}