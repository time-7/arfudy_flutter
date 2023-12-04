import 'package:flutter/material.dart';

import '../../utils/new_ui_text.dart';
import '../../utils/ui_colors.dart';
import '../../utils/ui_design.dart';
import '../../utils/ui_scale.dart';

class MealContainer extends StatelessWidget {
  const MealContainer({super.key, required this.imageUrl, required this.name});

  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: UIScale.width(100),
      decoration: BoxDecoration(
        color: Colors.black,
        border: UIDesign.primaryBorder,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        boxShadow: UIDesign.primaryShadows,
      ),
      margin: EdgeInsets.symmetric(vertical: UIScale.height(2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(30),
            ),
            child: Image.network(
              imageUrl,
              width: UIScale.width(100),
              height: UIScale.height(25),
              fit: BoxFit.fitWidth,
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
            child: Container(
              width: UIScale.width(100),
              decoration: const BoxDecoration(
                color: UIColors.secondaryBlue,
                border: Border(
                  top: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: UIScale.height(2),
                horizontal: UIScale.width(6),
              ),
              child: Center(
                child: NewUIText(
                  name,
                  fontColor: UIColors.primaryWhite,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
