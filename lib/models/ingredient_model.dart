import '../utils/proxier.dart';
import 'nutrition_facts_model.dart';

class IngredientModel {
  final String name;
  final int quantity;
  final NutritionFactsModel nutritionFacts;

  IngredientModel({
    required this.name,
    required this.quantity,
    required this.nutritionFacts,
  });

  static IngredientModel generateProxySingle() => IngredientModel(
        name: proxyRandomAmountWords(4),
        quantity: proxyInt,
        nutritionFacts: NutritionFactsModel.generateProxySingle(),
      );

  static List<IngredientModel> generateProxyList({int lenght = 12}) =>
      List.generate(
        lenght,
        (index) => generateProxySingle(),
      );

  factory IngredientModel.fromJson(Map<String, dynamic> json) =>
      IngredientModel(
        name: json["name"],
        quantity: json["quantity"],
        nutritionFacts: NutritionFactsModel.fromJson(json["nutritionFacts"]),
      );

  @override
  String toString() {
    return 'IngredientModel{name: $name, quantity: $quantity, nutritionFacts: $nutritionFacts}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IngredientModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          quantity == other.quantity &&
          nutritionFacts == other.nutritionFacts;

  @override
  int get hashCode =>
      name.hashCode ^ quantity.hashCode ^ nutritionFacts.hashCode;
}
