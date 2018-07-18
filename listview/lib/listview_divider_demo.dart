import 'package:flutter/material.dart';

class ListViewDividerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListViewDivider'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    var itemCount = 50;

    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            ListTile(
              title: Text('Item $index'),
            ),
            //Do not add divider to last item
            index == itemCount-1 ? Container() : Divider(height: 1.0,),
          ],
        );
      },
    );
  }
}
