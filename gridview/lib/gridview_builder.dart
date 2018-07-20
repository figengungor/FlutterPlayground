import 'package:flutter/material.dart';

class GridViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView.builder()'),
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
        return _getGridItem(index);
      },
    );
  }

  _getGridItem(int index) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Icon(Icons.person), Text('Item $index')],
      ),
    );
  }
}
