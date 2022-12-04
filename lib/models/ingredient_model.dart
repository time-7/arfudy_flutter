import '../utils/proxier.dart';

class IngredientModel {
  final String id;
  final String name;

  IngredientModel({
    required this.id,
    required this.name,
  });

  static IngredientModel generateProxySingle() => IngredientModel(
        id: proxyInts.toString(),
        name: proxyRandomAmountWords(4),
      );

  static List<IngredientModel> generateProxyList({int lenght = 12}) => List.generate(
        lenght,
        (index) => generateProxySingle(),
      );

  factory IngredientModel.fromJson(Map<String, dynamic> json) => IngredientModel(
        //TODO IMPLEMENT MAP
        id: json["id"],
        name: json["name"],
      );
}
