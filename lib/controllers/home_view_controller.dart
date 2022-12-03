import 'package:flutter/cupertino.dart';

import '../models/meal_model.dart';

enum HomeViewState { initial, loading, success, failure }

class HomeViewController extends ChangeNotifier {
  static final List<MealModel> _meals = [];
  static final ValueNotifier<HomeViewState> _state = ValueNotifier(HomeViewState.initial);

  static init() {
    _state.value = HomeViewState.loading;
    _state.notifyListeners();
  }
}
