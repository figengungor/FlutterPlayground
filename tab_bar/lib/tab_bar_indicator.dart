import 'package:flutter/material.dart';

class TabBarIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBarIndicator'),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(text: 'Popular'),
              Tab(text: 'Top rated'),
              Tab(text: 'Upcoming'),
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
