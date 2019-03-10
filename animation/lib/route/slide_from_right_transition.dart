import 'package:flutter/material.dart';

class SlideFromRightTransition extends PageRouteBuilder {
  final Widget widget;

  SlideFromRightTransition({this.widget})
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) {
              return widget;
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
            });
}
