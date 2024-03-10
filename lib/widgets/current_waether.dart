import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_models.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeatherWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tempWidget(),
        const SizedBox(
          height: 20,
        ),
        moreDetailsWidget(),
      ],
    );
  }

  Widget tempWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.network(
          weatherDataCurrent.iconUrl,
        ),
        Text(
          "${weatherDataCurrent.main.temp!.toInt()}°",
          style: const TextStyle(color: Colors.amber),
        ),
        Text(
          "${weatherDataCurrent.weatherInfo.description}",
          style: const TextStyle(color: Colors.amber),
        ),
      ],
    );
  }

  Widget moreDetailsWidget() {
    return Column(
      children: [
        Row(
          children: [
            Container(
              child: Text(
                "${weatherDataCurrent.main.humidity}%",
                style: const TextStyle(color: Colors.amber),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
