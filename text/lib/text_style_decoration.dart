import 'package:flutter/material.dart';

class TextStyleDecoration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TextStyle.decoration')),
      body: DefaultTextStyle(
        style: Theme.of(context).textTheme.body1.copyWith(fontSize: 20),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            Text(
              'TextDecoration.overline',
              style: TextStyle(
                decoration: TextDecoration.overline,
              ),
            ),
            Text(
              'TextDecoration.underline',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            Text(
              'TextDecoration.lineThrough',
              style: TextStyle(decoration: TextDecoration.lineThrough),
            ),
            Text(
              'TextDecoration.none',
              style: TextStyle(decoration: TextDecoration.none),
            ),
            Text(
              'TextDecoration.lineThrough, decorationColor',
              style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.red),
            ),
            Text(
              'TextDecorationStyle.dashed',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
            Text(
              'TextDecorationStyle.dotted',
              style: TextStyle(

                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dotted),
            ),
            Text(
              'TextDecorationStyle.double',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.double),
            ),
            Text(
              'TextDecorationStyle.wavy',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.wavy),
            ),
          ].map((item) =>Padding(padding: const EdgeInsets.only(bottom: 16), child: item,)).toList(),
        ),
      ),
    );
  }
}
