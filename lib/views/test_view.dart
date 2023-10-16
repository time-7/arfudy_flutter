import 'package:arfudy_flutter/views/widgets/arfudy_new_scaffold.dart';
import 'package:arfudy_flutter/views/widgets/menu_container.dart';
import 'package:arfudy_flutter/views/widgets/new_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../delegate/arfudy_views_routes.dart';

class TestView extends StatelessWidget {
  TestView({super.key});

  final isdashboard = false.obs;

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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: MenuContainer(),
            ),
          ],
        ),
      ),
      bottomBar: NewPrimaryButton(
        buttonText: 'Iniciar atendimento',
        onPressed: () async {
          isdashboard.value = true;
          print('Iniciar atendimento');
          await Future.delayed(const Duration(seconds: 2));
          isdashboard.value = false;
        },
        isLoading: isdashboard,
      ),
    );
  }
}
