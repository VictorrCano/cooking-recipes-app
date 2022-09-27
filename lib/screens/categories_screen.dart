import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import './meals_screen.dart';
import '../screens/filters_screen.dart';

class CategoriesScreen extends StatelessWidget {
  bool _glutenFreeFilter = false;
  bool _vegetarianFilter = false;
  bool _veganFilter = false;
  bool _lactoseFreeFilter = false;

  CategoriesScreen({super.key});

  void selectCategory(BuildContext context, String id) {
    Navigator.of(context).pushNamed('/meals-screen', arguments: {
      'id': id,
      'filters': [
        _glutenFreeFilter,
        _vegetarianFilter,
        _veganFilter,
        _lactoseFreeFilter
      ]
    });
  }

  void goToSettings(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/filters-screen', arguments: [
      _glutenFreeFilter,
      _vegetarianFilter,
      _veganFilter,
      _lactoseFreeFilter
    ]);
  }

  void goToCategories(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/', arguments: [
      _glutenFreeFilter,
      _vegetarianFilter,
      _veganFilter,
      _lactoseFreeFilter
    ]);
  }

  void goToFavorites(BuildContext context) {
    Navigator.of(context).pushNamed('/favorites-screen');
  }

  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context);
    if (route != null && route.settings.arguments != null) {
      final filterSettings = route.settings.arguments as List<bool>;
      _glutenFreeFilter = filterSettings[0];
      _vegetarianFilter = filterSettings[1];
      _veganFilter = filterSettings[2];
      _lactoseFreeFilter = filterSettings[3];
    }

    print(_glutenFreeFilter);
    print(_vegetarianFilter);
    print(_veganFilter);
    print(_lactoseFreeFilter);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Categories'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(height: 100),
            TextButton(
              onPressed: () => goToSettings(context),
              child: Text('Settings'),
            ),
            TextButton(
              onPressed: () => goToCategories(context),
              child: Text('Categories'),
            ),
            TextButton(
              onPressed: () => goToFavorites(context),
              child: Text('Favorites'),
            ),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: DUMMY_CATEGORIES.map((e) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () => selectCategory(context, e.id),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: e.color,
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
