import 'package:flutter/material.dart';

import './screens/categories_screen.dart';
import './screens/meals_screen.dart';
import './screens/filters_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      },
    );
  }
}
