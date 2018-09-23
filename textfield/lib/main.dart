import 'package:flutter/material.dart';
import 'package:textfield/demo_page.dart';
import 'package:textfield/input_formatters_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Form Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.pink,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/demo_page': (context) => DemoPage(),
        '/input_formatters_page': (context) => InputFormattersPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final List<NavItem> navItems = [
    NavItem('Demo Page', '/demo_page'),
    NavItem('InputFormatters Demo Page', '/input_formatters_page'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField Playground'),
      ),
      body: _getNavButtons(context),
    );
  }

  _getNavButtons(BuildContext context) {
    return ListView(
        children: navItems.map((navItem) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text(navItem.title),
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, navItem.routeName);
              },
            ),
          ],
        ),
      );
    }).toList());
  }
}

class NavItem {
  final title;
  final routeName;
  NavItem(this.title, this.routeName);
}
