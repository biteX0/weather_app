import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/services/get_location.dart';
import 'package:weather_app/ui/custom_colors.dart';
import 'package:weather_app/widgets/app_bar_button.dart';
import 'package:weather_app/widgets/comfort_level.dart';
import 'package:weather_app/widgets/current_waether.dart';
import 'package:weather_app/widgets/geolocation_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: Container(
        decoration: boxDecorationBackground,
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
                : RefreshIndicator(
                    onRefresh: _refresh,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const AppBarButton(),
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
                    ),
                  ))),
      ),
    );
  }
}
