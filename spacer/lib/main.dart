import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spacer Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
        title: Text('Spacer Playground'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'A',
                style: TextStyle(background: Paint()..color = Colors.orange),
              ),
              Spacer(),
              Text(
                'B',
                style: TextStyle(background: Paint()..color = Colors.orange),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: <Widget>[
              Text(
                'A',
                style: TextStyle(background: Paint()..color = Colors.orange),
              ),
              Spacer(flex: 2),
              Text(
                'B',
                style: TextStyle(background: Paint()..color = Colors.orange),
              ),
              Spacer(),
              Text(
                'C',
                style: TextStyle(background: Paint()..color = Colors.orange),
              )
            ],
          ),
          Spacer(),
          Row(
            children: <Widget>[
              Spacer(),
              Text(
                'A',
                style: TextStyle(background: Paint()..color = Colors.orange),
              ),
              Spacer(),
              Text(
                'B',
                style: TextStyle(background: Paint()..color = Colors.orange),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
