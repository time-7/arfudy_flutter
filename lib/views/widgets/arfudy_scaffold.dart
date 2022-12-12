import 'package:flutter/material.dart';

import '../../utils/ui_colors.dart';
import '../../utils/ui_scale.dart';

class ArfudyScaffold extends StatelessWidget {
  const ArfudyScaffold({
    Key? key,
    this.leading,
    this.body,
    this.fab,
  }) : super(key: key);

  final Widget? leading;
  final Widget? body;
  final Widget? fab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: leading,
        centerTitle: true,
        toolbarHeight: UIScale.height(5) + UIScale.deviceTopPadding,
        title: SizedBox(
          height: UIScale.height(6),
          width: UIScale.width(30),
          child: Image.asset(
            'assets/images/arfudy_logo.png',
          ),
        ),
      ),
      body: body,
      floatingActionButton: fab,
    );
  }
}
