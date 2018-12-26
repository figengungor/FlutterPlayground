import 'package:flutter/material.dart';

class TextStyleForegroundBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Foreground Background')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            Text(
              'TextStyle.background\n\n'
                  'Paint()\n'
                  '..style=PaintingStyle.stroke\n'
                  '..strokeJoin=StrokeJoin.round\n'
                  '..color = Colors.red\n'
                  '..strokeWidth = 2\n',
              style: TextStyle(
                  fontSize: 20,
                  background: Paint()
                    //stroke or filled
                    ..style = PaintingStyle.stroke
                    //stroke corners shape
                    ..strokeJoin = StrokeJoin.round
                    ..color = Colors.red
                    ..strokeWidth = 2),
            ),
            Text(
              'TextStyle.background\n\n'
                  'Paint()\n'
                  '..style=PaintingStyle.fill\n'
                  '..color = Colors.red\n',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  background: Paint()
                    //stroke or filled
                    ..style = PaintingStyle.fill
                    ..color = Colors.red),
            ),
            Text(
              'TextStyle.foreground\n\n'
                  'Paint()\n'
                  '..style=PaintingStyle.stroke\n'
                  '..color = Colors.red\n'
                  '..strokeWidth = 2\n',
              style: TextStyle(
                  fontSize: 20,
                  foreground: Paint()
                    //stroke or filled
                    ..style = PaintingStyle.stroke
                    ..color = Colors.red
                    ..strokeWidth = 1),
            )
          ],
        ));
  }
}
