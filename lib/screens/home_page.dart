import 'package:flutter/material.dart';
import 'package:weather_app/ui/theme_background.dart';
import 'package:weather_app/widgets/weather_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          BackgroundApp(),
          MainInformation(),
        ],
      ),
    );
  }
}
