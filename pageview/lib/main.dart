import 'package:flutter/material.dart';
import 'package:pageview/collins_pageview_indicator.dart';
import 'package:pageview/pageview_builder.dart';
import 'package:pageview/pageview_indicator_demo.dart';
import 'package:pageview/pageview_infinite.dart';
import 'package:pageview/pageview_loop.dart';
import 'package:pageview/pageview_simple.dart';
import 'package:pageview/pageview_simple_arrows.dart';
import 'package:pageview/pageview_simple_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PageView Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/pageview_simple': (context) => PageViewSimple(),
        '/pageview_simple_controller': (context) => PageViewSimpleController(),
        '/pageview_simple_arrows': (context) => PageViewSimpleArrows(),
        '/pageview_builder': (context) => PageViewBuilder(),
        '/pageview_indicator_demo': (context) => PageViewIndicatorDemo(),
        '/collins_page_view_indicator': (context) => CollinsPageViewIndicator(),
        '/pageview_loop': (context) => PageViewLoop(),
        '/pageview_infinite': (context) => PageViewInfinite(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final _navItems = [
    NavItem('PageView Simple', '/pageview_simple'),
    NavItem('PageView Simple Controller', '/pageview_simple_controller'),
    NavItem('PageView Simple Arrows', '/pageview_simple_arrows'),
    NavItem('PageView Builder', '/pageview_builder'),
    NavItem('PageView Indicator Demo', '/pageview_indicator_demo'),
    NavItem('Collin\'s PageView Indicator', '/collins_page_view_indicator'),
    NavItem('PageView Loop', '/pageview_loop'),
    NavItem('PageView Infinite', '/pageview_infinite'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView Playground'),
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
