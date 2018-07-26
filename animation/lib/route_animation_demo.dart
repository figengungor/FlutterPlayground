import 'package:animation/second_page.dart';
import 'package:animation/slide_from_right_transition.dart';
import 'package:flutter/material.dart';

class RouteAnimationDemo extends StatefulWidget {
  @override
  _RouteAnimationDemoState createState() => _RouteAnimationDemoState();
}

class _RouteAnimationDemoState extends State<RouteAnimationDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route Animation Demo'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return ListView(
        children: <Widget>[
      _getFadeTransition(),
      _getSlideTransitionFromRight(),
      _getCustomPageRouteBuilderWithSlideTransition(),
    ]
            .map((item) => Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: item,
                ))
            .toList());
  }

  _getFadeTransition() {
    return RaisedButton(
      child: Text('FadeTransition Demo'),
      onPressed: () {
        Navigator.push(
            context,
            PageRouteBuilder(pageBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return SecondPage();
            }, transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(opacity: animation, child: child);
            }));
      },
    );
  }

  _getSlideTransitionFromRight() {
    return RaisedButton(
      child: Text('SlideTransition Demo (from right)'),
      onPressed: () {
        Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (
                BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
              ) {
                return SecondPage();
              },
              transitionsBuilder: (
                BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child,
              ) {
                const Offset topLeft = const Offset(0.0, 0.0);
                const Offset topRight = const Offset(1.0, 0.0);
                Offset startOffset = topRight;
                Offset endOffset = topLeft;
                return SlideTransition(
                    position: new Tween<Offset>(
                      begin: startOffset,
                      end: endOffset,
                    ).animate(animation),
                    child: child);
              },
              transitionDuration: Duration(milliseconds: 300),
            ));
      },
    );
  }

  _getCustomPageRouteBuilderWithSlideTransition() {
    return RaisedButton(
      child: Text('SlideTransition with Custom PageRouteBuilder'),
      onPressed: () {
        Navigator.push(context, SlideFromRightTransition(widget: SecondPage()));
      },
    );
  }
}
