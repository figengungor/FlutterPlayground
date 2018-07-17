import 'package:flutter/material.dart';

class CheckboxListTileDemo extends StatefulWidget {
  @override
  _CheckboxListTileDemoState createState() => _CheckboxListTileDemoState();
}

class _CheckboxListTileDemoState extends State<CheckboxListTileDemo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _topics = [
    _Topic('Programming', false),
    _Topic('Music', false),
    _Topic('Cinema', false),
    _Topic('Book', false),
    _Topic('Dance', false),
    _Topic('Food', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('CheckboxListTile'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    var list = List<Widget>();
    //Add section title
    list.add(Text(
      'Check topics you\'re interested',
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    ));

    //Add checkboxes
    list.addAll(_topics.map((topic) => CheckboxListTile(
          title: Text('${topic.title}'),
          value: topic.isChecked,
          onChanged: (bool value) {
            setState(() {
              topic.isChecked = value;
            });
          },
        )));

    //Add Next button
    list.add(RaisedButton(
      child: Text('Next'),
      color: Colors.pink,
      textColor: Colors.white,
      onPressed: _showSnackBar,
    ));

    return ListView(
      padding: EdgeInsets.all(8.0),
      children: list,
    );
  }

  _showSnackBar() {
    final snackBar = SnackBar(
      content: Text(_topics
          .where((topic) => topic.isChecked)
          .map((topic) => topic.title)
          .toString()),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}

class _Topic {
  _Topic(this.title, this.isChecked);

  final String title;
  bool isChecked;
}
