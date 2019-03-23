import 'package:flutter/material.dart';

class PhotoVerticalCard extends StatelessWidget {
  final double cardHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            child: Image.asset(
              'assets/images/card_image.jpg',
              width: double.infinity,
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            title: Text(
              'Beautiful Sunset',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
            ),
            subtitle: Text('by Unsplash'),
          ),
          ListTile(
            title: Text(
                "Lorem ipsum dolar amet. What a beatiful sunset. It ryhmes, doesn't it?"),
          ),
          ButtonTheme.bar(
            child: ButtonBar(
              children: <Widget>[
                FlatButton(onPressed: () {}, child: Text('READ')),
                FlatButton(onPressed: () {}, child: Text('BOOKMARK'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
