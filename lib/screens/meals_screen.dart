import 'package:cooking_recipes_app/screens/chosen_meal_screen.dart';
import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/meal.dart';
import '../models/category.dart';
import '../screens/filters_screen.dart';

class MealsScreen extends StatelessWidget {
  //Function _addFavorite;
  //MealsScreen(this._addFavorite, {super.key});

  @override
  Widget build(BuildContext context) {
    final passedArgs = ModalRoute.of(context)!.settings.arguments as Map;
    String chosenCategory = passedArgs['id'];
    List filters = passedArgs['filters'];

    bool _glutenFreeFilter = filters[0];
    bool _vegetarianFilter = filters[1];
    bool _veganFilter = filters[2];
    bool _lactoseFreeFilter = filters[3];

    List<Meal> mealsInCategory = [];
    List<Meal> filteredMeals = [];
    String chosenCategoryName = '';

    for (var cat in DUMMY_CATEGORIES) {
      if (cat.id == chosenCategory) {
        chosenCategoryName = cat.title;
      }
    }

    for (var meal in DUMMY_MEALS) {
      if (meal.categories.contains(chosenCategory) &&
          (meal.isGlutenFree == _glutenFreeFilter ||
              _glutenFreeFilter == false) &&
          (meal.isVegetarian == _vegetarianFilter ||
              _vegetarianFilter == false) &&
          (meal.isVegan == _veganFilter || _veganFilter == false) &&
          (meal.isLactoseFree == _lactoseFreeFilter ||
              _lactoseFreeFilter == false)) {
        mealsInCategory.add(meal);
      }
    }

    //void goToMealPage(BuildContext context, String id, Function function) {
    //  Navigator.of(context).pushNamed('/chosen-meal-screen',
    //      arguments: {'id': id, 'function': function});
    //}

    void goToMealPage(BuildContext context, String id) {
      Navigator.of(context).pushNamed('/chosen-meal-screen', arguments: id);
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
              //onTap: () => goToMealPage(context, e.id, _addFavorite),
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
