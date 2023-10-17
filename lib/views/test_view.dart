import 'package:arfudy_flutter/views/widgets/arfudy_new_scaffold.dart';
import 'package:arfudy_flutter/views/widgets/menu_container.dart';
import 'package:arfudy_flutter/views/widgets/new_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../delegate/arfudy_views_routes.dart';
import '../utils/ui_scale.dart';

class TestView extends StatelessWidget {
  TestView({super.key});

  final testLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return ArfudyNewScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(ArfudyRoutes.qrCode);
                },
                child: const MenuContainer(
                  text: 'QR CODE VIEW',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(ArfudyRoutes.enteringTable);
                },
                child: const MenuContainer(
                  text: 'ENTERING TABLE VIEW',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(ArfudyRoutes.tableSituation);
                },
                child: const MenuContainer(
                  text: 'TABLE SITUATION VIEW',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: MenuContainer(),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: MenuContainer(),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: MenuContainer(),
            ),
            UIScale.kBottomBarHeight
          ],
        ),
      ),
      bottomBar: NewPrimaryButton(
        buttonText: 'Teste de Loading',
        onPressed: () async {
          testLoading.value = true;
          await Future.delayed(const Duration(seconds: 2));
          testLoading.value = false;
        },
        isLoading: testLoading,
      ),
    );
  }
}
