import '../utils/proxier.dart';
import 'ingredient_model.dart';
import 'nutrition_facts_model.dart';

class MealModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final bool isVisible;
  final bool has3dModel;
  final String? unityModelId;
  final double price;
  final NutritionFactsModel nutritionFacts;
  final List<IngredientModel> ingredients;

  MealModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.isVisible,
    this.unityModelId,
    required this.has3dModel,
    required this.price,
    required this.nutritionFacts,
    required this.ingredients,
  });

  static MealModel generateProxySingle() => MealModel(
      id: '123456789',
      name: proxyRandomAmountWords(8),
      description: proxyWords(20),
      imageUrl: proxyImgUrl,
      has3dModel: proxyBool,
      price: (proxyDouble * 100),
      isVisible: true,
      nutritionFacts: NutritionFactsModel.generateProxySingle(),
      ingredients: IngredientModel.generateProxyList(lenght: 5));

  static List<MealModel> generateProxyList({int lenght = 12}) => List.generate(
        lenght,
        (index) => generateProxySingle(),
      );

  factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
        id: json["id"].toString(),
        name: json["name"].toString(),
        description: json["description"].toString(),
        imageUrl: json["imageUrl"].toString(),
        has3dModel: json["has3dModel"],
        price: double.parse(json["price"].toString()),
        nutritionFacts: NutritionFactsModel.fromJson(json["nutritionFacts"]),
        isVisible: json["isVisible"],
        ingredients: List<IngredientModel>.from(
          json["ingredients"].map(
            (x) => IngredientModel.fromJson(x),
          ),
        ),
      );

  @override
  String toString() {
    return 'MealModel{id: $id, name: $name, description: $description, imageUrl: $imageUrl, isVisible: $isVisible, has3dModel: $has3dModel, unityModelId: $unityModelId, price: $price, nutritionFacts: $nutritionFacts, ingredients: $ingredients}';
  }
}
