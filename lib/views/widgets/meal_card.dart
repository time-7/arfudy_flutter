import 'package:arfudy_flutter/views/food_view.dart';
import 'package:arfudy_flutter/views/widgets/price_tag.dart';
import 'package:flutter/material.dart';

import '../../models/meal_model.dart';
import '../../utils/new_ui_text.dart';
import '../../utils/ui_colors.dart';
import '../../utils/ui_design.dart';
import '../../utils/ui_scale.dart';
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
          color: UIColors.primaryWhite,
          border: UIDesign.primaryBorder,
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          boxShadow: UIDesign.primaryShadows,
        ),
        padding: EdgeInsets.all(UIScale.width(3)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(UIScale.width(1.5)),
                  child: NewUIText(
                    meal.name,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    fontColor: Colors.black,
                  ),
                ),
                SizedBox(
                  width: UIScale.width(45),
                  child: Padding(
                    padding: EdgeInsets.all(UIScale.width(1.5)),
                    child: NewUIText(
                      meal.description,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontColor: Colors.black,
                      softWrap: true,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        PriceTag(meal.mealPrice),
                        SizedBox(
                          width: UIScale.width(2),
                        ),
                        meal.has3d == true ? ARButton(meal) : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(left: UIScale.width(2)),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
