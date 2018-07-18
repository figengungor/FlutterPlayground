import 'package:flutter/material.dart';
import 'package:navigation/login_page.dart';
import 'package:navigation/page1.dart';

class Page3 extends StatelessWidget {
  final _title = 'Page 3';
  static const routeName = '/page3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
            Text(
              _title,
              style: TextStyle(fontSize: 40.0),
            ),
            SizedBox(
              height: 16.0,
            ),
            Text('Remove every page from stack up to Page 1'),
            RaisedButton(
              child: Text('popUntil Page 1'),
              onPressed: () {
                Navigator.popUntil(
                    context, ModalRoute.withName(Page1.routeName));
              },
            ),
            Text('Remove every page from stack up to HomePage'),
            RaisedButton(
              child: Text('popUntil HomePage'),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
            Text('Remove every page from stack and push LoginPage'),
            RaisedButton(
              child: Text('pushAndRemoveUntil LoginPage'),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage()),
                  (Route<dynamic> route) => false, //remove every page
                );
              },
            ),
          ]
              .map((item) => Padding(
                    child: item,
                    padding: EdgeInsets.only(bottom: 8.0),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
