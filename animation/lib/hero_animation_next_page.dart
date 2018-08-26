import 'package:flutter/material.dart';

class HeroAnimationNextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero Animation Next Page')),
      body: Column(
        children: <Widget>[
          Hero(
            tag: 'placeholder',
            child: Container(
              height: 150.0,
              width: 100.0,
              child: Placeholder(),
            ),
          ),
        ],
      ),
    );
  }
}
