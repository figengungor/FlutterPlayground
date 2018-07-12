import 'dart:math';

import 'package:flutter/material.dart';

class GestureDetector1 extends StatefulWidget {
  @override
  GestureDetector1State createState() {
    return new GestureDetector1State();
  }
}

class GestureDetector1State extends State<GestureDetector1> {
  Color _buttonColor = Colors.blue;
  Color _backgroundColor = Colors.white;
  Color _buttonTextColor = Colors.white;
  final random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture Detector 1'),
      ),
      body: _getBody(context),
      backgroundColor: _backgroundColor,
    );
  }

  _getBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Tap Once to change Button color',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'Double Tap to change Background color',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'Long press to change Button text color',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
          _getCustomButton(context)
        ]
            .map((i) => Padding(
                  padding: EdgeInsets.all(8.0),
                  child: i,
                ))
            .toList(),
      ),
    );
  }

  _getCustomButton(BuildContext context) {
    return GestureDetector(
      onTap: _changeButtonColor,
      onDoubleTap: _changeBackgroundColor,
      onLongPress: _changeButtonTextColor,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: _buttonColor,
        ),
        child: Text(
          'Tap Me'.toUpperCase(),
          style: TextStyle(
            fontSize: 20.0,
            color: _buttonTextColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  _changeButtonColor() {
    int r = random.nextInt(255);
    int g = random.nextInt(255);
    int b = random.nextInt(255);
    print("button rgb $r $g $b");
    setState(() {
      _buttonColor = Color.fromARGB(255, r, g, b);
    });
  }

  _changeBackgroundColor() {
    int r = random.nextInt(255);
    int g = random.nextInt(255);
    int b = random.nextInt(255);
    print("background rgb $r $g $b");
    setState(() {
      _backgroundColor = Color.fromARGB(255, r, g, b);
    });
  }

  _changeButtonTextColor() {
    int r = random.nextInt(255);
    int g = random.nextInt(255);
    int b = random.nextInt(255);
    print("button text rgb $r $g $b");
    setState(() {
      _buttonTextColor = Color.fromARGB(255, r, g, b);
    });
  }
}
