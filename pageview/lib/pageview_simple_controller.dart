import 'package:flutter/material.dart';

class PageViewSimpleController extends StatefulWidget {
  @override
  _PageViewSimpleControllerState createState() =>
      _PageViewSimpleControllerState();
}

class _PageViewSimpleControllerState extends State<PageViewSimpleController>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();

  final _pages = [
    FlutterLogo(colors: Colors.red),
    FlutterLogo(colors: Colors.green),
    FlutterLogo(colors: Colors.blue),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('PageView Simple Controller')),
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
    return
      PageView(
        children: _pages
            .map((logo) =>
            GestureDetector(
              onTap: () {
                _animationController.reset();
                _animationController.forward();
                _displaySnackBar();
              },
              child: RotationTransition(
                turns: _animationController,
                child: logo,
              ),
            ))
            .toList(),
        controller: _pageController,
      );
  }

  void _displaySnackBar() {
    final SnackBar snackBar =
    SnackBar(content: Text("Page ${_pageController.page.toInt()} is tapped"));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
