import 'package:flutter/material.dart';

import './screens/categories_screen.dart';

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
      home:
          const CategoriesScreen(), //const MyHomePage(title: 'Meal Recipes App'),
    );
  }
}

/**

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: DUMMY_CATEGORIES.map((e) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: e.color,
              elevation: 5,
              child: Center(child: Text(e.title)),
            ),
          );
        }).toList(),
      ),
    );
  }
}

*/
