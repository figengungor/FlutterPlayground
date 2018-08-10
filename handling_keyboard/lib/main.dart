import 'package:flutter/material.dart';
import 'package:handling_keyboard/closing_keyboard.dart';
import 'package:handling_keyboard/making_input_fields_visible_when_focused.dart';
import 'package:handling_keyboard/making_input_fields_visible_when_focused_issue.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Handling Keyboard Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/closing_keyboard': (context) => ClosingKeyboardPage(),
        '/making_input_fields_visible_when_focused_issue': (context) =>
            MakingInputFieldsVisibleWhenFocusedIssuePage(),
        '/making_input_fields_visible_when_focused': (context) =>
            MakingInputFieldsVisibleWhenFocusedPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final _navItems = [
    NavItem('Closing Keyboard', '/closing_keyboard'),
    NavItem('Making Input Fields Visible When Focused Issue',
        '/making_input_fields_visible_when_focused_issue'),
    NavItem('Making Input Fields Visible When Focused Solution',
        '/making_input_fields_visible_when_focused'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Handling Keyboard Playground'),
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
