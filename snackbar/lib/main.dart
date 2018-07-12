import 'package:flutter/material.dart';

//https://stackoverflow.com/questions/51304568/scaffold-of-called-with-a-context-that-does-not-contain-a-scaffold

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        title: Text('SnackBar Playground'),
      ),
      //Can't use the context of widget who instantiate Scaffold
      //In order to display SnackBar, we need to use context of the child
      //of Scaffold, so we wrap the body widget with Builder
      //OR
      //Create a custom widget for body => DemoPage()
      body: Builder(
        builder: (context) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.pink,
                    textColor: Colors.white,
                    onPressed: () {
                      _displaySnackBar(context);
                    },
                    child: Text('Simple'),
                  ),
                  RaisedButton(
                    color: Colors.pink,
                    textColor: Colors.white,
                    onPressed: () {
                      _displaySnackBarWithBackgroundColor(context);
                    },
                    child: Text('Background Color'),
                  ),
                  RaisedButton(
                    color: Colors.pink,
                    textColor: Colors.white,
                    onPressed: () {
                      _displaySnackBarWithAction(context);
                    },
                    child: Text('With Action'),
                  ),
                  RaisedButton(
                    color: Colors.pink,
                    textColor: Colors.white,
                    onPressed: () {
                      _displaySnackBarCustom(context);
                    },
                    child: Text('Custom'),
                  ),
                  RaisedButton(
                    color: Colors.pink,
                    textColor: Colors.white,
                    onPressed: () {
                      _displaySnackBar5Seconds(context);
                    },
                    child: Text('5 Seconds Duration'),
                  ),
                ]
                    .map((i) => Padding(
                          padding: EdgeInsets.all(8.0),
                          child: i,
                        ))
                    .toList(),
              ),
            ),
      ),
    );
  }

  _displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(content: Text('Are you talkin\' to me?'));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  _displaySnackBarWithBackgroundColor(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('How you like me now?'),
      backgroundColor: Colors.orange,
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  _displaySnackBarWithAction(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Connection Error.'),
      action: SnackBarAction(label: 'RETRY', onPressed: () {}),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  _displaySnackBarCustom(BuildContext context) {
    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('SUCCESS 🎉'),
          Text('Well done!'),
        ],
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  _displaySnackBar5Seconds(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('You got 5 seconds. Then I\'m gone.'),
      duration: Duration(seconds: 5),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
