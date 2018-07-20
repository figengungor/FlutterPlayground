import 'package:flutter/material.dart';


/* GridView crossAxisCount defines how many columns you want
* Item height is defined according to childAspectRatio(default is 1.0)
* So item heights are equal to item width in default case
* childAspectRatio = (itemWidth / itemHeight)
* */


class GridViewCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView.count()'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return GridView.count(
      crossAxisCount: 2,
      children: _getGridItems(),
    );
  }

  _getGridItems() {
    List<Widget> gridItems = List.generate(50, (index) => _getGridItem(index));
    return gridItems;
  }

  _getGridItem(int index) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.person),
          Text('Item $index')
        ],
      ),
    );
  }
}
