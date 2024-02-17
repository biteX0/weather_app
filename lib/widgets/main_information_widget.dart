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
    return Scaffold(
      body: FutureBuilder(
        future: info(),
        builder: ((context, snapshot) {
          return Column(
            children: [
              SafeArea(
                child: 
                Container(
                  width: MediaQuery.sizeOf(context).width * 1,
                  height: MediaQuery.sizeOf(context).height * 0.6,
                  padding: const EdgeInsets.only(top: 30),
                  margin: const EdgeInsets.only(right: 10, left: 10),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(32),
                  //   gradient: const LinearGradient(
                  //     colors: [
                  //       Color.fromARGB(22, 49, 32, 32),
                  //       Color.fromARGB(100, 82, 79, 28),
                  //     ],
                  //     begin: Alignment.bottomCenter,
                  //     end: Alignment.topCenter,
                  //     stops: [0.2, 0.85],
                  //   ),
                  // ),
                  // child: Column(
                  //   children: [
                  //     Text(
                  //       '${data?.cityName}',
                  //       style: TextStyle(
                  //         color: Colors.white.withOpacity(0.7),
                  //         fontSize: 25,
                  //       ),
                  //     ),
                  //     Text(
                  //       dateFormat,
                  //       style: TextStyle(
                  //         color: Colors.white.withOpacity(0.7),
                  //         fontSize: 15,
                  //       ),
                  //     ),
                  //     // Image.network('https:${data?.icon}',
                  //     //     // width: size.width * 0.5, 
                  //     //     // fit: BoxFit.fill
                  //     //     ),
                  //     Text(
                  //       'Sunny',
                  //       style: TextStyle(
                  //           color: Colors.white.withOpacity(0.9),
                  //           fontSize: 15,
                  //           fontWeight: FontWeight.bold),
                  //     ),
                    //   const SizedBox(
                    //     height: 5,
                    //   ),
                    //   Text(
                    //     '${data?.temp}',
                    //     style: TextStyle(
                    //         color: Colors.white.withOpacity(0.7), fontSize: 75),
                    //   ),
                    //   const SizedBox(
                    //     height: 20,
                    //   ),
                    //   Row(
                    //     children: [
                    //       Expanded(
                    //         child: Column(
                    //           children: [
                    //             Image.asset(
                    //               'assets/windy.png',
                    //               width: size.width * 0.1,
                    //             ),
                    //             Text(
                    //               '${data?.wind} km/h',
                    //               style: TextStyle(
                    //                   color: Colors.white.withOpacity(0.7),
                    //                   fontSize: 20),
                    //             ),
                    //             Text(
                    //               'wind',
                    //               style: TextStyle(
                    //                   color: Colors.white.withOpacity(0.7),
                    //                   fontSize: 20),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       Expanded(
                    //         child: Column(
                    //           children: [
                    //             Image.asset(
                    //               'assets/humidity.png',
                    //               width: size.width * 0.1,
                    //             ),
                    //             Text(
                    //               '${data?.humidity}',
                    //               style: TextStyle(
                    //                   color: Colors.white.withOpacity(0.7),
                    //                   fontSize: 20),
                    //             ),
                    //             Text(
                    //               'Humidity',
                    //               style: TextStyle(
                    //                   color: Colors.white.withOpacity(0.7),
                    //                   fontSize: 20),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       Expanded(
                    //         child: Column(
                    //           children: [
                    //             Image.asset(
                    //               'assets/wind_dir.png',
                    //               width: size.width * 0.1,
                    //             ),
                    //             Text(
                    //               '${data?.windDir}',
                    //               style: TextStyle(
                    //                   color: Colors.white.withOpacity(0.7),
                    //                   fontSize: 20),
                    //             ),
                    //             Text(
                    //               'Wind Direction',
                    //               style: TextStyle(
                    //                   color: Colors.white.withOpacity(0.7),
                    //                   fontSize: 20),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       Row(
                    //         children: [
                    //           Expanded(
                    //             child: Column(
                    //               children: [
                    //                 Text(
                    //                   '${data?.gust}',
                    //                   style: TextStyle(
                    //                       color: Colors.white.withOpacity(0.7),
                    //                       fontSize: 20),
                    //                 ),
                    //                 Text(
                    //                   'Gust',
                    //                   style: TextStyle(
                    //                       color: Colors.white.withOpacity(0.7),
                    //                       fontSize: 20),
                    //                 ),
                    //                 const SizedBox(
                    //                   height: 5,
                    //                 ),
                    //                 Text(
                    //                   '${data?.pressure} hpa',
                    //                   style: TextStyle(
                    //                       color: Colors.white.withOpacity(0.7),
                    //                       fontSize: 20),
                    //                 ),
                    //                 Text(
                    //                   'pressure',
                    //                   style: TextStyle(
                    //                       color: Colors.white.withOpacity(0.7),
                    //                       fontSize: 20),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //           Expanded(
                    //             child: Column(
                    //               children: [
                    //                 Text(
                    //                   '${data?.uv}',
                    //                   style: TextStyle(
                    //                       color: Colors.white.withOpacity(0.7),
                    //                       fontSize: 20),
                    //                 ),
                    //                 Text(
                    //                   'UV',
                    //                   style: TextStyle(
                    //                       color: Colors.white.withOpacity(0.7),
                    //                       fontSize: 20),
                    //                 ),
                    //                 const SizedBox(
                    //                   height: 5,
                    //                 ),
                    //                 Text(
                    //                   '${data?.pricipe} mm',
                    //                   style: TextStyle(
                    //                       color: Colors.white.withOpacity(0.7),
                    //                       fontSize: 20),
                    //                 ),
                    //                 Text(
                    //                   'pricipe',
                    //                   style: TextStyle(
                    //                       color: Colors.white.withOpacity(0.7),
                    //                       fontSize: 20),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //           Expanded(
                    //             child: Column(
                    //               children: [
                    //                 Text(
                    //                   '${data?.wind} km/h',
                    //                   style: TextStyle(
                    //                       color: Colors.white.withOpacity(0.7),
                    //                       fontSize: 20),
                    //                 ),
                    //                 Text(
                    //                   'wind',
                    //                   style: TextStyle(
                    //                       color: Colors.white.withOpacity(0.7),
                    //                       fontSize: 20),
                    //                 ),
                    //                 const SizedBox(
                    //                   height: 5,
                    //                 ),
                    //                 Text(
                    //                   '${data?.lastUpdate}',
                    //                   style: TextStyle(
                    //                       color: Colors.white.withOpacity(0.7),
                    //                       fontSize: 20),
                    //                 ),
                    //                 Text(
                    //                   'Last Update',
                    //                   style: TextStyle(
                    //                     color: Colors.green.withOpacity(0.7),
                    //                     fontSize: 20,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ],
                  ),
                // ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
