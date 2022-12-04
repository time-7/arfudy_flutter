// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:arfudy_flutter/models/ingredient_model.dart';
import 'package:arfudy_flutter/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:arfudy_flutter/main.dart';

void main() {
  test('Should retrieve a List<IngredientModel> from JSON', () {
    List<IngredientModel> testIngredients = [
      IngredientModel(id: '01', name: 'acucar'),
      IngredientModel(id: '02', name: 'tempero'),
      IngredientModel(id: '03', name: 'tudo que ha de bom'),
    ];

    final json = {
      'itens': [
        {
          'id': '01',
          'name': 'acucar',
        },
        {
          'id': '02',
          'name': 'tempero',
        },
        {
          'id': '03',
          'name': 'tudo que ha de bom',
        },
      ]
    };

    final List<IngredientModel> ingredients = (json['itens'] as List).map((e) => IngredientModel.fromJson(e)).toList();
    expect(testIngredients[0].id, ingredients[0].id);
    expect(testIngredients[0].name, ingredients[0].name);
    expect(testIngredients[1].id, ingredients[1].id);
    expect(testIngredients[1].name, ingredients[1].name);
    expect(testIngredients[2].id, ingredients[2].id);
    expect(testIngredients[2].name, ingredients[2].name);
  });

  test('Should retrieve a List<MealModel> from JSON', () {
    List<IngredientModel> testIngredients = [
      IngredientModel(id: '01', name: 'acucar'),
      IngredientModel(id: '02', name: 'tempero'),
      IngredientModel(id: '03', name: 'tudo que ha de bom'),
    ];

    List<MealModel> testMeals = [
      MealModel(
          id: '01',
          name: 'meninas super poderosas',
          description: 'dfsfsdfdsf',
          imageUrl: 'fdfsf,d',
          has3d: true,
          mealPrice: '12,12',
          nutritionalValue: 12.23,
          ingredients: testIngredients),
      MealModel(
          id: '02',
          name: 'pao com linguica',
          description: 'fsdfdsf',
          imageUrl: 'asdfasdf',
          has3d: false,
          mealPrice: '15,12',
          nutritionalValue: 5.2,
          ingredients: testIngredients),
    ];

    final json = {
      'itens': [
        {
          'id': '01',
          'name': 'meninas super poderosas',
          'description': 'dfsfsdfdsf',
          'imageUrl': 'fdfsf,d',
          'has3d': true,
          'mealPrice': '12,12',
          'nutritionalValue': 12.23,
          'ingredients': [
            {
              'id': '01',
              'name': 'acucar',
            },
            {
              'id': '02',
              'name': 'tempero',
            },
            {
              'id': '03',
              'name': 'tudo que ha de bom',
            },
          ]
        },
        {
          'id': '02',
          'name': 'pao com linguica',
          'description': 'fsdfdsf',
          'imageUrl': 'asdfasdf',
          'has3d': false,
          'mealPrice': '15,12',
          'nutritionalValue': 5.2,
          'ingredients': [
            {
              'id': '01',
              'name': 'acucar',
            },
            {
              'id': '02',
              'name': 'tempero',
            },
            {
              'id': '03',
              'name': 'tudo que ha de bom',
            },
          ]
        },
      ]
    };

    final List<MealModel> meals = (json['itens'] as List).map((e) => MealModel.fromJson(e)).toList();
    expect(testMeals[0].id, meals[0].id);
    expect(testMeals[1].id, meals[1].id);
    expect(testMeals[0].imageUrl, meals[0].imageUrl);
    expect(testMeals[1].nutritionalValue, meals[1].nutritionalValue);
    expect(testMeals[0].ingredients[0].id, meals[0].ingredients[0].id);
    expect(testMeals[1].ingredients[1].name, meals[1].ingredients[1].name);
  });
}
