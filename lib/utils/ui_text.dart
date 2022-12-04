import 'package:flutter/material.dart';

import 'ui_scale.dart';

class UIText extends StatelessWidget {
  const UIText(this.text, {Key? key, this.fontSize, this.fontColor = Colors.black}) : super(key: key);
  final String text;
  final double? fontSize;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? UIScale.width(5.7),
        color: fontColor,
        fontFamily: 'Antipasto',
      ),
    );
  }
}
