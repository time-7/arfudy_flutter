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
        height: UIScale.height(26),
        decoration: BoxDecoration(
          color: UIColors.primaryWhite,
          border: UIDesign.primaryBorder,
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          boxShadow: UIDesign.primaryShadows,
        ),
        padding: EdgeInsets.all(UIScale.width(4)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: UIScale.width(2)),
              child: NewUIText(
                meal.name,
                fontSize: 22,
                fontWeight: FontWeight.w600,
                fontColor: Colors.black,
                softWrap: true,
              ),
            ),
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: UIScale.width(40),
                          child: NewUIText(
                            meal.description,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontColor: Colors.black,
                            softWrap: true,
                            maxLines: 6,
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: UIScale.height(4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PriceTag(meal.price.toStringAsFixed(2)),
                              SizedBox(width: UIScale.width(2)),
                              meal.has3dModel == true
                                  ? ARButton(meal)
                                  : const SizedBox(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      meal.imageUrl,
                      height: UIScale.width(30),
                      width: UIScale.width(30),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
