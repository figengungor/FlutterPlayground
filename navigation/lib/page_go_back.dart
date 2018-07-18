import 'package:flutter/material.dart';

class PageGoBack extends StatelessWidget {
  final _title = 'PageGoBack';
  static const routeName = '/pageGoBack';

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
              style: TextStyle(fontSize: 40.0),
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
