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
          style: const TextStyle(color: Colors.amber),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "${weatherDataCurrent.main.temp!.toInt()}°",
          style: const TextStyle(
              color: Colors.amber, fontSize: 45, fontWeight: FontWeight.w500),
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Image.asset("assets/wind.png")),
            Container(
                height: 70,
                width: 70,
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Image.asset("assets/clouds.png")
                // child: Text(
                //   "pressure: ${weatherDataCurrent.main.pressure} hPa",
                //   style: const TextStyle(color: Colors.amber),
                // ),
                ),
            Container(
                height: 70,
                width: 70,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Image.asset("assets/humidity.png")
                // child: Text(
                //   "feelsLike: ${weatherDataCurrent.main.feelsLike!.toInt()}°",
                //   style: const TextStyle(color: Colors.amber),
                // ),
                ),
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
                "${weatherDataCurrent.windSpeed.speed} m/s",
                style: const TextStyle(
                  color: Colors.amber),
                  textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherDataCurrent.clouds.cloudsAll} %",
                style: const TextStyle(color: Colors.amber),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherDataCurrent.main.humidity}%",
                style: const TextStyle(color: Colors.amber),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
