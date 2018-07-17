import 'package:flutter/material.dart';

class TabBarScrollable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar Scrollable'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Popular'),
              Tab(text: 'Top rated'),
              Tab(text: 'Upcoming'),
              Tab(text: 'Now Playing'),
              Tab(text: 'Favorites'),
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
      Icon(
        Icons.play_arrow,
        size: iconSize,
        color: Colors.purple,
      ),
      Icon(
        Icons.favorite,
        size: iconSize,
        color: Colors.pink,
      ),
    ]);
  }
}
