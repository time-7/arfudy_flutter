import '../utils/proxier.dart';
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

  static MealModel generateSingle() => MealModel(
      id: proxyInts.toString(),
      name: proxyRandomAmountWords(8),
      description: proxyWords(20),
      imageUrl: proxyImgUrl,
      has3d: proxyBool,
      mealPrice: (proxyDouble * 100).toStringAsFixed(2),
      nutritionalValue: proxyDouble,
      ingredients: IngredientModel.generateList(lenght: 5));

  static List<MealModel> generateList({int lenght = 12}) => List.generate(
        lenght,
        (index) => generateSingle(),
      );
}
