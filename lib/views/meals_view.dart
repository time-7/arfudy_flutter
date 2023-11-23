import 'package:arfudy_flutter/controllers/meals_view_controller.dart';
import 'package:arfudy_flutter/views/widgets/arfudy_new_scaffold.dart';
import 'package:arfudy_flutter/views/widgets/center_text.dart';
import 'package:arfudy_flutter/views/widgets/meal_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MealsView extends GetView<MealsViewController> {
  const MealsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ArfudyNewScaffold(
      body: RefreshIndicator(
        onRefresh: () => controller.getMeals(),
        child: controller.obx(
            (meals) => ListView.builder(
                  itemCount: meals?.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: MealCard(
                      meal: meals![index],
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  shrinkWrap: true,
                ),
            onEmpty: CenterText.empty,
            onError: (error) => CenterText.error),
      ),
    );
  }
}
