import 'package:flutter/material.dart';

import '../../utils/ui_colors.dart';
import '../../utils/ui_scale.dart';
import '../../utils/ui_text.dart';
import '../home_view.dart';

class PriceTag extends StatelessWidget {
  const PriceTag(
    this.price, {
    Key? key,
  }) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(UIScale.width(1.3)),
      alignment: Alignment.center,
      height: UIScale.height(3.2),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: UIText(
        "R\$$price",
        fontSize: UIScale.width(3.2),
        fontColor: UIColors.offWhite,
      ),
    );
  }
}
