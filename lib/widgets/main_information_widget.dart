import 'package:flutter/material.dart';

  var dayInfo = DateTime.now();
  var dateFormat = DateFormate('EEEE, d MMM, yyyy').formate(dayInfo);

class MainInformation extends StatelessWidget {
    const MainInformation({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1,
            height: MediaQuery.sizeOf(context).height * 0.6,
            pading: const EdgeInsets.only(top: 20),
            margin: const EdgeInsets.only(right: 10, left: 10),
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
            child: Column (
              children[
                Text(
                  '${data?.cityName}',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 35,
                  ),
                  Text(
                  dateFormat,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 35,
                  ),
                    Image.asset(
                      'assets/',
                      width: size.width * 0.4,
                    ),
                    Text(
                      'Sunny', 
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 15,
                        fontWeight: FontWeaight.bold, 
                      ),
                      SizeBox(
                        height: 5,
                      ),
                      Text(
                  '${data?.temp}',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 75,
                  ),
                        SizeBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: 
                              Column(
                                Image.asset(
                                  'assets/wind', 
                                  width: size.width*0.15,
                                ),
                                Text(
                  '${data?.wind} km/h',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 75,
                  ),
                                  Text(
                  'wind',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 75,
                  ),
                                    Expanded(
                              child: 
                              Column(
                                Image.asset(
                                  'assets/humidity', 
                                  width: size.width*0.15,
                                ),
                                Text(
                  '${data?.humidity}',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 75,
                  ),
                                  Text(
                  'Humidity',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 75,
                  ),
                                 Expanded(
                              child: 
                              Column(
                                Image.asset(
                                  'assets/windDir', 
                                  width: size.width*0.15,
                                ),
                                Text(
                  '${data?.windDir}',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 75,
                  ),
                                  Text(
                  'Wind Direction',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 75,
                  ),   
                              ),
                            ),
                          ],
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
