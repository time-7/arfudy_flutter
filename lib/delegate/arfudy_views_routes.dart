import 'package:arfudy_flutter/views/qr_code_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import 'arfudy_binding.dart';

class _ArfudyRoutes {
  static const root = '/';
}

class ArfudyViews {
  static final Bindings _binding = ArfudyBinding();

  static final List<GetPage> views = [
    GetPage(
      curve: Curves.easeIn,
      transition: Transition.rightToLeft,
      name: _ArfudyRoutes.root,
      page: () => const QrCodeView(),
      binding: _binding,
    ),
  ];
}
