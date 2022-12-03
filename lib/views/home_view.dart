import 'package:arfudy_flutter/models/meal_model.dart';
import 'package:arfudy_flutter/views/widgets/ar_button.dart';
import 'package:arfudy_flutter/views/widgets/price_tag.dart';
import 'package:flutter/material.dart';

import '../utils/ui_colors.dart';
import '../utils/ui_scale.dart';
import '../utils/ui_text.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final List<MealModel> meals = MealModel.generateList();

  @override
  Widget build(BuildContext context) {
    UIScale.init(context);
    return Scaffold(
      backgroundColor: UIColors.backgroundColor,
      appBar: AppBar(
        title: const Text("Arfudy"),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: UIScale.width(2),
          right: UIScale.width(2),
          top: UIScale.width(2),
        ),
        child: ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) {
            return MealCard(meal: meals[index]);
          },
        ),
      ),
    );
  }
}

class MealCard extends StatelessWidget {
  const MealCard({Key? key, required this.meal}) : super(key: key);
  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      child: UIText(meal.name),
                      alignment: Alignment.topLeft,
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
                      ARButton(),
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
                      child: Image.network(meal.imageUrl),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
