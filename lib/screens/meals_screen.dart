import 'package:cooking_recipes_app/screens/chosen_meal_screen.dart';
import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/meal.dart';
import '../models/category.dart';

class MealsScreen extends StatelessWidget {
  final String chosenCategory;
  const MealsScreen({required this.chosenCategory, super.key});

  @override
  Widget build(BuildContext context) {
    List<Meal> mealsInCategory = [];
    String chosenCategoryName = '';

    for (var cat in DUMMY_CATEGORIES) {
      if (cat.id == chosenCategory) {
        chosenCategoryName = cat.title;
      }
    }

    for (var meal in DUMMY_MEALS) {
      if (meal.categories.contains(chosenCategory)) {
        mealsInCategory.add(meal);
      }
    }

    void goToMealPage(BuildContext context, String id) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
            return ChosenMealScreen(mealId: id);
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(chosenCategoryName),
      ),
      body: ListView(
        //crossAxisCount: 2,
        children: mealsInCategory.map((e) {
          return SizedBox(
            height: 100,
            child: InkWell(
              onTap: () => goToMealPage(context, e.id),
              child: Card(
                margin: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.lightBlue,
                elevation: 5,
                child: Center(
                    child: Text(
                  e.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
