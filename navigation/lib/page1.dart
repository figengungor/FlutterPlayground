import 'package:flutter/material.dart';
import 'package:navigation/page2.dart';

class Page1 extends StatelessWidget {
  final _title = 'Page 1';
  static const routeName = '/page1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Text(
              _title,
              style: TextStyle(fontSize: 60.0),
            ),
            Text('Navigator.pushReplacementNamed(context, Page2.routeName)'
                '\n\nWith pushReplacement method, '
                'Page 2 will be added with enter animation and '
                'Page 1 will be removed from stack. '
                '\nUsecase: Navigating from Login to Home'),
            RaisedButton(
              child: Text('Go Page 2 with pushReplacement'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, Page2.routeName);
              },
            ),
            Text('Navigator.popAndPushNamed(context, Page2.routeName)'
                '\n\nWith popAndPush method, '
                'Page 1 will be removed from stack with an exit animation and '
                'Page 2 will be displayed'),
            RaisedButton(
              child: Text('Go Page 2 with popAndPush'),
              onPressed: () {
                Navigator.popAndPushNamed(context, Page2.routeName);
              },
            ),
            RaisedButton(
              child: Text('Go Page 2'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Page2(isPage3Enabled: true)));
              },
            ),
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
