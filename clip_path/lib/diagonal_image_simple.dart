import 'package:clip_path/diagonal_clipper_simple.dart';
import 'package:flutter/material.dart';

class DiagonalImageSimple extends StatelessWidget {
  final double _clipHeight = 90.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diagonal Image Simple'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return Column(
      children: <Widget>[
        _getClipPath(),
      ],
    );
  }

  _getClipPath() {
    return ClipPath(
      clipper: DiagonalClipperSimple(_clipHeight),
      child: Image.asset('assets/images/backdrop.jpg'),
    );
  }
}
