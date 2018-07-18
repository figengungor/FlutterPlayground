import 'package:flutter/material.dart';

class BasicList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic ListView'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: <Widget>[
        Text('Simple List Item Text 1'),
        Text('Simple List Item Text 2'),
        Text('Simple List Item Text 3'),
        Text('Simple List Item Text 4'),
      ],
    );
  }
}
