import 'package:flutter/material.dart';

class DiagonalClipperSimple extends CustomClipper<Path> {
  final double clipHeight;

  DiagonalClipperSimple(this.clipHeight);

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height - clipHeight);
    path.lineTo(size.width, 0.0);
    //close the path, it will connect start and end points with line
    path.close();
    return path;

    //-------------------------
    //|                        |
    //|                        |
    //|                        |
    //|                        |
    //|                      __|
    //|                 __
    //|          __
    //|  __
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
