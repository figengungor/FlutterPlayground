import 'package:flutter/material.dart';

class TabBarIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar Icon'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.favorite)),
              Tab(icon: Icon(Icons.star)),
              Tab(icon: Icon(Icons.access_time)),
            ],
          ),
        ),
        body: _getBody(),
      ),
    );
  }

  _getBody() {
    final iconSize = 200.0;
    return TabBarView(children: <Widget>[
      Icon(
        Icons.favorite,
        size: iconSize,
        color: Colors.red,
      ),
      Icon(
        Icons.star,
        size: iconSize,
        color: Colors.yellow,
      ),
      Icon(
        Icons.access_time,
        size: iconSize,
        color: Colors.green,
      ),
    ]);
  }
}
