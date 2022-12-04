import '../utils/proxier.dart';

class IngredientModel {
  final String id;
  final String name;

  IngredientModel({
    required this.id,
    required this.name,
  });

  static IngredientModel generateSingle() => IngredientModel(
        id: proxyInts.toString(),
        name: proxyRandomAmountWords(4),
      );

  static List<IngredientModel> generateList({int lenght = 12}) => List.generate(
        lenght,
        (index) => generateSingle(),
      );

  factory IngredientModel.fromJson(Map<String, dynamic> json) => IngredientModel(
        //TODO IMPLEMENT MAP
        id: json["xxxxx"],
        name: json["xxxxx"],
      );
}
