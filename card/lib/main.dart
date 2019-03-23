import 'package:card/photo_horizontal_card.dart';
import 'package:card/photo_vertical_card.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Card Playground'),
        ),
        body: ListView(
          children: <Widget>[
            PhotoHorizontalCard(),
            PhotoVerticalCard(),
          ],
        ));
  }
}
