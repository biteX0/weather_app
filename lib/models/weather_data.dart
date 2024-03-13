import 'package:weather_app/models/weather_models.dart';

class WeatherData {
  final WeatherDataCurrent? main;

  WeatherData([this.main]);

  WeatherDataCurrent getCurrentWeather() => main!;
}
