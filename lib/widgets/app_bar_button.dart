import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:weather_app/ui/custom_colors.dart';
import 'package:weather_app/widgets/main_information_widget.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Get.to(const MainInformation());
            },
            icon: const ImageIcon(AssetImage("assets/pin.png")),
            color: CustomColors.cardColor,
          ),
          IconButton(
            onPressed: () {
              Get.to(());
            },
            icon: const ImageIcon(AssetImage("assets/menu.png")),
            color: CustomColors.cardColor,
          ),
        ],
      ),
    );
  }
}
