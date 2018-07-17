import 'package:flutter/material.dart';

class TabBarTextIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar Text & Icon'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Popular',
                icon: Icon(Icons.favorite),
              ),
              Tab(
                text: 'Top rated',
                icon: Icon(Icons.star),
              ),
              Tab(
                text: 'Upcoming',
                icon: Icon(Icons.access_time),
              ),
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
