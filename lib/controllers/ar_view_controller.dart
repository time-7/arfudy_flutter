import 'package:arfudy_flutter/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class ArViewController extends ChangeNotifier {
  late UnityWidgetController controller;
  late MealModel meal;

  onUnityCreated(UnityWidgetController controller) {
    this.controller = controller;
    loadMeal();
  }

  loadMeal() {
    controller.postMessage('ArController', 'LoadMeal', meal.id.toString());
  }
}
