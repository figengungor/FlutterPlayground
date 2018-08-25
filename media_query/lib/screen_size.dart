import 'package:flutter/material.dart';

class ScreenSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Screen Size')),
      body: Center(
        child: Text(
          '${screenSize.width.toInt()} x ${screenSize.height.toInt()}',
          style: TextStyle(fontSize: 26.0),
        ),
      ),
    );
  }
}
