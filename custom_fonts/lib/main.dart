import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Fonts',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'IndieFlower'),
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Fonts'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Text('The custom font set only to this Text', style: TextStyle(fontFamily: 'LuckiestGuy-Regular'),),
          Text('The custom font set with ThemeData of the app.'),
          TextField(
            decoration: InputDecoration(labelText: 'Username'),
          ),
          ListTile(
            title: Text('Title'),
            subtitle: Text('Subtitle'),
          ),
          SwitchListTile(
            onChanged: (bool value) {},
            value: false,
            title: Text('Brightness'),
            subtitle: Text('isDark'),
          ),
          CheckboxListTile(
            value: true,
            onChanged: (bool value) {},
            title: Text('Read Terms and Conditions'),
          )
        ],
      ),
    );
  }
}
