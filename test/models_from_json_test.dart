// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:arfudy_flutter/models/ingredient_model.dart';
import 'package:arfudy_flutter/models/meal_model.dart';
import 'package:arfudy_flutter/models/nutrition_facts_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should retrieve a List<IngredientModel> from JSON', () {
    NutritionFactsModel testNuNutritionFacts = NutritionFactsModel(
      carbohydrate: 1,
      protein: 2,
      totalFat: 3,
      totalCalories: 4,
    );

    List<IngredientModel> testIngredients = [
      IngredientModel(
        quantity: 1,
        name: 'acucar',
        nutritionFacts: testNuNutritionFacts,
      ),
      IngredientModel(
        quantity: 2,
        name: 'tempero',
        nutritionFacts: testNuNutritionFacts,
      ),
      IngredientModel(
        quantity: 3,
        name: 'tudo que ha de bom',
        nutritionFacts: testNuNutritionFacts,
      ),
    ];

    final json = {
      'result': [
        {
          'quantity': 1,
          'name': 'acucar',
          'nutritionFacts': {
            "carbohydrate": 1,
            "protein": 2,
            "totalFat": 3,
            "totalCalories": 4
          },
        },
        {
          'quantity': 2,
          'name': 'tempero',
          'nutritionFacts': {
            "carbohydrate": 1,
            "protein": 2,
            "totalFat": 3,
            "totalCalories": 4
          },
        },
        {
          'quantity': 3,
          'name': 'tudo que ha de bom',
          'nutritionFacts': {
            "carbohydrate": 1,
            "protein": 2,
            "totalFat": 3,
            "totalCalories": 4
          },
        },
      ]
    };

    final List<IngredientModel> ingredients = (json['result'] as List)
        .map((e) => IngredientModel.fromJson(e))
        .toList();
    expect(testIngredients[0].quantity, ingredients[0].quantity);
    expect(testIngredients[0].name, ingredients[0].name);
    expect(testIngredients[0].nutritionFacts, ingredients[0].nutritionFacts);
    expect(testIngredients[1].quantity, ingredients[1].quantity);
    expect(testIngredients[1].name, ingredients[1].name);
    expect(testIngredients[1].nutritionFacts, ingredients[1].nutritionFacts);
    expect(testIngredients[2].quantity, ingredients[2].quantity);
    expect(testIngredients[2].name, ingredients[2].name);
    expect(testIngredients[2].nutritionFacts, ingredients[2].nutritionFacts);
  });

  test('Should retrieve a List<MealModel> from JSON', () {
    NutritionFactsModel testNuNutritionFacts = NutritionFactsModel(
      carbohydrate: 1,
      protein: 2,
      totalFat: 3,
      totalCalories: 4,
    );

    List<IngredientModel> testIngredients = [
      IngredientModel(
        quantity: 1,
        name: 'acucar',
        nutritionFacts: testNuNutritionFacts,
      ),
      IngredientModel(
        quantity: 2,
        name: 'tempero',
        nutritionFacts: testNuNutritionFacts,
      ),
      IngredientModel(
        quantity: 3,
        name: 'tudo que ha de bom',
        nutritionFacts: testNuNutritionFacts,
      ),
    ];

    List<MealModel> testMeals = [
      MealModel(
        id: '01',
        name: 'meninas super poderosas',
        description: 'dfsfsdfdsf',
        imageUrl: 'fdfsf,d',
        has3dModel: true,
        price: 12.12,
        nutritionFacts: testNuNutritionFacts,
        ingredients: testIngredients,
        isVisible: true,
      ),
      MealModel(
        id: '02',
        name: 'pao com linguica',
        description: 'fsdfdsf',
        imageUrl: 'asdfasdf',
        has3dModel: false,
        price: 15.12,
        nutritionFacts: testNuNutritionFacts,
        ingredients: testIngredients,
        isVisible: true,
      ),
    ];

    final json = {
      'result': [
        {
          'id': '01',
          'name': 'meninas super poderosas',
          'description': 'dfsfsdfdsf',
          'imageUrl': 'fdfsf,d',
          'has3dModel': true,
          'isVisible': true,
          'price': 12.12,
          'nutritionFacts': {
            "carbohydrate": 1,
            "protein": 2,
            "totalFat": 3,
            "totalCalories": 4
          },
          'ingredients': [
            {
              "name": "acucar",
              "quantity": 1,
              "nutritionFacts": {
                "carbohydrate": 1,
                "protein": 2,
                "totalFat": 3,
                "totalCalories": 4
              }
            },
            {
              "name": "tempero",
              "quantity": 2,
              "nutritionFacts": {
                "carbohydrate": 1,
                "protein": 2,
                "totalFat": 3,
                "totalCalories": 4
              }
            },
            {
              "name": "tudo que ha de bom",
              "quantity": 3,
              "nutritionFacts": {
                "carbohydrate": 1,
                "protein": 2,
                "totalFat": 3,
                "totalCalories": 4
              }
            }
          ]
        },
        {
          'id': '02',
          'name': 'pao com linguica',
          'description': 'fsdfdsf',
          'imageUrl': 'asdfasdf',
          'has3dModel': false,
          'isVisible': true,
          'price': 15.12,
          'nutritionFacts': {
            "carbohydrate": 1,
            "protein": 2,
            "totalFat": 3,
            "totalCalories": 4
          },
          'ingredients': [
            {
              "name": "acucar",
              "quantity": 1,
              "nutritionFacts": {
                "carbohydrate": 1,
                "protein": 2,
                "totalFat": 3,
                "totalCalories": 4
              }
            },
            {
              "name": "tempero",
              "quantity": 2,
              "nutritionFacts": {
                "carbohydrate": 1,
                "protein": 2,
                "totalFat": 3,
                "totalCalories": 4
              }
            },
            {
              "name": "tudo que ha de bom",
              "quantity": 3,
              "nutritionFacts": {
                "carbohydrate": 1,
                "protein": 2,
                "totalFat": 3,
                "totalCalories": 4
              }
            }
          ]
        },
      ]
    };

    final List<MealModel> meals =
        (json['result'] as List).map((e) => MealModel.fromJson(e)).toList();
    expect(testMeals[0].id, meals[0].id);
    expect(testMeals[1].id, meals[1].id);
    expect(testMeals[0].imageUrl, meals[0].imageUrl);
    expect(testMeals[1].nutritionFacts, meals[1].nutritionFacts);
    expect(testMeals[0].ingredients[0].name, meals[0].ingredients[0].name);
    expect(testMeals[1].ingredients[1].name, meals[1].ingredients[1].name);
  });
}
