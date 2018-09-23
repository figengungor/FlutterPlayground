import 'package:flutter/material.dart';

class IconAndLabelButtonTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          RaisedButton.icon(
            icon: Icon(Icons.send),
            label: Text('Send'),
            color: Colors.green,
            textColor: Colors.white,
            onPressed: () {},
          ),
          FlatButton.icon(
            icon: Icon(Icons.mic),
            label: Text('Speak'),
            textColor: Colors.pink,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
