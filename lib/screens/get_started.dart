import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_models.dart';
import 'package:weather_app/screens/home_page.dart';
import 'package:weather_app/services/services.dart';
import 'package:weather_app/ui/constants.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
    final _cityTextController = TextEditingController();
    final _dataService = DataService();
      WeatherResponse? _response;

  // @override
  // void initState() {
  //   Future.delayed(const Duration(seconds: 3)).then((value) => Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => const HomePage())));
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.transparent,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image.asset('assets/start.png'),
            if (_response != null)
                Column(
                  children: [
                    Image.network(_response!.iconUrl),
                    Text(
                      '${_response!.tempInfo.temperature}°',
                      style: const TextStyle(fontSize: 40),
                    ),
                    Text(_response!.weatherInfo.description)
                  ],
                ),
              Padding(
                padding: const EdgeInsets.only(top: 500),
                child:
                 SizedBox(
                  width: 150,
                  child: TextField(
                      controller: _cityTextController,
                      decoration: const InputDecoration(labelText: 'City'),
                      textAlign: TextAlign.center),
                ),
              ),
              ElevatedButton(onPressed: _search, child: const Text('Search'))
            ],
          ),
          
        )),
      
    );
  }
    void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    // print(response.cityName);
    // print(response.tempInfo.temperature);
    // print(response.weatherInfo.description);
    setState(() => _response = response);
  }
}
