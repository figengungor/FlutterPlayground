import 'package:flutter/material.dart';
import 'package:form/login_form_1.dart';
import 'package:form/register_form_1.dart';

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
        '/login_form_1': (context) => LoginForm1(),
        '/register_form_1': (context) => RegisterForm1(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final List<NavItem> navItems = [
    NavItem('Login Form 1', '/login_form_1'),
    NavItem('Register Form 1', '/register_form_1'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Playground'),
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
