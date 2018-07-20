import 'package:flutter/material.dart';

/* GridView crossAxisCount defines how many columns you want
* Item height is defined according to childAspectRatio(default is 1.0)
* So item heights are equal to item width in default case
* childAspectRatio = (itemWidth / itemHeight)
* */

class GridViewChildAspectRatio extends StatelessWidget {

  final _itemHeight = 100.0;
  final _crossAxisCount = 2;

  @override
  Widget build(BuildContext context) {

    final itemWidth = MediaQuery.of(context).size.width / 2;

    return Scaffold(
      appBar: AppBar(
        title: Text('GridView ChildAspectRatio'),
      ),
      body: _getBody(itemWidth),
    );
  }

  _getBody(double itemWidth) {
    return GridView.count(
      crossAxisCount: _crossAxisCount,
      childAspectRatio: itemWidth/_itemHeight,
      children: _getGridItems(),
    );
  }

  _getGridItems() {
    List<Widget> gridItems = List.generate(50, (index) => _getGridItem(index));
    return gridItems;
  }

  _getGridItem(int index) {
    return Container(
      height: _itemHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Icon(Icons.person), Text('Item $index')],
      ),
    );
  }
}
