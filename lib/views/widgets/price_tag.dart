import 'package:flutter/material.dart';

import '../../utils/new_ui_text.dart';
import '../../utils/ui_colors.dart';
import '../../utils/ui_scale.dart';

class PriceTag extends StatelessWidget {
  const PriceTag(
    this.price, {
    Key? key,
  }) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: UIScale.width(1.5), horizontal: UIScale.width(2.5)),
      alignment: Alignment.center,
      height: UIScale.height(4),
      decoration: BoxDecoration(
        color: UIColors.secondaryBlue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: NewUIText(
        "R\$ ${double.tryParse(price)?.toStringAsFixed(2).replaceAll('.', ',')}",
        fontSize: UIScale.width(3.5),
        fontWeight: FontWeight.w500,
        fontColor: UIColors.offWhite,
      ),
    );
  }
}
