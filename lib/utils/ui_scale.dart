import 'dart:math';

import 'package:flutter/cupertino.dart';

class UIScale {
  static late double widthDevice;
  static late double heightDevice;
  static late double topDevicePadding;
  static late double bottomDevicePadding;
  static late double diagonalDevice;

  static final SizedBox kBottomBarHeight = SizedBox(height: UIScale.height(10) + UIScale.bottomDevicePadding + 10);

  static double width(double percentage) => (widthDevice / 100) * percentage;
  static double height(double percentage) => (heightDevice / 100) * percentage;
  static double textSize(double size) => (widthDevice / 1000) * size;

  static void init(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    widthDevice = screenSize.width;
    heightDevice = screenSize.height;
    topDevicePadding = MediaQuery.of(context).padding.top;
    bottomDevicePadding = MediaQuery.of(context).padding.bottom;
    diagonalDevice = sqrt(pow(widthDevice, 2) + pow(heightDevice, 2));
  }
}
