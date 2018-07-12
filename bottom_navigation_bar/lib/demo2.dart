import 'package:flutter/material.dart';

class Demo2 extends StatefulWidget {
  @override
  Demo2State createState() {
    return new Demo2State();
  }
}

class Demo2State extends State<Demo2> {
  int _currentIndex = 0;
  double _iconSize = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo 2'),
      ),
      body: _getBody(_currentIndex),
      bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

  _getBottomNavigationBar() {
    return Theme(
      data: ThemeData(
          //active colors
          primaryColor: Colors.pinkAccent,
          //inactive colors
          textTheme: Theme
              .of(context)
              .textTheme
              .copyWith(caption: TextStyle(color: Colors.blue))),
      child: BottomNavigationBar(
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
      ),
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
          ),
        );
      case 1:
        return Center(
          child: Icon(
            Icons.search,
            size: _iconSize,
          ),
        );
      case 2:
        return Center(
          child: Icon(
            Icons.person,
            size: _iconSize,
          ),
        );
    }
  }
}
