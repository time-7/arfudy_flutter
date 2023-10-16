import 'package:arfudy_flutter/views/entering_table_view.dart';
import 'package:arfudy_flutter/views/qr_code_view.dart';
import 'package:arfudy_flutter/views/splash_view.dart';
import 'package:arfudy_flutter/views/test_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import 'arfudy_binding.dart';

class ArfudyRoutes {
  static const root = '/';
  static const qrCode = '/qr-code';
  static const test = '/test';
  static const splash = '/splash';
  static const enteringTable = '/entering-table';
}

class ArfudyViews {
  static final Bindings _binding = ArfudyBinding();

  static final List<GetPage> views = [
    GetPage(
      curve: Curves.easeIn,
      transition: Transition.rightToLeft,
      name: ArfudyRoutes.qrCode,
      page: () => const QrCodeView(),
      binding: _binding,
    ),
    GetPage(
      curve: Curves.easeIn,
      transition: Transition.rightToLeft,
      name: ArfudyRoutes.test,
      page: () => const TestView(),
    ),
    GetPage(
      curve: Curves.easeIn,
      transition: Transition.rightToLeft,
      name: ArfudyRoutes.splash,
      page: () => const AppSplashView(),
      binding: _binding,
    ),
    GetPage(
      curve: Curves.easeIn,
      transition: Transition.rightToLeft,
      name: ArfudyRoutes.enteringTable,
      page: () => EnteringTableView(),
      binding: _binding,
    ),
  ];
}
