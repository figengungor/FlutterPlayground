import 'package:flutter/material.dart';

class Demo4Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo 4')),
      body: _getBody(),
    );
  }

  Widget _getBody() => Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            color: Colors.pink,
          ),
          Container(
            width: 100.0,
            height: 100.0,
            color: Colors.white,
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.white,
            ),
          )
        ],
      );
}
