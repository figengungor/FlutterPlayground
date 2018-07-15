import 'package:clip_path/diagonal_image.dart';
import 'package:flutter/material.dart';

class DiagonalImageExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DiagonalImage Examples'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return ListView(
      children: <Widget>[
        DiagonalImage(
          image: Image.asset('assets/images/backdrop.jpg'),
          clipHeight: 90.0,
        ),
        DiagonalImage(
          image: Image.asset('assets/images/backdrop.jpg'),
          position: Position.BOTTOM_RIGHT,
          clipHeight: 90.0,
        ),
        DiagonalImage(
          image: Image.asset('assets/images/backdrop.jpg'),
          position: Position.TOP_LEFT,
          clipHeight: 90.0,
        ),
        DiagonalImage(
          image: Image.asset('assets/images/backdrop.jpg'),
          position: Position.TOP_RIGHT,
          clipHeight: 90.0,
        ),
      ]
          .map((item) => Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: item,
              ))
          .toList(),
    );
  }
}
