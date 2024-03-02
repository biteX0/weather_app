class WeatherCityName {
  final String cityName;

  WeatherCityName({required this.cityName});

  factory WeatherCityName.fromJson(Map<String, dynamic> json) {
    return WeatherCityName(cityName: json['name']);
  }
}
