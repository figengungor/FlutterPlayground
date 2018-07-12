import 'package:flutter/material.dart';

class AppBar6Screen extends StatefulWidget {
  @override
  AppBar6ScreenState createState() {
    return new AppBar6ScreenState();
  }
}

class AppBar6ScreenState extends State<AppBar6Screen> {
  static const List<String> _menuItems = ['Item 1', 'Item 2', 'Item 3'];
  var _selectedMenuItem;

  @override
  void initState() {
    super.initState();
    _selectedMenuItem = _menuItems[0];
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Overflow Menu"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.star_border),
              onPressed: () {},
            ),
            PopupMenuButton<String>(
              initialValue: _selectedMenuItem,
              onSelected: (item) => _updateSelectedMenuItem(item),
              itemBuilder: (BuildContext context) => _menuItems
                  .map((String item) => PopupMenuItem<String>(
                        value: item,
                        child: Text(item),
                      ))
                  .toList(),
            ),
          ],
        ),
        body: Center(
          child: Text(
            _selectedMenuItem,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      );

  void _updateSelectedMenuItem(String item) {
    setState(() {
      _selectedMenuItem = item;
    });
  }
}
