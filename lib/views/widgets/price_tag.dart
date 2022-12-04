import 'package:flutter/material.dart';

import '../../utils/ui_colors.dart';
import '../../utils/ui_scale.dart';
import '../../utils/ui_text.dart';

class PriceTag extends StatelessWidget {
  const PriceTag(
    this.price, {
    Key? key,
  }) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: UIScale.width(1.5), horizontal: UIScale.width(2.5)),
      alignment: Alignment.center,
      height: UIScale.height(4),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: UIText(
        "R\$$price",
        fontSize: UIScale.width(3.5),
        fontColor: UIColors.offWhite,
        fontFamily: '',
      ),
    );
  }
}
