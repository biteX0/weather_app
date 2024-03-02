import 'package:flutter/material.dart';
// import 'package:weather_app/ui/theme_background.dart';
import 'package:weather_app/widgets/geolocation_widget.dart';
// import 'package:weather_app/widgets/main_information_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        // BackgroundApp(),
        GeolocationPage(),
        // MainInformation(),
      ],
    );
  }
}
