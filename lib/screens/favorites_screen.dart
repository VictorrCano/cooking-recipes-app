import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class FavoritesScreen extends StatefulWidget {
  final List<String> _favoritesList;
  final Function _removeFavorite;
  const FavoritesScreen(this._favoritesList, this._removeFavorite, {super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorties'),
      ),
      body: ListView.builder(
          itemCount: widget._favoritesList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () => setState(() {
                        widget._removeFavorite(index);
                      })),
              title: Text(DUMMY_MEALS
                  .firstWhere(
                      (element) => element.id == widget._favoritesList[index])
                  .title),
            );
          }),
    );
  }
}
