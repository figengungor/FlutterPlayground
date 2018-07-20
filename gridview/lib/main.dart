import 'package:flutter/material.dart';
import 'package:gridview/gridview_builder.dart';
import 'package:gridview/gridview_count.dart';
import 'package:gridview/gridview_child_aspect_ratio.dart';
import 'package:gridview/gridview_divider.dart';
import 'package:gridview/gridview_gridtile.dart';
import 'package:gridview/gridview_horizontal.dart';
import 'package:gridview/gridview_spacing.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'GridView Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/gridview_count': (context) => GridViewCount(),
        '/gridview_child_aspect_ratio': (context) => GridViewChildAspectRatio(),
        '/gridview_spacing': (context) => GridViewSpacing(),
        '/gridview_builder': (context) => GridViewBuilder(),
        '/gridview_gridtile': (context) => GridViewGridTile(),
        '/gridview_horizontal': (context) => GridViewHorizontal(),
        '/gridview_divider': (context) => GridViewDivider(),
      },

    );
  }
}

class HomePage extends StatelessWidget {

  final _navItems = [
    NavItem('GridView.count()', '/gridview_count'),
    NavItem('GridView ChildAspectRatio', '/gridview_child_aspect_ratio'),
    NavItem('GridView Spacing', '/gridview_spacing'),
    NavItem('GridView.builder()', '/gridview_builder'),
    NavItem('GridView GridTile', '/gridview_gridtile'),
    NavItem('GridView Horizontal', '/gridview_horizontal'),
    NavItem('GridView Divider', '/gridview_divider'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Playground'),
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

