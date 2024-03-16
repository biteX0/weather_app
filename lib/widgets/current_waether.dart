import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_models.dart';
import 'package:weather_app/ui/constants.dart';
import 'package:weather_app/ui/custom_colors.dart';

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
          height: 40,
        ),
        moreDetailsWidget(),
      ],
    );
  }

  Widget tempWidget() {
    return Column(
      children: [
        Image.network(
          weatherDataCurrent.iconUrl,
        ),
        Text(
          weatherDataCurrent.weatherInfo.description,
          style: const TextStyle(
              color: CustomColors.textColor,
              fontSize: fontSize27,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "${weatherDataCurrent.main.temp!.toInt()}°",
          style: const TextStyle(
              color: CustomColors.textColor,
              fontSize: fontSize40,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget moreDetailsWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                height: 70,
                width: 70,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: CustomColors.cardColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Image.asset("assets/wind.png")),
            Container(
                height: 70,
                width: 70,
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                    color: CustomColors.cardColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Image.asset("assets/clouds.png")),
            Container(
                height: 70,
                width: 70,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: CustomColors.cardColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Image.asset("assets/pressure.png")),
          ],
        ),
        const SizedBox(
          height: 7,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherDataCurrent.windSpeed.speed} м/с",
                style: const TextStyle(color: CustomColors.textColor),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherDataCurrent.clouds.cloudsAll} %",
                style: const TextStyle(color: CustomColors.textColor),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 65,
              child: Text(
                "${weatherDataCurrent.main.pressure} гПа",
                style: const TextStyle(color: CustomColors.textColor),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
