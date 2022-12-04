import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/meal_model.dart';
import 'error/exceptions.dart';

class BaseHttpClient {
  static const String _baseUrl = "";

  static Future<Map<String, dynamic>> getAsync<T>(String routeName) async {
    try {
      final String url = _baseUrl + routeName;
      Response response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      final Map<String, dynamic> result = json.decode(response.body);
      return result;
    } catch (exception, stacktrace) {
      throw GetBadRequisitionException(stacktrace, 'BadRequisition.GET', exception);
    }
  }
}

class CoreGateway {
  static Future<List<MealModel>> getMeals() async {
    try {
      final Map<String, dynamic> result = await BaseHttpClient.getAsync("/xxxxx");
      final meals = (result as List).map((e) => MealModel.fromJson(e)).toList();
      return meals;
    } catch (exception, stacktrace) {
      throw GetMealsException(stacktrace, 'CoreGateway.getMeals', exception);
    }
  }
}
