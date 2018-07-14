import 'package:flutter/material.dart';

class RowCrossAxisAlignment extends StatelessWidget {
  final _containerHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row CrossAxisAlignment'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return ListView(
      children: <Widget>[
        Text('CrossAxisAlignment.start'),
        _getCrossAxisAlignmentStart(),
        Text('CrossAxisAlignment.center'),
        _getCrossAxisAlignmentCenter(),
        Text('CrossAxisAlignment.end'),
        _getCrossAxisAlignmentEnd(),
        Text('If not specified CrossAxisAlignment.center '
            'by default inside Container'),
        //Row's crossAxisAlignment inside Container is center by default
        _getCrossAxisAlignmentDefault(),
        Text('CrossAxisAlignment.stretch'),
        _getCrossAxisAlignmentStretch(),
        Text('Without CrossAxisAlignment.stretch'),
        _getCrossAxisAlignmentWithoutStretch(),
        Text('CrossAxisAlignment.baseline, '
            '\ntextBaseline : TextBaseline.alphabetical'),
        _getCrossAxisAlignmentBaseline(),
        Text('Without CrossAxisAlignment.baseline'),
        _getCrossAxisAlignmentWithoutBaseline(),
      ],
    );
  }

  _getCrossAxisAlignmentStart() {
    return Container(
      color: Colors.orange,
      height: _containerHeight,
      child: Row(
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

  _getCrossAxisAlignmentCenter() {
    return Container(
      color: Colors.pink,
      height: _containerHeight,
      child: Row(
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

  _getCrossAxisAlignmentEnd() {
    return Container(
      color: Colors.green,
      height: _containerHeight,
      child: Row(
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

  _getCrossAxisAlignmentDefault() {
    return Container(
      color: Colors.blue,
      height: _containerHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(Icons.favorite),
          Icon(Icons.favorite),
          Icon(Icons.favorite),
        ],
      ),
    );
  }

  _getCrossAxisAlignmentStretch() {
    return Container(
      height: _containerHeight,
      color: Colors.yellow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: 50.0,
            color: Colors.teal,
            child: Icon(Icons.favorite),
          ),
          Container(
            width: 50.0,
            color: Colors.lightBlue,
            child: Icon(Icons.favorite),
          ),
          Container(
            width: 50.0,
            color: Colors.purple,
            child: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }

  _getCrossAxisAlignmentWithoutStretch() {
    return Container(
      height: _containerHeight,
      color: Colors.yellow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 50.0,
            color: Colors.teal,
            child: Icon(Icons.favorite),
          ),
          Container(
            width: 50.0,
            color: Colors.lightBlue,
            child: Icon(Icons.favorite),
          ),
          Container(
            width: 50.0,
            color: Colors.purple,
            child: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }

  _getCrossAxisAlignmentBaseline() {
    return Container(
      height: _containerHeight,
      color: Colors.black,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text('Flutter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                )),
            Text('Rules!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                )),
          ],
        ),
      ),
    );
  }

  _getCrossAxisAlignmentWithoutBaseline() {
    return Container(
      height: _containerHeight,
      color: Colors.black,
      child: Center(
        child: Row(
          children: <Widget>[
            Text('Flutter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                )),
            Text('Rules!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                )),
          ],
        ),
      ),
    );
  }
}
