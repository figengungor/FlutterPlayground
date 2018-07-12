import 'package:flutter/material.dart';

class Demo1 extends StatefulWidget {
  @override
  Demo1State createState() {
    return new Demo1State();
  }
}

class Demo1State extends State<Demo1> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo 1'),
      ),
      body: _getBody(_currentIndex),
      bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

  _getBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (int i) => _updateCurrentIndex(i),
      items: [
        BottomNavigationBarItem(
          title: Text('Home'),
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          title: Text('Search'),
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          title: Text('Profile'),
          icon: Icon(Icons.person),
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
          size: 100.0,
        ));
      case 1:
        return Center(
          child: Icon(
            Icons.search,
            size: 100.0,
          ),
        );
      case 2:
        return Center(
          child: Icon(
            Icons.person,
            size: 100.0,
          ),
        );
    }
  }
}
