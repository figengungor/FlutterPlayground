import 'package:flutter/material.dart';

class GridViewSpacing extends StatelessWidget {
  final _crossAxisCount = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Spacing'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return GridView.count(
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      crossAxisCount: _crossAxisCount,
      padding: EdgeInsets.all(4.0),
      children: _getGridItems(),
    );
  }

  _getGridItems() {
    List<Widget> gridItems = List.generate(50, (index) => _getGridItem(index));
    return gridItems;
  }

  _getGridItem(int index) {
    return Container(
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Icon(Icons.person), Text('Item $index')],
      ),
    );
  }
}
