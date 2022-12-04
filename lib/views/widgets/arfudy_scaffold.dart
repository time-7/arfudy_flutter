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
            height: UIScale.height(9) + UIScale.deviceTopPadding,
            decoration: const BoxDecoration(color: UIColors.arfudyColor),
          ),
          Flexible(flex: 6, child: body ?? const SizedBox()),
        ],
      ),
    );
  }
}
