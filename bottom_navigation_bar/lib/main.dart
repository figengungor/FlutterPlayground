import 'package:bottom_navigation_bar/demo1.dart';
import 'package:bottom_navigation_bar/demo2.dart';
import 'package:bottom_navigation_bar/demo3.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, accentColor: Colors.pink),
      routes: {
        '/': (context) => HomePage(),
        '/demo1': (context) => Demo1(),
        '/demo2': (context) => Demo2(),
        '/demo3': (context) => Demo3(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  static const _navItems = [
    const NavItem('Demo 1: Fixed', '/demo1'),
    const NavItem('Demo 2: Active-Inactive Colors', '/demo2'),
    const NavItem('Demo 3: Shifting', '/demo3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigationBar Playground'),
      ),
      body: _getDemoList(context),
    );
  }

  _getDemoList(BuildContext context) {
    return ListView(children: _getNavButtons(context));
  }

  _getNavButtons(BuildContext context) {
    return _navItems.map((item) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          child: Text(item.title),
          onPressed: () {
            Navigator.pushNamed(context, item.routeName);
          },
        ),
      );
    }).toList();
  }
}

class NavItem {
  final title;
  final routeName;

  const NavItem(this.title, this.routeName);
}
