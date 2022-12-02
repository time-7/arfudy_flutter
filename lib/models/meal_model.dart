import 'ingredient_model.dart';

class MealModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final bool has3d;
  final String mealPrice;
  final double nutritionalValue;
  final List<IngredientModel> ingredients;

  MealModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.has3d,
    required this.mealPrice,
    required this.nutritionalValue,
    required this.ingredients,
  });
}
