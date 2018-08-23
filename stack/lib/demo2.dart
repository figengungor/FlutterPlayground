import 'package:flutter/material.dart';

class Demo2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo 2')),
      body: _getBody(),
    );
  }

  Widget _getBody() => Stack(
        children: <Widget>[
          Container(
            color: Colors.pink,
          ),
          Positioned(
            //how far top of the widget from the top of the stack
            top: 0.0,
            //how far left of the widget from the left of the stack
            left: 0.0,
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.white,
            ),
          ),
          Positioned(
            top: 0.0,
            right: 0.0,
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.white,
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.white,
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.white,
            ),
          ),
        ],
      );
}
