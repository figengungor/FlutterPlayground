import 'package:chip/action_chip_demo.dart';
import 'package:chip/chip_demo.dart';
import 'package:chip/choice_chip_demo.dart';
import 'package:chip/filter_chip_demo.dart';
import 'package:chip/input_chip_demo.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chip Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/chip_demo': (context) => ChipDemo(),
        '/choice_chip_demo': (context) => ChoiceChipDemo(),
        '/filter_chip_demo': (context) => FilterChipDemo(),
        '/input_chip_demo': (context) => InputChipDemo(),
        '/action_chip_demo': (context) => ActionChipDemo(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final _navItems = [
    NavItem('Chip Demo', '/chip_demo'),
    NavItem('ChoiceChip Demo', '/choice_chip_demo'),
    NavItem('FilterChip Demo', '/filter_chip_demo'),
    NavItem('InputChip Demo', '/input_chip_demo'),
    NavItem('ActionChip Demo', '/action_chip_demo'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chip Playground'),
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
