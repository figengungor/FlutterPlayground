import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WillPopScope',
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
    return WillPopScope(
      // onWillPop takes a callback that returns a Future<bool>
      // If the callback returns a Future that resolves to false, the enclosing
      // route will not be popped.
      onWillPop: () async {
        bool isClose = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
                  content: Text('You shall not leave!'),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: Text('Shut up and let me out!'),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: Text('Ok'),
                    )
                  ],
                ));
        return isClose;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('WillPopScope'),
        ),
        body: Center(child: Text('Press the back button!')),
      ),
    );
  }
}
