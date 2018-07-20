import 'package:flutter/material.dart';
import 'package:http_requests/pages/future_builder_demo.dart';
import 'package:http_requests/pages/simple_get_request.dart';
import 'package:http_requests/pages/using_jsonplaceholder_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/simple_get_request': (context) => SimpleGetRequest(),
        '/future_builder_demo': (context) => FutureBuilderDemo(),
        '/using_jsonplaceholder_api': (context) => UsingJsonPlaceholderApi(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final _navItems = [
    NavItem('Simple Get Request', '/simple_get_request'),
    NavItem('FutureBuilder Demo', '/future_builder_demo'),
    NavItem('Using JsonPlaceholder Api', '/using_jsonplaceholder_api'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Requests Playground'),
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
