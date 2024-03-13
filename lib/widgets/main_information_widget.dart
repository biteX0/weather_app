import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_models.dart';
import 'package:weather_app/services/services.dart';

var dayInfo = DateTime.now();
var dateFormat = DateFormat('EEEE, d MMM, yyyy').format(dayInfo);

class MainInformation extends StatefulWidget {
  const MainInformation({Key? key}) : super(key: key);

  @override
  State<MainInformation> createState() => _MainInformationState();
}

class _MainInformationState extends State<MainInformation> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  WeatherDataCurrent? _response;

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 30)),
              if (_response != null)
                Column(
                  children: [
                    const SizedBox(height: 70,),
                    Text(
                      '${_response!.cityName} ',
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                      ),
                    ),
                    const SizedBox(height: 70,),
                    Text(
                      dateFormat,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255)
                            .withOpacity(0.8),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 70,),
                    
                    Text(
                      '${_response!.main.temp}°',
                      style: const TextStyle(
                          fontSize: 40,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    Text(
                      _response!.weatherInfo.description as String,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ],
                ),
              // Padding(
                // padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                // child: 
                Row(
                  children: [
                    SizedBox(
                      width: 150,
                      // width: MediaQuery.of(context).size.width,
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
                  
                                
                              // ),
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
