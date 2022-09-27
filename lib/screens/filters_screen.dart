import 'package:flutter/material.dart';

import './categories_screen.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeSwitch = false;
  bool _vegetarianSwitch = false;
  bool _veganSwitch = false;
  bool _lactoseFreeSwitch = false;

  @override
  void initState() {
    super.initState();
    // future that allows us to access context.
    Future.delayed(Duration.zero, () {
      setState(() {
        final route = ModalRoute.of(context);
        if (route != null && route.settings.arguments != null) {
          final filterSettings = route.settings.arguments as List<bool>;
          _glutenFreeSwitch = filterSettings[0];
          _vegetarianSwitch = filterSettings[1];
          _veganSwitch = filterSettings[2];
          _lactoseFreeSwitch = filterSettings[3];
        }
      });
    });
  }

  void goToSettings(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/filters-screen', arguments: [
      _glutenFreeSwitch,
      _vegetarianSwitch,
      _veganSwitch,
      _lactoseFreeSwitch
    ]);
  }

  void goToCategories(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/', arguments: [
      _glutenFreeSwitch,
      _vegetarianSwitch,
      _veganSwitch,
      _lactoseFreeSwitch
    ]);
  }

  void goToFavorites(BuildContext context) {
    Navigator.of(context).pushNamed('/favorites-screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        //leading: IconButton(
        //  icon: Icon(Icons.arrow_back, color: Colors.black),
        //  onPressed: () => Navigator.of(context).pop(),
        //),
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
              child: const Text('Categories'),
            ),
            TextButton(
              onPressed: () => goToFavorites(context),
              child: Text('Favorites'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 80),
            Text('Apply Gluten Free filter'),
            Switch(
              value: _glutenFreeSwitch,
              onChanged: (_) {
                setState(() {
                  _glutenFreeSwitch = !_glutenFreeSwitch;
                });
              },
            ),
            SizedBox(height: 60),
            Text('Apply Vegetarian filter'),
            Switch(
              value: _vegetarianSwitch,
              onChanged: (_) {
                setState(() {
                  _vegetarianSwitch = !_vegetarianSwitch;
                });
              },
            ),
            SizedBox(height: 60),
            Text('Apply Vegan filter'),
            Switch(
              value: _veganSwitch,
              onChanged: (_) {
                setState(() {
                  _veganSwitch = !_veganSwitch;
                });
              },
            ),
            SizedBox(height: 60),
            Text('Apply Lactose Free filter'),
            Switch(
              value: _lactoseFreeSwitch,
              onChanged: (_) {
                setState(() {
                  _lactoseFreeSwitch = !_lactoseFreeSwitch;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
