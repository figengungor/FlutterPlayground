import 'package:flutter/material.dart';

class SimpleCardDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Card Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/card_image.jpg',
                    width: double.infinity,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                  ListTile(
                    title: Text(
                      'Beautiful Sunset',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18.0),
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
            ),
          ],
        ),
      ),
    );
  }
}
