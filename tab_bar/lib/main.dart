import 'package:flutter/material.dart';
import 'package:tab_bar/tab_bar_controller.dart';
import 'package:tab_bar/tab_bar_icon.dart';
import 'package:tab_bar/tab_bar_indicator.dart';
import 'package:tab_bar/tab_bar_scrollable.dart';
import 'package:tab_bar/tab_bar_style.dart';
import 'package:tab_bar/tab_bar_text.dart';
import 'package:tab_bar/tab_bar_text_icon.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Tabs Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/tab_bar_text': (context) => TabBarText(),
        '/tab_bar_icon': (context) => TabBarIcon(),
        '/tab_bar_text_icon': (context) => TabBarTextIcon(),
        '/tab_bar_scrollable': (context) => TabBarScrollable(),
        '/tab_bar_indicator': (context) => TabBarIndicator(),
        '/tab_bar_style': (context) => TabBarStyle(),
        '/tab_bar_controller': (context) => TabBarController(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final _navItems = [
    NavItem('TabBar Text', '/tab_bar_text'),
    NavItem('TabBar Icon', '/tab_bar_icon'),
    NavItem('TabBar Text & Icon', '/tab_bar_text_icon'),
    NavItem('TabBar Scrollable', '/tab_bar_scrollable'),
    NavItem('TabBar IndicatorSize', '/tab_bar_indicator'),
    NavItem('TabBar Style', '/tab_bar_style'),
    NavItem('TabController', '/tab_bar_controller'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabs Playground'),
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
