import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../delegate/arfudy_views_routes.dart';
import '../../utils/new_ui_text.dart';
import '../../utils/ui_colors.dart';
import '../../utils/ui_scale.dart';

class ArfudyDrawer extends StatefulWidget {
  const ArfudyDrawer({
    super.key,
  });

  @override
  State<ArfudyDrawer> createState() => _ArfudyDrawerState();
}

class _ArfudyDrawerState extends State<ArfudyDrawer> {
  final double _begin = 0.0;
  final double _end = 15.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: _begin, end: _end),
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
          builder: (_, value, child) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: value, sigmaY: value),
              child: child,
            );
          },
          child: const SizedBox.expand(),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
          ),
          child: Drawer(
            backgroundColor: UIColors.secondaryCaramel,
            shape: const BeveledRectangleBorder(),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: UIScale.topDevicePadding + 50,
                        ),
                        const NewUIText(
                          'Olá,',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        const NewUIText(
                          'Fulano',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const SizedBox(
                          width: 100,
                          child: NewUIText(
                            'Minha comanda',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      width: 100,
                      child: GestureDetector(
                        onTap: () async {
                          print('object');

                          Get.toNamed(ArfudyRoutes.tablesQrCodeTest);
                        },
                        child: const NewUIText(
                          'TESTE MESAS',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
