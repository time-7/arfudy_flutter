import '../utils/proxier.dart';

class NutritionFactsModel {
  final int carbohydrate;
  final int protein;
  final int totalFat;
  final int totalCalories;

  NutritionFactsModel({
    required this.carbohydrate,
    required this.protein,
    required this.totalFat,
    required this.totalCalories,
  });

  static NutritionFactsModel generateProxySingle() => NutritionFactsModel(
        carbohydrate: proxyInt,
        protein: proxyInt,
        totalFat: proxyInt,
        totalCalories: proxyInt,
      );

  factory NutritionFactsModel.fromJson(Map<String, dynamic> json) =>
      NutritionFactsModel(
        carbohydrate: json["carbohydrate"],
        protein: json["protein"],
        totalFat: json["totalFat"],
        totalCalories: json["totalCalories"],
      );

  @override
  String toString() {
    return 'NutritionFactsModel{carbohydrate: $carbohydrate, protein: $protein, totalFat: $totalFat, totalCalories: $totalCalories}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NutritionFactsModel &&
          runtimeType == other.runtimeType &&
          carbohydrate == other.carbohydrate &&
          protein == other.protein &&
          totalFat == other.totalFat &&
          totalCalories == other.totalCalories;

  @override
  int get hashCode =>
      carbohydrate.hashCode ^
      protein.hashCode ^
      totalFat.hashCode ^
      totalCalories.hashCode;
}
