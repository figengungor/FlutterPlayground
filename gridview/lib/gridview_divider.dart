import 'package:flutter/material.dart';

class GridViewDivider extends StatelessWidget {

  final _itemCount = 50;
  final _crossAxisCount = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView Divider'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return GridView.count(
      padding: EdgeInsets.all(10.0),
      scrollDirection: Axis.vertical,
      crossAxisCount: _crossAxisCount,
      children: _getGridItems(),
    );
  }

  _getGridItems() {
    List<Widget> gridItems = List.generate(_itemCount, (index) => _getGridItem(index));
    return gridItems;
  }

  _getGridItem(int index) {
    return Container(
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(border: Border.all()),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.person,
                          ),
                          Text('Item $index'),
                        ],
                      ),
                    ),
                  ),
                  ((index + 1) % _crossAxisCount) == 0
                      ? Container()
                      : _getVerticalDivider(),
                ],
              ),
            ),
            _getHorizontalDivider(),
          ],
        ),
      ),
    );
  }


  _getHorizontalDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Divider(
        height: 0.0,
        color: Colors.black,
      ),
    );
  }

  _getVerticalDivider() {
    return RotatedBox(
      child: _getHorizontalDivider(),
      quarterTurns: 1,
    );
  }

}
