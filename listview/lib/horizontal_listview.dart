import 'package:flutter/material.dart';

typedef GetListItem(int index);

class HorizontalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Using ListTile'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return Column(
      children: <Widget>[
        _getHorizontalListView(_getListItem),
        _getHorizontalListView(_getListItemWithDivider),
        _getHorizontalListView(_getListItemWithCustomDivider),
      ]
          .map((item) => Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: item,
              ))
          .toList(),
    );
  }

  _getHorizontalListView(GetListItem getListItem) {
    List<Widget> list = List.generate(30, (index) => getListItem(index));
    return Container(
      height: 100.0,
      child: ListView(
        children: list,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  _getListItem(int index) {
    return Container(
      width: 100.0,
      child: Center(child: Text('Item $index')),
    );
  }

  _getListItemWithDivider(int index) {
    return Container(
      width: 100.0,
      child: Row(
        children: <Widget>[
          Expanded(child: Center(child: Text('Item $index'))),
          RotatedBox(
            quarterTurns: 1,
            child: Divider(
              height: 0.0,
            ),
          )
        ],
      ),
    );
  }

  _getListItemWithCustomDivider(int index) {
    return Container(
      width: 100.0,
      child: Row(
        children: <Widget>[
          Expanded(child: Center(child: Text('Item $index'))),
          SizedBox(
            height: 100.0,
            width: 5.0,
            child: Container(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
