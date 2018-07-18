import 'package:flutter/material.dart';

class ListTileDivideTilesDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListTile.divideTiles'),
      ),
      body: _getBody(context),
    );
  }

  _getBody(BuildContext context) {
    return ListView(
      children: _getListTilesWithDivider(context),
    );
  }

  _getListTilesWithDivider(BuildContext context) {
    List<Widget> list = List.generate(
      10,
      (index) => ListTile(
            title: Text('Text $index'),
          ),
    );

    var dividedList = ListTile
        .divideTiles(
          context: context,
          color: Theme.of(context).dividerColor,
          tiles: list,
        )
        .toList();

    return dividedList;
  }
}
