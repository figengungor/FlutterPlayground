import 'package:flutter/material.dart';

class AppBar2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Hello Centered"),
          centerTitle: true,
        ),
      );
}
