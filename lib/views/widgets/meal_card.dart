import 'package:arfudy_flutter/views/food_view.dart';
import 'package:arfudy_flutter/views/widgets/price_tag.dart';
import 'package:flutter/material.dart';

import '../../models/meal_model.dart';
import '../../utils/ui_colors.dart';
import '../../utils/ui_scale.dart';
import '../../utils/ui_text.dart';
import 'ar_button.dart';

class MealCard extends StatelessWidget {
  const MealCard({Key? key, required this.meal}) : super(key: key);
  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => FoodView(meal: meal),
        ),
      ),
      child: Container(
        height: UIScale.height(20),
        decoration: BoxDecoration(
          color: UIColors.offWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: EdgeInsets.all(UIScale.width(3)),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: UIText(meal.name),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(UIScale.width(3)),
                      child: Row(children: [
                        PriceTag(meal.mealPrice),
                        SizedBox(
                          width: UIScale.width(2),
                        ),
                        meal.has3d == true ? ARButton(meal) : const SizedBox(),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(right: UIScale.width(2)),
                child: Column(
                  children: [
                    Flexible(
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            meal.imageUrl,
                            height: UIScale.width(30),
                            width: UIScale.width(30),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
