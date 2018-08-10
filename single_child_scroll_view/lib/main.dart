import 'package:flutter/material.dart';
import 'package:single_child_scroll_view/fill_viewport_column_expand_scroll_view.dart';
import 'package:single_child_scroll_view/fill_viewport_scroll_view.dart';
import 'package:single_child_scroll_view/not_big_enough_child_to_scroll.dart';
import 'package:single_child_scroll_view/stack_vertically_and_scroll_when_no_room.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SingleChildScrollView Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/not_big_enough_child_to_scroll': (context) =>
            NotBigEnoughChildToScroll(),
        '/stack_vertically_and_scroll_when_no_room': (context) =>
            StackVerticallyAndScrollWhenNoRoom(),
        '/fill_viewport_scroll_view': (context) => FillViewPortScrollView(),
        '/fill_viewport_column_expand_scroll_view': (context) =>
            FillViewPortColumnExpandScrollView(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final _navItems = [
    NavItem(
        'Not Big Enough Child to Scroll', '/not_big_enough_child_to_scroll'),
    NavItem('Stack Vertically And Scroll When No Room',
        '/stack_vertically_and_scroll_when_no_room'),
    NavItem('Fill ViewPort Scroll View', '/fill_viewport_scroll_view'),
    NavItem('Fill ViewPort Column Expand Scroll View',
        '/fill_viewport_column_expand_scroll_view'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SingleChildScrollView Playground'),
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
