import 'package:arfudy_flutter/delegate/arfudy_views_routes.dart';
import 'package:arfudy_flutter/views/widgets/arfudy_button.dart';
import 'package:arfudy_flutter/views/widgets/arfudy_new_scaffold.dart';
import 'package:arfudy_flutter/views/widgets/new_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/ui_colors.dart';

class HomeView extends GetView {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ArfudyNewScaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NewPrimaryButton(
              buttonText: 'Cardápio',
              onPressed: () => Get.toNamed(ArfudyRoutes.meals),
              backgroundColor: UIColors.secondaryBlue,
              fontColor: Colors.white,
            ),
            const SizedBox(height: 20),
            NewPrimaryButton(
              buttonText: 'Iniciar atendimento',
              onPressed: () => Get.toNamed(ArfudyRoutes.qrCode),
            )
          ],
        ),
      ),
    );
  }
}
