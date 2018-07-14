import 'package:flutter/material.dart';

class ColumnCrossAxisAlignment extends StatelessWidget {
  final _containerWidth = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column CrossAxisAlignment'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        _getRotatedText('CrossAxisAlignment.start'),
        _getColumnAxisAlignmentStart(),
        _getRotatedText('CrossAxisAlignment.center'),
        _getColumnAxisAlignmentCenter(),
        _getRotatedText('CrossAxisAlignment.end'),
        _getColumnAxisAlignmentEnd(),
        _getRotatedText('If not specified CrossAxisAlignment.center '
            'by default inside Container'),
        _getColumnAxisAlignmentDefault(),
        _getRotatedText('CrossAxisAlignment.stretch'),
        _getColumnAxisAlignmentStretch(),
        _getRotatedText('Without CrossAxisAlignment.stretch'),
        _getColumnAxisAlignmentWithoutStretch(),
      ],
    );
  }

  _getColumnAxisAlignmentStart() {
    return Container(
      color: Colors.orange,
      width: _containerWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.favorite),
          Icon(Icons.favorite),
          Icon(Icons.favorite),
        ],
      ),
    );
  }

  _getColumnAxisAlignmentCenter() {
    return Container(
      color: Colors.pink,
      width: _containerWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.favorite),
          Icon(Icons.favorite),
          Icon(Icons.favorite),
        ],
      ),
    );
  }

  _getColumnAxisAlignmentEnd() {
    return Container(
      color: Colors.green,
      width: _containerWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Icon(Icons.favorite),
          Icon(Icons.favorite),
          Icon(Icons.favorite),
        ],
      ),
    );
  }

  _getColumnAxisAlignmentDefault() {
    return Container(
      color: Colors.green,
      width: _containerWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(Icons.favorite),
          Icon(Icons.favorite),
          Icon(Icons.favorite),
        ],
      ),
    );
  }

  _getColumnAxisAlignmentStretch() {
    return Container(
      width: _containerWidth,
      color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 50.0,
            color: Colors.teal,
            child: Icon(Icons.favorite),
          ),
          Container(
            height: 50.0,
            color: Colors.lightBlue,
            child: Icon(Icons.favorite),
          ),
          Container(
            height: 50.0,
            color: Colors.purple,
            child: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }

  _getColumnAxisAlignmentWithoutStretch() {
    return Container(
      width: _containerWidth,
      color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 50.0,
            color: Colors.teal,
            child: Icon(Icons.favorite),
          ),
          Container(
            height: 50.0,
            color: Colors.lightBlue,
            child: Icon(Icons.favorite),
          ),
          Container(
            height: 50.0,
            color: Colors.purple,
            child: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }

  _getRotatedText(String title) {
    return RotatedBox(
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
      quarterTurns: 3,
    );
  }
}
