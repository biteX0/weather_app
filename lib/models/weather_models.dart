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
// class WeatherDataCurrent {
//   final Main main;
//   WeatherDataCurrent({required this.main});

//   factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
//       WeatherDataCurrent(main: Main.fromJson(json['main']));
// }

// class Main {
//   int? temp;
//   int? humidity;
//   int? pressure;
//   double? feelsLike;
//   List<Weather>? weather;
//   List<Wind>? wind;

//   Main({
//     this.temp,
//     this.humidity,
//     this.feelsLike,
//     this.pressure,
//     this.weather,
//     this.wind,
//   });

// factory Main.fromJson(Map<String, dynamic> json) => Main(
//         temp: (json['temp'] as num?)?.round(),
//         feelsLike: (json['feels_like'] as num?)?.toDouble(),
//         humidity: json['humidity'] as int?,
//         pressure: json['pressure'] as int?,
//         weather: (json['weather'] as List<dynamic>?)
//             ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
//             .toList(),
//         wind: (json['wind'] as List<dynamic>?)
//             ?.map((e) => Wind.fromJson(e as Map<String, dynamic>))
//             .toList(),
//       );

//   Map<String, dynamic> toJson() => {
//         'temp': temp,
//         'feels_like': feelsLike,
//         'humidity': humidity,
//         'pressure': pressure,
//         'weather': weather?.map((e) => e.toJson()).toList(),
//         'wind': weather?.map((e) => e.toJson()).toList(),
//       };
// }

// class Weather {
//   int? id;
//   String? main;
//   String? description;
//   String? icon;

//   Weather({this.id, this.main, this.description, this.icon});

//   factory Weather.fromJson(Map<String, dynamic> json) => Weather(
//         id: json['id'] as int?,
//         main: json['main'] as String?,
//         description: json['description'] as String?,
//         icon: json['icon'] as String?,
//       );

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'main': main,
//         'description': description,
//         'icon': icon,
//       };
// }

// class Wind {
//     double? speed;
//     int? deg;
//     double? gust;

//     Wind({this.speed, this.deg, this.gust}); 

//     factory Wind.fromJson(Map<String, dynamic> json) => Wind(
//         speed: json['speed'],
//         deg: json['deg'],
//         gust: json['gust'],
//       );

//   Map<String, dynamic> toJson() => {
//         'speed': speed,
//         'deg': deg,
//         'gust': gust,
//       };
// }


// class WeatherInfo {
//   final String description;
//   final String icon;

//   WeatherInfo({required this.description, required this.icon});
//   factory WeatherInfo.fromJson(Map<String, dynamic> json) {
//     final description = json['description'];
//     final icon = json['icon'];
//     return WeatherInfo(description: description, icon: icon);
//   }
// }

// class TemperatureInfo {
//   final double temperature;

//   TemperatureInfo({required this.temperature});

//   factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
//     final temperature = json['temp'];
//     return TemperatureInfo(temperature: temperature);
//   }
// }

// class WeatherResponse {
//   final String cityName;
//   final TemperatureInfo tempInfo;
//   final WeatherInfo weatherInfo;

//   String get iconUrl{
//     return 'http://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
//   }

//   WeatherResponse(
//       {required this.cityName,
//       required this.tempInfo,
//       required this.weatherInfo});

//   factory WeatherResponse.fromJson(Map<String, dynamic> json) {
//     final cityName = json['name'];

//     final tempInfoJson = json['main'];
//     final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

//     final weatherInfoJson = json['weather'][0];
//     final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

//     return WeatherResponse(
//         cityName: cityName, tempInfo: tempInfo, weatherInfo: weatherInfo);
//   }
// }
