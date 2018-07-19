import 'package:flutter/material.dart';
import 'package:listview/basic_list.dart';
import 'package:listview/horizontal_listview.dart';
import 'package:listview/listtile_demo.dart';
import 'package:listview/listtile_divide_tiles_demo.dart';
import 'package:listview/listview_builder_demo.dart';
import 'package:listview/listview_divider_demo.dart';
import 'package:listview/listview_divider_indent_demo.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ListView Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/basic_listview': (context) => BasicList(),
        '/listtile_demo': (context) => ListTileDemo(),
        '/listview_builder_demo': (context) => ListViewBuilderDemo(),
        '/listview_divider_demo': (context) => ListViewDividerDemo(),
        '/listview_divider_indent_demo': (context) =>
            ListViewDividerIndentDemo(),
        '/listtile_divide_tiles_demo': (context) => ListTileDivideTilesDemo(),
        '/horizontal_listview': (context) => HorizontalListView(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final _navItems = [
    NavItem('Basic ListView', '/basic_listview'),
    NavItem('Using ListTile', '/listtile_demo'),
    NavItem('Using ListView.builder()', '/listview_builder_demo'),
    NavItem('ListView divider', '/listview_divider_demo'),
    NavItem('ListView divider indent', '/listview_divider_indent_demo'),
    NavItem('ListTile.divideTiles()', '/listtile_divide_tiles_demo'),
    NavItem('Horizontal ListView', '/horizontal_listview'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Playground'),
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
