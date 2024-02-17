import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/screens/get_started.dart';
import 'package:weather_app/widgets/main_information_widget.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GetStarted(),
        ),
    );
  }
}
