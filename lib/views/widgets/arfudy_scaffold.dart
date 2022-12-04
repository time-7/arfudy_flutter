import 'package:flutter/material.dart';

import '../../utils/ui_colors.dart';
import '../../utils/ui_scale.dart';

class ArfudyScaffold extends StatelessWidget {
  const ArfudyScaffold({Key? key, this.body}) : super(key: key);
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.backgroundColor,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: UIScale.height(1.3)),
            alignment: Alignment.bottomCenter,
            height: UIScale.height(9) + UIScale.deviceTopPadding,
            decoration: const BoxDecoration(color: UIColors.arfudyColor),
            child: SizedBox(
              height: UIScale.height(6),
              width: UIScale.width(30),
              child: Image.asset(
                'assets/images/arfudy_logo.png',
              ),
            ),
          ),
          Flexible(flex: 6, child: body ?? const SizedBox()),
        ],
      ),
    );
  }
}
