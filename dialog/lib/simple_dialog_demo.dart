import 'package:flutter/material.dart';

class SimpleDialogDemo extends StatefulWidget {
  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  var _bgColor;

  final bgColors = [Colors.red, Colors.green, Colors.lightBlue];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Dialog'),
      ),
      body: _getBody(context),
      backgroundColor: _bgColor != null ? _bgColor : Colors.white,
    );
  }

  _getBody(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          _openSimpleDialog(context);
        },
        child: Text('Open Simple Dialog'),
      ),
    );
  }

  _openSimpleDialog(BuildContext context) async {
    var simpleDialog = SimpleDialog(
        title: Text('Choose background color:'),
        children: bgColors
            .map((color) => SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context, color);
                  },
                  child: Container(
                    height: 60.0,
                    color: color,
                  ),
                ))
            .toList());
    var bgColor = await showDialog<Color>(
      context: context,
      builder: (context) => simpleDialog,
    );

    setState(() {
      _bgColor = bgColor;
    });
  }
}
