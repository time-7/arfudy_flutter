import 'package:flutter/material.dart';

class UIDesign {
  static final Border primaryBorder = Border.all(
    color: Colors.black,
    width: 2,
  );

  static const List<BoxShadow> primaryShadows = [
    BoxShadow(
      color: Colors.black,
      blurRadius: 0,
      offset: Offset(0, 4),
    )
  ];
}
