import 'package:flutter/material.dart';

class PageReceivesData extends StatelessWidget {
  PageReceivesData(this._data);

  final _title = 'Page Receives Data';
  final String _data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _title,
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              'Received data: $_data',
              style: TextStyle(color: Colors.red),
            ),
            Text('Navigator.pop(context)'),
            RaisedButton(
              child: Text('Go back'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ]
              .map((item) => Padding(
                    padding: EdgeInsets.all(8.0),
                    child: item,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
