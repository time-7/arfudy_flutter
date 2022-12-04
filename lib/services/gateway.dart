import '../models/meal_model.dart';
import 'error/exceptions.dart';

class CoreGateway {
  static Future<List<MealModel>> getMeals() async {
    try {
      //final Map<String, dynamic> result = await BaseHttpClient.getAsync("/xxxxx");
      //  final meals = (result as List).map((e) => MealModel.fromJson(e)).toList();
      await Future.delayed(const Duration(seconds: 2));
      final meals = MealModel.generateProxyList();
      return meals;
    } catch (exception, stacktrace) {
      throw GetMealsException(stacktrace, 'CoreGateway.getMeals');
    }
  }
}

class GetMealsService {
  static Future<List<MealModel>> call() async => CoreGateway.getMeals();
}
