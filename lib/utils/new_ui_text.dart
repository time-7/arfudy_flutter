import 'package:flutter/material.dart';

class NewUIText extends StatelessWidget {
  const NewUIText(
    this.text, {
    super.key,
    this.fontFamily = ArfudyFontFamily.montserrat,
    this.fontSize = 16,
    this.fontColor = Colors.black,
    this.fontWeight,
    this.decoration,
    this.textAlign,
  });

  final String text;
  final ArfudyFontFamily fontFamily;
  final double fontSize;
  final Color fontColor;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        decoration: decoration,
        fontFamily: fontFamily.name,
        fontSize: fontSize,
        color: fontColor,
        fontWeight: fontWeight,
      ),
    );
  }
}

enum ArfudyFontFamily {
  montserrat,
  notoSerif;

  String get name {
    switch (this) {
      case ArfudyFontFamily.montserrat:
        return 'Montserrat';
      case ArfudyFontFamily.notoSerif:
        return 'NotoSerif';
    }
  }
}
