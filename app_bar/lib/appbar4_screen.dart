import 'package:flutter/material.dart';

class AppBar4Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Menu Actions"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.map),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.directions),
              onPressed: () {},
            ),
          ],
        ),
      );
}
