import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_models.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weather_app/ui/constants.dart';
import 'package:weather_app/ui/custom_colors.dart';

class ComfortLevel extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const ComfortLevel({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 1, left: 20, right: 20, bottom: 20),
          child: const Text(
            'Comfort Level',
            style:
                TextStyle(fontSize: fontSize20, color: CustomColors.textColor),
          ),
        ),
        SizedBox(
          height: 180,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: weatherDataCurrent.main.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(trackWidth: 15),
                    infoProperties: InfoProperties(
                      mainLabelStyle: const TextStyle(
                          color: CustomColors.textColor, fontSize: fontSize27),
                      bottomLabelText: 'Humidity',
                      bottomLabelStyle: const TextStyle(
                          letterSpacing: 0.1,
                          fontSize: fontSize16,
                          height: 1.5,
                          color: CustomColors.textColor),
                    ),
                    animationEnabled: true,
                    size: 150,
                    customColors: CustomSliderColors(
                        hideShadow: true,
                        trackColor:
                            CustomColors.secondGradientColor.withAlpha(100),
                        progressBarColors: [
                          CustomColors.firstGradientColor,
                          CustomColors.secondGradientColor
                        ]),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Feels Like:  ',
                    style: TextStyle(
                        fontSize: fontSize16,
                        height: 0.8,
                        color: CustomColors.textColor,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "${weatherDataCurrent.main.feelsLike!.toInt()}°",
                    style: const TextStyle(
                        fontSize: fontSize16,
                        height: 0.8,
                        color: CustomColors.textColor,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
