import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/meal.dart';

class ChosenMealScreen extends StatelessWidget {
  Function _addFavorite;
  ChosenMealScreen(this._addFavorite, {super.key});

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;

    Meal chosenMeal = const Meal(
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
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.star,
              color: Colors.white,
            ),
            onPressed: () => _addFavorite(chosenMeal.id),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            margin: EdgeInsets.all(10),
            color: Colors.lightBlue,
            child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Text(chosenMeal.affordability.name)),
          ),
          Card(
            margin: EdgeInsets.all(10),
            color: Colors.lightBlue,
            child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Text(chosenMeal.complexity.name)),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.network(chosenMeal.imageUrl),
          ),
          Expanded(
            child: SizedBox(
              height: 400,
              width: 400,
              child: ListView(
                children: chosenMeal.steps.map(
                  (e) {
                    return Card(
                      margin: EdgeInsets.all(10),
                      color: Colors.grey,
                      child: Text(
                        e,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 1.8,
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
