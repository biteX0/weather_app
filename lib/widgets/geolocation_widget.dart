import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_response.dart';
import 'package:weather_app/services/get_location.dart';
import 'package:weather_app/ui/constants.dart';

class GeolocationPage extends StatefulWidget {
  const GeolocationPage({super.key});

  @override
  State<GeolocationPage> createState() => _GeolocationPageState();
}

class _GeolocationPageState extends State<GeolocationPage> {
  final _weatherService = WeatherService(apiKey);
  WeatherResponse? _response;

 
  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Text(_response!.cityName),
          ],
        ),
    );
  }

   _fetchWeather()async {
    String? cityName = await _weatherService.getCurrentCity();
    
    try {
      final response = await _weatherService.getWeather(cityName!);
      setState(() {
        _response = response;
      });
    }
    catch (dataError) {
      debugPrint(dataError as String?);
    }
  }

}