import 'package:animation/custom_animated_widget_demo.dart';
import 'package:animation/animated_widget_examples.dart';
import 'package:animation/animation_state_demo.dart';
import 'package:animation/basic_animation_demo.dart';
import 'package:animation/route_animation_demo.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/basic_animation_demo': (context) => BasicAnimationDemo(),
        '/custom_animated_widget_demo': (context) => CustomAnimatedWidgetDemo(),
        '/animated_widget_examples': (context) => AnimatedWidgetExamples(),
        '/animation_state_demo': (context) => AnimationStateDemo(),
        '/route_animation_demo': (context) => RouteAnimationDemo(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final _navItems = [
    NavItem('Basic Animation Demo', '/basic_animation_demo'),
    NavItem('Custom AnimatedWidget Demo', '/custom_animated_widget_demo'),
    NavItem('AnimatedWidget Examples', '/animated_widget_examples'),
    NavItem('Animation State Demo', '/animation_state_demo'),
    NavItem('Route Animation Demo', '/route_animation_demo'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animations Playground'),
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
