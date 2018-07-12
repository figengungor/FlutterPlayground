import 'package:flutter/material.dart';

class Demo3 extends StatefulWidget {
  @override
  Demo3State createState() {
    return new Demo3State();
  }
}

class Demo3State extends State<Demo3> {
  int _currentIndex = 0;
  double _iconSize = 100.0;

  static const _barItemColors = [
    Colors.pink,
    Colors.green,
    Colors.orange,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo 3'),
      ),
      body: _getBody(_currentIndex),
      bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

  _getBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      currentIndex: _currentIndex,
      onTap: (int i) => _updateCurrentIndex(i),
      items: [
        BottomNavigationBarItem(
          title: Text('Home'),
          icon: Icon(Icons.home),
          backgroundColor: _barItemColors[0],
        ),
        BottomNavigationBarItem(
          title: Text('Search'),
          icon: Icon(Icons.search),
          backgroundColor: _barItemColors[1],
        ),
        BottomNavigationBarItem(
          title: Text('Profile'),
          icon: Icon(Icons.person),
          backgroundColor: _barItemColors[2],
        ),
      ],
    );
  }

  _updateCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  _getBody(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return Center(
          child: Icon(
            Icons.home,
            size: _iconSize,
            color: _barItemColors[0],
          ),
        );
      case 1:
        return Center(
          child: Icon(
            Icons.search,
            size: _iconSize,
            color: _barItemColors[1],
          ),
        );
      case 2:
        return Center(
          child: Icon(
            Icons.person,
            size: _iconSize,
            color: _barItemColors[2],
          ),
        );
    }
  }
}
