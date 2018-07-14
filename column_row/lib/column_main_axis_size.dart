import 'package:flutter/material.dart';

class ColumnMainAxisSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column MainAxisSize'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _getRotatedText('MainAxisSize.max (default)'),
        Container(
          color: Colors.pink,
          child: Column(
            //mainAxisSize: MainAxisSize.max, //default
            children: <Widget>[
              Icon(Icons.person),
              Icon(Icons.person),
              Icon(Icons.person),
            ],
          ),
        ),
        _getRotatedText('MainAxisSize.min '),
        Container(
          color: Colors.pink,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.person),
              Icon(Icons.person),
              Icon(Icons.person),
            ],
          ),
        ),
      ],
    );
  }

  _getRotatedText(String title) {
    return RotatedBox(
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
      quarterTurns: 3,
    );
  }
}
