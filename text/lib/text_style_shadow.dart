import 'package:flutter/material.dart';

class TextStyleShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.black,
        appBar: AppBar(title: Text('TextStyle.shadow')),
        body: Center(
          child: Text(
            'Shadow',
            style: TextStyle(

              fontSize: 64,
              color: Colors.white,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(4.0, 4.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                Shadow(
                  offset: Offset(4.0, 4.0),
                  blurRadius: 8.0,
                  color: Color.fromARGB(125, 255, 0, 0),
                ),
              ],
            ),
          ),
        ));
  }
}
