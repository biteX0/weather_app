import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/services/get_location.dart';
import 'package:weather_app/ui/custom_colors.dart';
import 'package:weather_app/widgets/comfort_level.dart';
import 'package:weather_app/widgets/current_waether.dart';
import 'package:weather_app/widgets/geolocation_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.2,
                0.7
              ],
              colors: [
                CustomColors.firstBackgroundColor,
                CustomColors.secondBackgroundColor
              ]),
        ),
        child: SafeArea(
            child: Obx(() => globalController.checkLoading().isTrue
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/start.png",
                          height: 250,
                          width: 250,
                        ),
                        const CircularProgressIndicator(
                          color: CustomColors.cardColor,
                        )
                      ],
                    ),
                  )
                : ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const HeaderWidget(),
                      CurrentWeatherWidget(
                        weatherDataCurrent:
                            globalController.getData().getCurrentWeather(),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ComfortLevel(
                          weatherDataCurrent:
                              globalController.getData().getCurrentWeather())
                    ],
                  ))),
      ),
    );
  }
}
