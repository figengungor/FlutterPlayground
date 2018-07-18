import 'package:flutter/material.dart';

class ListViewDividerIndentDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Divider Indent'),
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
              leading: Icon(Icons.person),
              title: Text('Item $index'),
            ),
            //Do not add divider to last item
            index == itemCount - 1
                ? Container()
                : Divider(
                    color: Colors.pink,
                    indent: 72.0,
                  ),
          ],
        );
      },
    );
  }
}
