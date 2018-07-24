import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SharedPreferences Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter;
  static const KEY_COUNTER = 'counter';

  @override
  void initState() {
    _loadCounter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SharedPreferences Playground'),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () {
              _incrementCounter();
            },
            child: Text('Counter: $_counter'),
          ),
        ),
      ),
    );
  }

  _loadCounter() async{

    var preferences = await SharedPreferences.getInstance();

    setState(() {
      _counter = preferences.getInt(KEY_COUNTER) ?? 0;
    });

  }

  _incrementCounter() async{

    var preferences = await SharedPreferences.getInstance();

    setState(() {
      _counter++;
    });

    preferences.setInt(KEY_COUNTER, _counter);

  }
}
