import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_city.dart';
import 'package:weather_app/services/get_location.dart';
import 'package:weather_app/ui/constants.dart';

class GeolocationPage extends StatefulWidget {
  const GeolocationPage({super.key});

  @override
  State<GeolocationPage> createState() => _GeolocationPageState();
}

class _GeolocationPageState extends State<GeolocationPage> {
  final _weatherService = WeatherService(apiKey);
  WeatherCityName? _weatherCityName;

 
  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Text(_weatherCityName?.cityName ?? 'loading failed'),
            ],
          ),
        ),
    );
  }

   _fetchWeather() async {
    String? cityName = await _weatherService.getCurrentCity();
    
    try {
      final weatherCityName = await _weatherService.getWeather(cityName!);
      setState(() {
        _weatherCityName = weatherCityName;
      });
    }
    catch (dataError) {
      debugPrint('error: $dataError');
    }
  }
}