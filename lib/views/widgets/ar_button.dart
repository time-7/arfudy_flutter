import 'package:arfudy_flutter/models/meal_model.dart';
import 'package:flutter/material.dart';

import '../../utils/ui_colors.dart';
import '../../utils/ui_scale.dart';

class ARButton extends StatelessWidget {
  const ARButton(
    this.meal, {
    Key? key,
  }) : super(key: key);

  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.black,
      shape: const CircleBorder(),
      constraints: BoxConstraints.expand(
          width: UIScale.width(10), height: UIScale.width(10)),
      onPressed: () =>
          Navigator.of(context).pushNamed('ar_page', arguments: meal),
      child: Icon(
        Icons.view_in_ar,
        color: UIColors.offWhite,
        size: UIScale.height(2.3),
      ),
    );
  }
}
