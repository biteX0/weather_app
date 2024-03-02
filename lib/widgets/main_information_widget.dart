import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_response.dart';
import 'package:weather_app/services/services.dart';

var dayInfo = DateTime.now();
var dateFormat = DateFormat('EEEE, d MMM, yyyy').format(dayInfo);

class MainInformation extends StatefulWidget {
  const MainInformation({super.key});

  @override
  State<MainInformation> createState() => _MainInformationState();
}

class _MainInformationState extends State<MainInformation> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  WeatherResponse? _response;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 30,),
              if (_response != null)
                Column(
                  children: [
                    const Center(
                        child: Padding(padding: EdgeInsets.only(top: 70))),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    Text(
                      dateFormat,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255)
                            .withOpacity(0.8),
                        fontSize: 12,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 70)),
                    
                    Text(
                      '${_response!.tempInfo.temperature}°',
                      style: const TextStyle(
                          fontSize: 40,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    Image.network(_response!.iconUrl),
                    Text(
                      _response!.weatherInfo.description,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ],
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255)),
                        autofocus: true,
                    controller: _cityTextController,
                    decoration: const InputDecoration(
                        labelText: 'City',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                        fillColor: Color.fromARGB(255, 255, 255, 255)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 255, 255, 255))),
                  onPressed: _search,
                  child: const Text(
                    'Search',
                    style: TextStyle(color: Color.fromARGB(255, 37, 70, 141)),
                  )),
            ],
          ),
        ),
      ),
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
