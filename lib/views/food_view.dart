import 'package:arfudy_flutter/views/widgets/arfudy_scaffold.dart';
import 'package:flutter/material.dart';

import '../models/meal_model.dart';
import '../utils/ui_scale.dart';
import '../utils/ui_text.dart';

class FoodView extends StatelessWidget {
  const FoodView({Key? key, required this.meal}) : super(key: key);
  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return ArfudyScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: UIScale.height(2)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: UIScale.height(1),
              ),
              Container(
                width: UIScale.width(100),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: UIScale.height(2)),
                      child: UIText(
                        meal.name,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: UIScale.height(2)),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              meal.imageUrl,
                              height: UIScale.width(50),
                              width: UIScale.width(50),
                              fit: BoxFit.cover,
                            ),
                          ),
                          StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                            return AnimatedOpacity(
                              duration: const Duration(seconds: 2),
                              opacity: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                height: UIScale.width(50),
                                width: UIScale.width(50),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(UIScale.height(2)),
                      child: UIText(meal.description, textAlign: TextAlign.justify),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: UIScale.height(1),
              ),
              Container(
                padding: EdgeInsets.only(top: UIScale.height(2), bottom: UIScale.height(1)),
                width: UIScale.width(100),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    const UIText(
                      "Ingredientes",
                      fontWeight: FontWeight.bold,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: UIScale.height(2)),
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: meal.ingredients.length,
                          itemBuilder: ((context, index) {
                            return Column(
                              children: [
                                UIText(meal.ingredients[index].name, fontSize: UIScale.width(5)),
                                const Divider()
                              ],
                            );
                          })),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: UIScale.height(1),
              ),
              Container(
                padding: EdgeInsets.only(top: UIScale.height(2), bottom: UIScale.height(1)),
                width: UIScale.width(100),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        const UIText(
                          "Valor Nutricional",
                          fontWeight: FontWeight.bold,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: UIScale.height(2)),
                          child: UIText(
                            "${meal.nutritionalValue} Kcal",
                            fontSize: UIScale.width(5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
