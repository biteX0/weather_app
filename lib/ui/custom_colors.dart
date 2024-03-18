import 'package:flutter/material.dart';

class CustomColors {
  static const cardColor = Color(0xffE9ECF1);
  static const textColor = Color.fromARGB(255, 230, 226, 226);
  static const firstGradientColor = Color(0xffE9ECF1);
  static const secondGradientColor = Color(0xff5286CD);

  static const Color firstBackgroundColor = Color.fromARGB(167, 252, 252, 252);
  static const Color secondBackgroundColor = Color.fromARGB(238, 46, 62, 109);
  static const Color backgroundColor = Color.fromARGB(232, 7, 23, 53);
}

const boxDecorationBackground = BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.2,
                0.7
              ],
              colors: [
                CustomColors.firstBackgroundColor,
                CustomColors.secondBackgroundColor
              ]),
        );