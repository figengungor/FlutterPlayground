import 'package:app_bar/appbar1_screen.dart';
import 'package:app_bar/appbar2_screen.dart';
import 'package:app_bar/appbar3_screen.dart';
import 'package:app_bar/appbar4_screen.dart';
import 'package:app_bar/appbar5_screen.dart';
import 'package:app_bar/appbar6_screen.dart';
import 'package:app_bar/appbar7_screen.dart';
import 'package:app_bar/nav_button.dart';
import 'package:flutter/material.dart';

//Credits:
//https://material.io/design/components/app-bars-top.html#anatomy
//https://material.io/design/platform-guidance/cross-platform-adaptation.html#cross-platform-guidelines

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppBarPlaygroundScreen(),
      theme: ThemeData(primarySwatch: Colors.green),
      routes: <String, WidgetBuilder>{
        '/appBar1Screen': (BuildContext context) => AppBar1Screen(),
        '/appBar2Screen': (BuildContext context) => AppBar2Screen(),
        '/appBar3Screen': (BuildContext context) => AppBar3Screen(),
        '/appBar4Screen': (BuildContext context) => AppBar4Screen(),
        '/appBar5Screen': (BuildContext context) => AppBar5Screen(),
        '/appBar6Screen': (BuildContext context) => AppBar6Screen(),
        '/appBar7Screen': (BuildContext context) => AppBar7Screen(),
      },
    );
  }
}

class AppBarPlaygroundScreen extends StatelessWidget {
  final List<NavItem> _navItems = [
    NavItem(
      title: 'Simple',
      routeName: '/appBar1Screen',
    ),
    NavItem(
      title: 'Centered Title',
      routeName: '/appBar2Screen',
    ),
    NavItem(
      title: 'Leading Icon',
      routeName: '/appBar3Screen',
    ),
    NavItem(
      title: 'Actions',
      routeName: '/appBar4Screen',
    ),
    NavItem(
      title: 'Overflow Menu',
      routeName: '/appBar5Screen',
    ),
    NavItem(
      title: 'Overflow Menu Stateful',
      routeName: '/appBar6Screen',
    ),
    NavItem(
      title: 'Gradient Custom App Bar',
      routeName: '/appBar7Screen',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> navButtons = _navItems
        .map((model) => NavButton(
              title: model.title,
              routeName: model.routeName,
            ))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar Playground'),
      ),
      body: Center(
        child: Column(children: navButtons),
      ),
    );
  }
}

class NavItem {
  NavItem({@required this.title, @required this.routeName});
  final title;
  final routeName;
}
