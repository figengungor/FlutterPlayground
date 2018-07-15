import 'package:flutter/material.dart';

enum Position { TOP_LEFT, TOP_RIGHT, BOTTOM_LEFT, BOTTOM_RIGHT }

class DiagonalImage extends StatelessWidget {
  final Widget image;
  final double clipHeight;
  final Position position;

  const DiagonalImage(
      {Key key,
      @required this.image,
      @required this.clipHeight,
      this.position = Position.BOTTOM_LEFT})
      : assert(image != null),
        assert(clipHeight != null),
        assert(clipHeight > 0.0, 'clipHeight cannot be <= 0.0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DiagonalClipper(clipHeight, position),
      child: image,
    );
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  final double clipHeight;
  final Position position;

  DiagonalClipper(this.clipHeight, this.position);

  @override
  Path getClip(Size size) {
    switch (position) {
      case Position.TOP_LEFT:
        return _getTopLeftPath(size);
      case Position.TOP_RIGHT:
        return _getTopRightPath(size);
      case Position.BOTTOM_LEFT:
        return _getBottomLeftPath(size);
      case Position.BOTTOM_RIGHT:
        return _getBottomRightPath(size);
      default:
        return _getBottomLeftPath(size);
    }
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

  _getTopLeftPath(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, clipHeight);
    path.close();
    return path;
  }

  _getTopRightPath(Size size) {
    var path = Path();
    path.moveTo(0.0, clipHeight);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  _getBottomLeftPath(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height - clipHeight);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  _getBottomRightPath(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - clipHeight);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }
}
