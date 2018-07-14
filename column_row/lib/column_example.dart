import 'package:flutter/material.dart';

class ColumnExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Column examples')),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _getColumn1(),
          _getColumn2Expanded(),
          _getColumn3Expanded(),
          _getColumn4MainAxisAlignmentStart(),
          _getColumn5MainAxisAlignmentEnd(),
          _getColumn6MainAxisAlignmentCenter(),
          _getColumn7MainAxisAlignmentSpaceBetween(),
          _getColumn8MainAxisAlignmentSpaceEvenly(),
          _getColumn9MainAxisAlignmentSpaceAround(),
        ]
            .map(
              (item) => Row(
                    children: <Widget>[
                      item,
                      Container(
                        color: Colors.black,
                        height: MediaQuery.of(context).size.height,
                        width: 1.0,
                      )
                    ],
                  ),
            )
            .toList(),
      ),
    );
  }

  _getColumn1() {
    return Column(
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Text('Text', style: TextStyle(fontSize: 20.0)),
      ],
    );
  }

  _getColumn2Expanded() {
    return Column(
      children: <Widget>[
        Expanded(child: Text('Text', style: TextStyle(fontSize: 20.0))),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }

  _getColumn3Expanded() {
    return Column(
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Expanded(
            child:
                Center(child: Text('Text', style: TextStyle(fontSize: 20.0)))),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }

  _getColumn4MainAxisAlignmentStart() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Text('Text', style: TextStyle(fontSize: 20.0)),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }

  _getColumn5MainAxisAlignmentEnd() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Text('Text', style: TextStyle(fontSize: 20.0)),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }

  _getColumn6MainAxisAlignmentCenter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Text('Text', style: TextStyle(fontSize: 20.0)),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }

  //Place the free space evenly between the children.
  _getColumn7MainAxisAlignmentSpaceBetween() {
    return Column(
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
  _getColumn8MainAxisAlignmentSpaceEvenly() {
    return Column(
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
  _getColumn9MainAxisAlignmentSpaceAround() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Icon(Icons.star, size: 50.0),
        Text('Text', style: TextStyle(fontSize: 20.0)),
        Icon(Icons.star, size: 50.0),
      ],
    );
  }
}
