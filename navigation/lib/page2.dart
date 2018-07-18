import 'package:flutter/material.dart';
import 'package:navigation/page3.dart';

class Page2 extends StatelessWidget {
  Page2({this.isPage3Enabled});

  final bool isPage3Enabled;

  final _title = 'Page 2';
  static const routeName = '/page2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _title,
              style: TextStyle(fontSize: 40.0),
            ),
            SizedBox(
              height: 16.0,
            ),
            _getPage3NavigationButtonIfEnabled(context),
          ],
        ),
      ),
    );
  }

  _getPage3NavigationButtonIfEnabled(BuildContext context) {
    if (isPage3Enabled != null) {
      return RaisedButton(
        child: Text('Go Page 3'),
        onPressed: () {
          Navigator.pushNamed(context, Page3.routeName);
        },
      );
    } else {
      return Container();
    }
  }
}
