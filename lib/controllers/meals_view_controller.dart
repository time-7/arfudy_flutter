import 'package:arfudy_flutter/services/core_http_client.dart';
import 'package:arfudy_flutter/services/error/exceptions.dart';
import 'package:arfudy_flutter/services/gateway.dart';
import 'package:get/get.dart';

import '../models/meal_model.dart';

class MealsViewController extends GetxController
    with StateMixin<List<MealModel>> {
  final meals = <MealModel>[].obs;

  final _gateway = Get.find<IHttpClient>();

  @override
  onInit() async {
    super.onInit();
    await getMeals();
  }

  getMeals() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await GatewayHandler.call<List<MealModel>>(
        requisitionCallback: () => _gateway.get('/products'),
        onSuccessCallback: (data) =>
            (data['data'] as List).map((e) => MealModel.fromJson(e)).toList(),
        exception: GetMealsNewException(),
      );
      meals.value = response.where((meal) => meal.isVisible == true).toList();

      change(meals, status: RxStatus.success());
    } catch (e) {
      e as NewCoreException;

      change(
        null,
        status: RxStatus.error(
          e.failureMessages.isNotEmpty ? e.failureMessages.first : e.label,
        ),
      );
    }
  }
}
