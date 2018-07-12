import 'package:flutter/material.dart';

class AppBar3Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text("Leading Icon"),
        ),
      );
}
