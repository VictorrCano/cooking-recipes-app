import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/meal.dart';

class ChosenMealScreen extends StatelessWidget {
  final String mealId;
  const ChosenMealScreen({required this.mealId, super.key});

  @override
  Widget build(BuildContext context) {
    Meal chosenMeal = Meal(
      id: '',
      categories: [],
      title: '',
      affordability: Affordability.Luxurious,
      complexity: Complexity.Challenging,
      imageUrl: 'imageUrl',
      duration: 1,
      ingredients: [],
      steps: [],
      isGlutenFree: false,
      isVegan: false,
      isVegetarian: false,
      isLactoseFree: false,
    );
    for (var meal in DUMMY_MEALS) {
      if (meal.id == mealId) {
        chosenMeal = meal;
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(chosenMeal.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            child: Text(chosenMeal.affordability.name),
          ),
          Card(
            child: Text(chosenMeal.complexity.name),
          )
        ],
      ),
    );
  }
}
