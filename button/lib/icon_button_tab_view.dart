import 'package:flutter/material.dart';

class IconButtonTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.star_border),
            tooltip: 'Add to favorite',
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.star),
            tooltip: 'Remove from favorites',
            color: Colors.yellow,
            splashColor: Colors.lightBlue,
            highlightColor: Colors.lightBlue,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            tooltip: 'Like',
            color: Colors.red,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
