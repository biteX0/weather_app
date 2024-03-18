import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/ui/constants.dart';
import 'package:weather_app/ui/custom_colors.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: CustomColors.secondBackgroundColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        decoration: boxDecorationBackground,
        padding: const EdgeInsets.only(left: 30, right: 30, top: 100),
        child: Column(
          children: [
            TextField(
              style: const TextStyle(
                color: CustomColors.secondBackgroundColor,
              ),
              decoration: const InputDecoration(
                filled: true,
                fillColor: CustomColors.textColor,
                prefixIcon: Icon(
                  Icons.place,
                  color: CustomColors.secondGradientColor,
                ),
                hintText: 'Название города',
                hintStyle: TextStyle(
                  color: CustomColors.secondGradientColor,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none),
              ),
              onChanged: (value) {
                cityName = value;
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 50.0,
              width: double.infinity,
              child: MaterialButton(
                color: CustomColors.secondBackgroundColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                onPressed: () {
                  // Get.toNamed('/cityName', id: 1);
                  Navigator.pop(context, cityName);
                },
                child: const Text(
                  'Поиск',
                  style: TextStyle(
                      fontSize: fontSize27, color: CustomColors.textColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
