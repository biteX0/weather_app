import 'package:flutter/material.dart';
import 'package:weather_app/ui/theme_background.dart';
import 'package:weather_app/widgets/main_information_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          BackgroundApp(),
          MainInformation(),
        ],
      ),
    );
  }
}
