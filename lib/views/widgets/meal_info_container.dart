import 'package:flutter/material.dart';

import '../../utils/new_ui_text.dart';
import '../../utils/ui_colors.dart';
import '../../utils/ui_design.dart';
import '../../utils/ui_scale.dart';

class MealInfoContainer extends StatelessWidget {
  const MealInfoContainer({
    super.key,
    required this.title,
    required this.value,
    required this.isInRow,
  });

  final String title;
  final String value;
  final bool isInRow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: !isInRow ? UIScale.width(100) : null,
      decoration: BoxDecoration(
        color: UIColors.primaryWhite,
        border: UIDesign.primaryBorder,
        borderRadius: const BorderRadius.all(
          Radius.circular(40),
        ),
        boxShadow: UIDesign.primaryShadows,
      ),
      padding: EdgeInsets.symmetric(
        vertical: UIScale.height(1),
        horizontal: UIScale.width(8),
      ),
      margin: EdgeInsets.symmetric(vertical: UIScale.height(1)),
      child: Column(
        children: [
          NewUIText(
            title,
            fontWeight: FontWeight.w500,
            fontColor: UIColors.secondaryBlue,
            fontSize: 20,
          ),
          SizedBox(height: UIScale.height(0.25)),
          NewUIText(
            value,
            fontWeight: isInRow ? FontWeight.w700 : FontWeight.normal,
            fontSize: isInRow ? 20 : 18,
            softWrap: !isInRow,
          ),
        ],
      ),
    );
  }
}