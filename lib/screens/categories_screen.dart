import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import './meals_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void selectCategory(BuildContext context, String id) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return MealsScreen(chosenCategory: id);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals App'),
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
