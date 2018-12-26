import 'package:flutter/material.dart';

class TextStyleLetterWordSpacing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Letter Word Spacing')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Text('TextStyle.letterspacing=10'),
          Text('Letter Spacing',
              style: TextStyle(
                letterSpacing: 10,
              )),
          SizedBox(height: 16),
          Text('TextStyle.letterspacing=-1'),
          Text('Letter Spacing', style: TextStyle(letterSpacing: -1)),
          SizedBox(height: 16),
          Text('TextStyle.wordSpacing=10'),
          Text('Letter Spacing', style: TextStyle(wordSpacing: 10)),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
