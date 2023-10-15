import 'package:arfudy_flutter/delegate/arfudy_views_routes.dart';
import 'package:arfudy_flutter/utils/ui_colors.dart';
import 'package:arfudy_flutter/utils/ui_scale.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSplashView extends StatelessWidget {
  const AppSplashView({Key? key}) : super(key: key);

  rootInitializer(BuildContext context) async {
    UIScale.init(context);
    await Future.delayed(const Duration(seconds: 2));
    handleInitialView();
  }

  @override
  Widget build(BuildContext context) {
    rootInitializer(context);
    return Center(
      child: Container(
        color: UIColors.backgroundColor,
        child: Center(
          child: SizedBox(
            width: UIScale.width(50),
            // child: Image.asset('assets/branding_splash.png'),
          ),
        ),
      ),
    );
  }

  handleInitialView() async {
    Get.offNamed(ArfudyRoutes.test);
  }
}
