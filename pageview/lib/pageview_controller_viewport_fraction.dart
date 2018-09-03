import 'package:flutter/material.dart';

class PageViewControllerViewportFraction extends StatefulWidget {
  @override
  _PageViewControllerViewportFractionState createState() =>
      _PageViewControllerViewportFractionState();
}

class _PageViewControllerViewportFractionState
    extends State<PageViewControllerViewportFraction> {
  final PageController _pageController =
      PageController(viewportFraction: 0.8, initialPage: 1);
  final _pages = [
    Container(color: Colors.pinkAccent),
    Container(color: Colors.green),
    Container(color: Colors.orange),
    Container(color: Colors.blue),
    Container(color: Colors.yellow),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PageView Simple Controller')),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return PageView(
      children: _pages,
      controller: _pageController,
    );
  }
}
