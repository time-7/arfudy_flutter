import 'package:flutter/material.dart';

import '../../utils/ui_colors.dart';
import '../../utils/ui_scale.dart';
import '../../utils/ui_text.dart';

class ArfudyButton extends StatelessWidget {
  const ArfudyButton({Key? key, required this.text, required this.onTap}) : super(key: key);
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: UIScale.width(1),
          horizontal: UIScale.width(3),
        ),
        height: UIScale.height(5),
        width: UIScale.width(40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: UIColors.arfudyColor,
        ),
        child: UIText(
          text,
          fontSize: UIScale.width(4),
        ),
      ),
    );
  }
}
