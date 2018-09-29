import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ImageBlur extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildBlurredImage(),
        _buildFrostedGlassEffect(context),
      ],
    );
  }

  _buildBlurredImage() => DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          child: Container(
            color: Colors.black.withOpacity(0.2),
          ),
        ),
      );

  _buildFrostedGlassEffect(BuildContext context) => BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(36.0),
            child: Text(
              'Frosted',
              style: Theme.of(context).textTheme.display3,
            ),
            color: Colors.white.withOpacity(0.4),
          ),
        ),
      );
}
