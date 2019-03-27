import 'package:flutter/material.dart';

class ButtonThemeTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _getButtons(context);
  }

  _getButtons(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('RaisedButton default min size w:88 h:36'),
          ),
          RaisedButton(
            color: Colors.pink,
            onPressed: () {},
            child: Text('Login'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('RaisedButton size overridden by ButtonTheme minW:50, h=50'),
          ),
          ButtonTheme(
            minWidth: 50,
            height: 50,
            child: RaisedButton(
              color: Colors.pink,
              onPressed: () {},
              child: Text('Login'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('ButtonTheme textTheme: ButtonTextTheme.primary'),
          ),
          ButtonTheme(

          textTheme: ButtonTextTheme.primary,
            child: RaisedButton(
              onPressed: () {},
              child: Text('Login'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('ButtonTheme.bar with ButtonBar(used in Material Dialog buttons etc)'),
          ),
          ButtonTheme.bar(
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  onPressed: () {},
                  child: Text('Ok'),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text('Cancel'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('ButtonTheme colorScheme'),
          ),
          ButtonTheme(
            colorScheme: ColorScheme.dark(primary: Colors.pink),
            child: ButtonBar(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  child: Text('Ok'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('Cancel'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
