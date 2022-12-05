import '../models/meal_model.dart';
import 'base_http_client.dart';
import 'error/exceptions.dart';

class CoreGateway {
  static Future<List<MealModel>> getMeals() async {
    try {
      final Map<String, dynamic> data = await BaseHttpClient.getAsync("/pratos");
      final meals = (data['result'] as List).map((e) => MealModel.fromJson(e)).toList();
      //await Future.delayed(const Duration(seconds: 2));
      // final meals = MealModel.generateProxyList();
      return meals;
    } catch (exception, stacktrace) {
      throw GetMealsException(stacktrace, 'CoreGateway.getMeals');
    }
  }
}

class GetMealsService {
  static Future<List<MealModel>> call() async => await CoreGateway.getMeals();
}
