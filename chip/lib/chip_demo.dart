import 'package:flutter/material.dart';

class ChipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chip Playground'),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Chip(
            label: Text('Adventure'),
          ),
          Chip(
            backgroundColor: Colors.pinkAccent,
            label: Text(
              'Adventure',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.person),
            ),
            backgroundColor: Colors.black,
            label: Text(
              'John Doe',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Chip(
            avatar: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.person),
            ),
            onDeleted: () {},
            deleteIconColor: Colors.white,
            backgroundColor: Colors.black,
            label: Text(
              'John Doe',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Chip(
            //vertical padding applied to the entire chip
            materialTapTargetSize: MaterialTapTargetSize.padded,
            //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            label: Text('John Doe'),
          ),
          Chip(
            shape: BeveledRectangleBorder(),
            onDeleted: () {},
            //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            label: Text('John Doe'),
          ),
        ],
      ),
    );
  }
}
