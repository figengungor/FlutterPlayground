import 'package:flutter/material.dart';
import 'package:stack/demo.dart';
import 'package:stack/demo2.dart';
import 'package:stack/demo3.dart';
import 'package:stack/demo4.dart';
import 'package:stack/demo5.dart';
import 'package:stack/demo6.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/demo': (context) => DemoPage(),
        '/demo2': (context) => Demo2Page(),
        '/demo3': (context) => Demo3Page(),
        '/demo4': (context) => Demo4Page(),
        '/demo5': (context) => Demo5Page(),
        '/demo6': (context) => Demo6Page(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final _navItems = [
    NavItem('Stack alignment', '/demo'),
    NavItem('Stack with Positioned children', '/demo2'),
    NavItem('Centering a Positioned in Stack', '/demo3'),
    NavItem('Positioned and non-positioned mix', '/demo4'),
    NavItem('Bottom Header Text on Image', '/demo5'),
    NavItem('Bottom Header Text on Image with Positioned', '/demo6'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Playground'),
      ),
      body: _getNavButtons(context),
    );
  }

  _getNavButtons(BuildContext context) {
    return ListView(
      children: _navItems
          .map(
            (item) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.green,
                    onPressed: () {
                      Navigator.pushNamed(context, item.routeName);
                    },
                    child: Text(
                      item.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
          )
          .toList(),
    );
  }
}

class NavItem {
  final title;
  final routeName;

  NavItem(this.title, this.routeName);
}
