import 'package:flutter/material.dart';

class UIScale {
  static late double _widthDevice;
  static late double _heightDevice;
  static late double _mediaQueryTopPadding;
  static late double _deviceTextScaleFactor;
  static bool _wasUIScaleInitialized = false;

  static double width(double percentage) => (_widthDevice / 100) * percentage;
  static double height(double percentage) => (_heightDevice / 100) * percentage;
  static double textSize(double size) => (_widthDevice / 1000) * size;

  static double get deviceTopPadding => _mediaQueryTopPadding;
  static double get deviceTextScaleFactor => _deviceTextScaleFactor;
  static double get widthDevice => _widthDevice;
  static double get heightDevice => _heightDevice;

  static void init(BuildContext context) {
    if (_wasUIScaleInitialized == false) {
      Size screenSize = MediaQuery.of(context).size;
      _widthDevice = screenSize.width;
      _heightDevice = screenSize.height;
      _mediaQueryTopPadding = MediaQuery.of(context).padding.top;
      _deviceTextScaleFactor = MediaQuery.of(context).textScaleFactor;
      _wasUIScaleInitialized = true;
    }
  }
}
