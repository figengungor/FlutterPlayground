import 'package:app_bar/gradient_appbar.dart';
import 'package:flutter/material.dart';

class AppBar7Screen extends StatelessWidget {
  @override
  Widget build(context) => Scaffold(
        body: Column(
          children: <Widget>[
            GradientAppBar(
              title: 'Gradient',
            ),
            Expanded(
              child: Center(
                child: Text('Gradient App Bar!'),
              ),
            )
          ],
        ),
      );
}
