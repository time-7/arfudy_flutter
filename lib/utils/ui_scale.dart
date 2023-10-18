import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UIScale {
  static double width(double percentage) => (Get.width / 100) * percentage;
  static double height(double percentage) => (Get.height / 100) * percentage;
  static SizedBox get bottomBarHeightWidget => SizedBox(height: UIScale.height(10) + UIScale.bottomDevicePadding + 10);
  static double get topDevicePadding => Get.mediaQuery.padding.top;
  static double get bottomDevicePadding => Get.mediaQuery.padding.bottom;
}
