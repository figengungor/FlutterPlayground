import 'package:dialog/alert_dialog_demo.dart';
import 'package:dialog/alert_dialog_single_choice_demo.dart';
import 'package:dialog/date_and_time_picker_demo.dart';
import 'package:dialog/full_screen_dialog_demo.dart';
import 'package:dialog/simple_dialog_demo.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Dialog Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.pink,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/alert_dialog_demo': (context) => AlertDialogDemo(),
        '/full_screen_dialog_demo': (context) => FullScreenDialogDemo(),
        '/simple_dialog_demo': (context) => SimpleDialogDemo(),
        '/alert_dialog_single_choice_demo': (context) =>
            AlertDialogSingleChoiceDemo(),
        '/date_and_time_picker_demo': (context) => DateAndTimePickerDemo(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final _navItems = [
    NavItem('Alert Dialog', '/alert_dialog_demo'),
    NavItem('Full Screen Dialog', '/full_screen_dialog_demo'),
    NavItem('Simple Dialog', '/simple_dialog_demo'),
    NavItem('Alert Dialog Single Choice', '/alert_dialog_single_choice_demo'),
    NavItem('Date and TimePicker', '/date_and_time_picker_demo'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog Playground'),
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
