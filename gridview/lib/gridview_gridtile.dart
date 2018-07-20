import 'package:flutter/material.dart';

class GridViewGridTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView GridTile'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return GridView.builder(
      padding: EdgeInsets.all(4.0),
      itemCount: 50,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return _getGridTileItem(index);
      },
    );
  }

  _getGridTileItem(int index) {
    return GridTile(
      child: Container(
        color: Colors.green,
        child: Center(child: Text('Child Text')),
      ),
      header: Container(
        color: Colors.yellow,
        child: Text('Header $index'),
      ),
      footer: Container(
        color: Colors.pink,
        child: Text('Footer $index'),
      ),
    );
  }
}
