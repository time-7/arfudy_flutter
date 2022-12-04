import 'package:flutter/cupertino.dart';

import '../models/meal_model.dart';
import '../services/base_http_client.dart';

enum HomeViewState { initial, loading, success, failure }

class HomeViewController extends ChangeNotifier {
  static List<MealModel> _meals = [];
  static final ValueNotifier<HomeViewState> _state = ValueNotifier(HomeViewState.initial);

  static ValueNotifier<HomeViewState> get state => _state;
  static List<MealModel> get meals => _meals;

  static init() {
    _meals = [];
    _state.value = HomeViewState.loading;
    _state.notifyListeners();
    _getMeals();
  }

  static _getMeals() async {
    try {
      _meals = await GetMealsService.call();
      _state.value = HomeViewState.success;
      _state.notifyListeners();
    } catch (e) {
      _state.value = HomeViewState.failure;
      _state.notifyListeners();
    }
  }
}
