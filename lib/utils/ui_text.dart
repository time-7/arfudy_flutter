import 'package:flutter/material.dart';

import 'ui_scale.dart';

class UIText extends StatelessWidget {
  const UIText(this.text,
      {Key? key,
      this.fontSize,
      this.fontColor = Colors.black,
      this.textAlign,
      this.fontFamily = 'Antipasto',
      this.fontWeight})
      : super(key: key);
  final String text;
  final double? fontSize;
  final Color fontColor;
  final TextAlign? textAlign;
  final String fontFamily;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? UIScale.width(5.7),
        color: fontColor,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      ),
    );
  }
}
