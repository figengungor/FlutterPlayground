import 'package:flutter/material.dart';
import 'package:navigation/page1.dart';
import 'package:navigation/page2.dart';
import 'package:navigation/page3.dart';
import 'package:navigation/page_go_back.dart';
import 'package:navigation/page_recieves_data.dart';
import 'package:navigation/page_sends_data_back.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        PageGoBack.routeName: (BuildContext context) => PageGoBack(),
        Page1.routeName: (BuildContext context) => Page1(),
        Page2.routeName: (BuildContext context) => Page2(),
        Page3.routeName: (BuildContext context) => Page3(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  Color _buttonColor;

  @override
  void initState() {
    super.initState();
    _buttonColor = Colors.pink;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Playground'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          _getSimplePushButton(context),
          _getSimplePushNamedButton(context),
          _getPushPassingDataButton(context),
          _getPushForResultDataButton(context),
          _getPushReplacementAndPopAndPushButton(context),
          _getPopUntilAndPushAndRemoveUntilButton(context),
        ]
            .map((item) => Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: item,
                ))
            .toList(),
      ),
    );
  }

  _getSimplePushButton(BuildContext context) {
    //Let's go to page 1 with pushNamed and come back with pop
    return _getRaisedButton(
      title: 'Simple push',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageGoBack(),
          ),
        );
      },
    );
  }

  _getSimplePushNamedButton(BuildContext context) {
    //Let's go to page 1 with pushNamed and come back with pop
    return _getRaisedButton(
      title: 'Simple pushNamed',
      onPressed: () {
        Navigator.pushNamed(context, PageGoBack.routeName);
      },
    );
  }

  _getPushPassingDataButton(BuildContext context) {
    //Let's go to page 1 with pushNamed and come back with pop
    return _getRaisedButton(
      title: 'push Passing Data',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageReceivesData('Greetings from Homepage'),
          ),
        );
      },
    );
  }

  _getPushForResultDataButton(BuildContext context) {
    //Let's go to page 1 with pushNamed and come back with pop
    return _getRaisedButton(
      title: 'push For Result',
      onPressed: () async {
        Color buttonColor = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageSendsDataBack(),
          ),
        );
        if (buttonColor != null) {
          setState(() {
            _buttonColor = buttonColor;
          });
        }
      },
    );
  }

  _getPushReplacementAndPopAndPushButton(BuildContext context) {
    //Go to Page 1.
    //From Page 1 go to Page 2 with pushReplacement.
    //So Page 1 will be removed from stack and Page 2 will be opened.
    //When returning from Page 2, you will return to HomePage

    return _getRaisedButton(
      title: 'pushReplacement & popAndPush Demo',
      onPressed: () {
        Navigator.pushNamed(context, Page1.routeName);
      },
    );
  }

  _getPopUntilAndPushAndRemoveUntilButton(BuildContext context) {
    //Go to Page 1.
    //From Page 1 go to Page 2 with pushReplacement.
    //So Page 1 will be removed from stack and Page 2 will be opened.
    //When returning from Page 2, you will return to HomePage

    return _getRaisedButton(
      title: 'popUntil & pushAndRemoveUntil\nPage1 > Page2 > Page3',
      onPressed: () {
        Navigator.pushNamed(context, Page1.routeName);
      },
    );
  }

  _getRaisedButton({String title, VoidCallback onPressed}) {
    return RaisedButton(
      child: Text(title, textAlign: TextAlign.center,),
      onPressed: onPressed,
      textColor: Colors.white,
      color: _buttonColor,
    );
  }
}
