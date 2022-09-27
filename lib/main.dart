import 'package:flutter/material.dart';

import './screens/categories_screen.dart';
import './screens/meals_screen.dart';
import './screens/filters_screen.dart';
import './screens/chosen_meal_screen.dart';
import './screens/favorites_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<String> favorites = [];

  MyApp({super.key});

  void addFavorite(String toAdd) {
    favorites.add(toAdd);
  }

  void removeFavorite(int index) {
    favorites.removeAt(index);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => CategoriesScreen(),
        '/meals-screen': (context) => MealsScreen(),
        '/filters-screen': (context) => const FiltersScreen(),
        '/chosen-meal-screen': (context) => ChosenMealScreen(addFavorite),
        '/favorites-screen': (context) =>
            FavoritesScreen(favorites, removeFavorite)
      },
    );
  }
}
