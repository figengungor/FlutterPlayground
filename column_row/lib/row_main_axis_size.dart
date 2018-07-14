import 'package:flutter/material.dart';

class RowMainAxisSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row MainAxisSize'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('MainAxisSize.max (default)'),
          Container(
            color: Colors.pink,
            child: Row(
              //mainAxisSize: MainAxisSize.max, //default
              children: <Widget>[
                Icon(Icons.person),
                Icon(Icons.person),
                Icon(Icons.person),
              ],
            ),
          ),
          Text('MainAxisSize.min '),
          Container(
            color: Colors.pink,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.person),
                Icon(Icons.person),
                Icon(Icons.person),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
