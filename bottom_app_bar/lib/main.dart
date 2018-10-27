import 'package:bottom_app_bar/bottom_app_bar_demo.dart';
import 'package:bottom_app_bar/bottom_app_bar_fab_extended.demo.dart';
import 'package:bottom_app_bar/bottom_app_bar_fab_notch.demo.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BottomAppBar Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/bottom_app_bar_demo': (context) => BottomAppBarDemo(),
        '/bottom_app_bar_fab_notch_demo': (context) =>
            BottomAppBarFabNotchDemo(),
        '/bottom_app_bar_fab_extended_demo': (context) =>
            BottomAppBarFabExtendedDemo(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final _navItems = [
    NavItem('BottomAppBar', '/bottom_app_bar_demo'),
    NavItem('BottomAppBar Fab Notch', '/bottom_app_bar_fab_notch_demo'),
    NavItem('BottomAppBar Fab.extended', '/bottom_app_bar_fab_extended_demo'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomAppBar Playground'),
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
