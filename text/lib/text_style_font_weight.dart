import 'package:flutter/material.dart';

class TextStyleFontWeight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TextStyle.fontWeight')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Text(
            'FontWeight.bold(w700)',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'FontWeight.normal(w400)',
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
          Text(
            'FontWeight.w100',
            style: TextStyle(fontWeight: FontWeight.w100),
          ),
          Text(
            'FontWeight.w200',
            style: TextStyle(fontWeight: FontWeight.w200),
          ),
          Text(
            'FontWeight.w300',
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
          Text(
            'FontWeight.w400',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          Text(
            'FontWeight.w500',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(
            'FontWeight.w600',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(
            'FontWeight.w700',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          Text(
            'FontWeight.w800',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          Text(
            'FontWeight.w900',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
        ].map((item) =>Padding(padding: const EdgeInsets.only(bottom: 16), child: item,)).toList(),
      ),
    );
  }
}
