import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Drawer Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer Playground'),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                  child: Icon(
                Icons.account_circle,
                size: 90.0,
                color: Colors.white,
              )),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Favorites'),
              leading: Icon(Icons.star),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            AboutListTile(
              child: Text('About App'),
              icon: Icon(Icons.info),
              applicationName: 'Drawer Playground',
              applicationVersion: 'Version 0.0.1',
              applicationIcon: Icon(Icons.star),
              applicationLegalese: 'Made with Flutter',
            )
          ],
        ),
      ),
      body: _getBody(context),
    );
  }

  _getBody(BuildContext context) {
    return Builder(
      builder: (BuildContext context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Text('Open Drawer'),
                ),
              ],
            ),
          ),
    );
  }
}
