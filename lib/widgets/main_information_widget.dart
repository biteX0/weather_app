import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/services/get_location.dart';
import 'package:weather_app/services/services.dart';

var dayInfo = DateTime.now();
var dateFormat = DateFormat('EEEE, d MMM, yyyy').format(dayInfo);

class MainInformation extends StatefulWidget {
  const MainInformation({Key? key}) : super(key: key);

  @override
  State<MainInformation> createState() => _MainInformationState();
}

class _MainInformationState extends State<MainInformation> {
  var client = WeatherData();

  var data;

  info() async {
    var position = await GetPosition();
    data = await client.getData(position.latitude, position.longitude);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [ FutureBuilder(
        future: info(),
        builder: ((context, snapshot) {
          return Column(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.6,
                // padding: const EdgeInsets.only(top: 30),
                margin: const EdgeInsets.only(right: 10, left: 10, top: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(22, 49, 32, 32),
                      Color.fromARGB(100, 82, 79, 28),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0.2, 0.85],
                  ),
                ),
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 42)),
                    Text(
                        '${data?.cityName}',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 25,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      Text(
                        dateFormat,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
      ],
    );
  }
}
