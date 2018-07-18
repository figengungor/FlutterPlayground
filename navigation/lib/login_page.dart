import 'package:flutter/material.dart';
import 'package:navigation/page1.dart';

class LoginPage extends StatelessWidget {

  final _title = 'Login Page';
  static const routeName = '/login_page';

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
          ],
        ),
      ),
    );
  }
}
