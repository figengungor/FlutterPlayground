import 'package:flutter/material.dart';

class HandlingOrientation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
        appBar: AppBar(title: Text('Handling Orientation')),
        body: isLandscape ? _buildText('Landscape') : _buildText('Portrait'));
  }

  _buildText(String orientation) => Center(
          child: Text(
        orientation,
        style: TextStyle(fontSize: 26.0),
      ));
}
