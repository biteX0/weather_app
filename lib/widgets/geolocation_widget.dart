import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/services/get_location.dart';
import 'package:weather_app/ui/constants.dart';
import 'package:weather_app/ui/custom_colors.dart';


class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  String date = DateFormat("yMMMd").format(DateTime.now());

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAdress(globalController.getLattitude().value,
        globalController.getLongitude().value);
    super.initState();
  }

  getAdress(lat, lon) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    // print(placemark);
    Placemark place = placemark[0];
    setState(() {
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
            alignment: Alignment.topLeft,
            child: Text(city, 
            style: const TextStyle(
              fontSize: fontSize30,
              height: 2,
              color: CustomColors.textColor
            ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            alignment: Alignment.topLeft,
            child: Text(date, 
            style: const TextStyle(
              fontSize: fontSize16,
              color: CustomColors.textColor,
              height: 1.5,
            ),
            ),
          ),
        ],
      ),
    );
  }
}
