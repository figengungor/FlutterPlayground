import 'package:flutter/material.dart';

class PageViewSimple extends StatefulWidget {
  @override
  _PageViewSimpleState createState() => _PageViewSimpleState();
}

class _PageViewSimpleState extends State<PageViewSimple> {
  final _pages = [
    FlutterLogo(colors: Colors.red),
    FlutterLogo(colors: Colors.green),
    FlutterLogo(colors: Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PageView Simple')),
      body: _buildBody(),
    );
  }

  //Using default constructor

  /*
  This constructor is appropriate for page views with a small number of
  children because constructing the List requires doing work for every child
  that could possibly be displayed in the page view, instead of just those
  children that are actually visible.
  */

  _buildBody() {
    return PageView(
      children: _pages,
    );
  }
}
