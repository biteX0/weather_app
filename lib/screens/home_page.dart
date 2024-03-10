import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:weather_app/ui/theme_background.dart';
import 'package:weather_app/widgets/main_information_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
=======
import 'package:get/get.dart';
import 'package:weather_app/services/get_location.dart';
import 'package:weather_app/widgets/current_waether.dart';
import 'package:weather_app/widgets/geolocation_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
>>>>>>> Stashed changes

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return const Stack(
      children: [
        BackgroundApp(),
        MainInformation(),
      ],
=======
    return Scaffold(
      backgroundColor: Color.fromARGB(101, 48, 67, 95),
      body: SafeArea(
              child: Obx(() => globalController.checkLoading().isTrue
                  ? const Center(
                      child: CircularProgressIndicator(color: Color.fromARGB(178, 255, 255, 255),),
                    )
                  : ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        // const BackgroundApp(),
                        const SizedBox( height: 20,),
                        const HeaderWidget(),
                        CurrentWeatherWidget(
                                    weatherDataCurrent:
                                        globalController.getData().getCurrentWeather(),
                                  ),
                                  const SizedBox(
                                    height: 20,
                        ),
                      ],
                    ))),
>>>>>>> Stashed changes
    );
  }
}
