import 'package:flutter/material.dart';

class ListTileDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Using ListTile'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('Simple ListTile Item Title 1'),
        ),
        ListTile(
          title: Text('Simple ListTile Item Title 2'),
          leading: Icon(Icons.map),
        ),
        ListTile(
          title: Text('Simple ListTile Item Title 3'),
          subtitle: Text('Subtitle 3'),
        ),
        ListTile(
          title: Text('Simple ListTile Item Title 4'),
          trailing: Icon(Icons.delete_forever),
        ),
      ],
    );
  }
}
