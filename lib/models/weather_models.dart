class WeatherInfo {
  final String description;
  final String icon;

  WeatherInfo({required this.description, required this.icon});
  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}

class Main {
  final num? temp;
  final num? feelsLike;
  final int? humidity;
  final int? pressure;

  Main(
      {required this.feelsLike,
      required this.humidity,
      required this.pressure,
      required this.temp});

  factory Main.fromJson(Map<String, dynamic> json) {
    final temp = (json['temp']as num?)?.toInt();
    final feelsLike = (json['feels_like']as num?)?.toDouble();
    final humidity = json['humidity'];
    final pressure = json['pressure'];
    return Main(
        temp: temp,
        feelsLike: feelsLike,
        humidity: humidity,
        pressure: pressure);
  }
}

class Wind {
  final num? speed;

  Wind({required this.speed});

  factory Wind.fromJson(Map<String, dynamic> json) {
    final speed = (json['speed']as num?)?.toDouble();
    return Wind(speed: speed);
  }
}

class CloudsAll {
  final num? cloudsAll;

  CloudsAll({required this.cloudsAll});

  factory CloudsAll.fromJson(Map<String, dynamic> json) {
    final cloudsAll = (json['all']as num?)?.toDouble();
    return CloudsAll(cloudsAll: cloudsAll);
  }
}

class WeatherDataCurrent {
  final Main main;
  final WeatherInfo weatherInfo;
  final Wind windSpeed;
  final String cityName;
  final CloudsAll clouds;

  String get iconUrl {
    return 'http://openweathermap.org/img/wn/${weatherInfo.icon}@4x.png';
  }

  WeatherDataCurrent(
      {required this.main, 
      required this.weatherInfo, 
      required this.windSpeed, 
      required this.cityName, 
      required this.clouds, 
      });

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) {
    final mainJson = json['main'];
    final main = Main.fromJson(mainJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    final windJson = json['wind'];
    final windSpeed = Wind.fromJson(windJson);

    final cityName = json['name'];

    final cloudsJson = json['clouds'];
    final clouds = CloudsAll.fromJson(cloudsJson);

    return WeatherDataCurrent(
        main: main, 
        weatherInfo: weatherInfo, 
        windSpeed: windSpeed, 
        cityName: cityName, 
        clouds: clouds);
  }
}