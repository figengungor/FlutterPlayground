import 'package:column_row/column_cross_axis_alignment.dart';
import 'package:column_row/column_example.dart';
import 'package:column_row/column_main_axis_size.dart';
import 'package:column_row/row_cross_axis_alignment.dart';
import 'package:column_row/row_example.dart';
import 'package:column_row/row_main_axis_size.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Column & Row Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/row_example': (context) => RowExample(),
        '/column_example': (context) => ColumnExample(),
        '/row_cross_axis_alignment': (context) => RowCrossAxisAlignment(),
        '/column_cross_axis_alignment': (context) => ColumnCrossAxisAlignment(),
        '/row_main_axis_size': (context) => RowMainAxisSize(),
        '/column_main_axis_size': (context) => ColumnMainAxisSize(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final _navItems = [
    NavItem('Row Examples', '/row_example'),
    NavItem('Column Examples', '/column_example'),
    NavItem('Row CrossAxisAlignment Examples', '/row_cross_axis_alignment'),
    NavItem(
        'Column CrossAxisAlignment Examples', '/column_cross_axis_alignment'),
    NavItem('Row MainAxisSize', '/row_main_axis_size'),
    NavItem('Column MainAxisSize', '/column_main_axis_size')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column & Row Playground'),
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
