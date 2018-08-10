import 'package:flutter/material.dart';

class StackVerticallyAndScrollWhenNoRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stack Vertically And Scroll When No Room')),
      body: Container(
        color: Colors.pink,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(16.0),
                height: 250.0,
                color: Colors.green,
              ),
              Container(
                margin: EdgeInsets.all(16.0),
                height: 250.0,
                color: Colors.orange,
              ),
              Container(
                margin: EdgeInsets.all(16.0),
                height: 150.0,
                color: Colors.lightBlue,
              ),
              Container(
                margin: EdgeInsets.all(16.0),
                height: 150.0,
                color: Colors.redAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
