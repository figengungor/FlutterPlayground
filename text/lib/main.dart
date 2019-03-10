import 'package:flutter/material.dart';
import 'package:text/text_style_decoration.dart';
import 'package:text/text_style_foreground_background.dart';
import 'package:text/text_style_letter_word_spacing.dart';
import 'package:text/text_style_shadow.dart';
import 'package:text/text_style_font_weight.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/text_style_shadow': (context) => TextStyleShadow(),
        '/text_style_decoration': (context) => TextStyleDecoration(),
        '/text_style_foreground_background': (context) => TextStyleForegroundBackground(),
        '/text_style_letter_word_spacing': (context) => TextStyleLetterWordSpacing(),
        '/text_style_font_weight': (context) => TextStyleFontWeight(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final _navItems = [
    NavItem('TextStyle.shadow', '/text_shadow_demo'),
    NavItem('TextStyle.decoration', '/text_decoration_demo'),
    NavItem('TextStyle .foreground .background ', '/text_foreground_background_demo'),
    NavItem('TextStyle .letterSpacing .wordSpacing', '/text_letter_word_spacing_demo'),
    NavItem('TextStyle.fontWeight', '/text_style_font_weight'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Playground'),
      ),
      body: _getNavButtons(context),
    );
  }

  _getNavButtons(BuildContext context) {
    return ListView(
      children: _navItems
          .map(
            (item) =>
            Padding(
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
