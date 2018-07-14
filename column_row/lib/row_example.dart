import 'package:flutter/material.dart';

class RowExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Row examples')),
      body: ListView(
        children: <Widget>[
          _getRow1(),
          _getRow2Expanded(),
          _getRow3Expanded(),
          _getRow4MainAxisAlignmentStart(),
          _getRow5MainAxisAlignmentEnd(),
          _getRow6MainAxisAlignmentCenter(),
          _getRow7MainAxisAlignmentSpaceBetween(),
          _getRow8MainAxisAlignmentSpaceEvenly(),
          _getRow9MainAxisAlignmentSpaceAround(),
        ]
            .map(
              (item) => Column(
                    children: <Widget>[
                      item,
                      Divider(),
                    ],
                  ),
            )
            .toList(),
      ),
    );
  }

  _getRow1() {
    return Row(
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Text('Text', style: TextStyle(fontSize: 20.0)),
      ],
    );
  }

  _getRow2Expanded() {
    return Row(
      children: <Widget>[
        Expanded(child: Text('Text', style: TextStyle(fontSize: 20.0))),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }

  _getRow3Expanded() {
    return Row(
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Expanded(
            child:
                Center(child: Text('Text', style: TextStyle(fontSize: 20.0)))),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }

  _getRow4MainAxisAlignmentStart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Text('Text', style: TextStyle(fontSize: 20.0)),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }

  _getRow5MainAxisAlignmentEnd() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Text('Text', style: TextStyle(fontSize: 20.0)),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }

  _getRow6MainAxisAlignmentCenter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Text('Text', style: TextStyle(fontSize: 20.0)),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }

  //Place the free space evenly between the children.
  _getRow7MainAxisAlignmentSpaceBetween() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Text('Text', style: TextStyle(fontSize: 20.0)),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }

  //Place the free space evenly between the children as well as
  //before and after the first and last child.
  _getRow8MainAxisAlignmentSpaceEvenly() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Text('Text', style: TextStyle(fontSize: 20.0)),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }

  //Place the free space evenly between the children as well as half of that
  //space before and after the first and last child.
  _getRow9MainAxisAlignmentSpaceAround() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Text('Text', style: TextStyle(fontSize: 20.0)),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }
}
