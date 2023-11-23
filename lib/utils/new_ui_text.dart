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
    this.shadows,
    this.softWrap = false,
    this.maxLines,
  });

  final String text;
  final ArfudyFontFamily fontFamily;
  final double fontSize;
  final Color fontColor;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  final List<Shadow>? shadows;
  final bool softWrap;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: TextStyle(
        decoration: decoration,
        fontFamily: fontFamily.name,
        fontSize: fontSize,
        color: fontColor,
        fontWeight: fontWeight,
        shadows: shadows,
      ),
      softWrap: softWrap,
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
