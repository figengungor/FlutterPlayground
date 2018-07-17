import 'package:checkbox/checkbox_list_tile_demo.dart';
import 'package:checkbox/checkbox_simple.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Checkbox Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/checkbox_simple': (context) => CheckboxSimple(),
        '/checkbox_list_tile_demo': (context) => CheckboxListTileDemo(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final _navItems = [
    NavItem('Checkbox Simple', '/checkbox_simple'),
    NavItem('CheckboxListTile Demo', '/checkbox_list_tile_demo'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox Playground'),
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
