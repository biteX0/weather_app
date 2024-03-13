import 'package:weather_app/models/weather_models.dart';

class WeatherData {
  final WeatherDataCurrent? main;
  // final WeatherDataHourly? hourly;

  WeatherData([this.main, //this.hourly
  ]);

  // function to fetch these values
  WeatherDataCurrent getCurrentWeather() => main!;
  // WeatherDataHourly getHourlyWeather() => hourly!;
}
