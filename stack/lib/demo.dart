import 'package:flutter/material.dart';

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo')),
      body: _getBody(),
    );
  }

  Widget _getBody() => Stack(
        //alignment: Alignment(-1.0, -1.0), //TOP-LEFT
        //alignment: Alignment.topLeft, //TOP-LEFT
        //alignment: Alignment(1.0, -1.0), //TOP-RIGHT
        //alignment: Alignment.topRight, //TOP-RIGHT
        //alignment: Alignment(-1.0, 1.0), //BOTTOM_LEFT
        //alignment: Alignment.bottomLeft, //BOTTOM_LEFT
        //alignment: Alignment(1.0, 1.0), //BOTTOM-RIGHT
        //alignment: Alignment.bottomRight, //BOTTOM-RIGHT
        //alignment: Alignment(0.0, 0.0), //CENTER
        alignment: Alignment.center, //CENTER
        children: <Widget>[
          Container(
            color: Colors.pink,
          ),
          Container(
            width: 100.0,
            height: 100.0,
            color: Colors.white,
          ),
        ],
      );
}
