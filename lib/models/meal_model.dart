import '../utils/proxier.dart';
import 'ingredient_model.dart';

class MealModel {
  final int id;
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

  static MealModel generateProxySingle() => MealModel(
      id: proxyInt,
      name: proxyRandomAmountWords(8),
      description: proxyWords(20),
      imageUrl: proxyImgUrl,
      has3d: proxyBool,
      mealPrice: (proxyDouble * 100).toStringAsFixed(2),
      nutritionalValue: proxyDouble,
      ingredients: IngredientModel.generateProxyList(lenght: 5));

  static List<MealModel> generateProxyList({int lenght = 12}) => List.generate(
        lenght,
        (index) => generateProxySingle(),
      );

  factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
      id: json["idPrato"],
      name: json["nome"],
      description: json["dsPrato"],
      imageUrl: json["imagem"],
      has3d: json["has3d"],
      mealPrice: json["valor"].toString(),
      nutritionalValue: json["valorNutricional"],
      ingredients: List<IngredientModel>.from(json["ingredienteList"].map((x) => IngredientModel.fromJson(x))));
}
