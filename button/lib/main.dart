import 'package:button/button_theme_tab_view.dart';
import 'package:button/icon_and_label_button_tab_view.dart';
import 'package:button/inkwell_custom_button.dart';
import 'package:button/flat_button_tab_view.dart';
import 'package:button/ghost_button_tab_view.dart';
import 'package:button/icon_button_tab_view.dart';
import 'package:button/raised_button_tab_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.deepOrange,
      ),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Button Playground'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'RaisedButton'),
              Tab(text: 'FlatButton'),
              Tab(text: 'GhostButton'),
              Tab(text: 'IconButton'),
              Tab(text: 'InkWellCustomButton'),
              Tab(text: 'IconAndLabelButton'),
              Tab(text: 'ButtonTheme'),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TabBarView(
            children: [
              RaisedButtonTabView(),
              FlatButtonTabView(),
              GhostButtonTabView(),
              IconButtonTabView(),
              InkWellCustomButton(),
              IconAndLabelButtonTabView(),
              ButtonThemeTabView(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.mic),
        ),
      ),
    );
  }
}
