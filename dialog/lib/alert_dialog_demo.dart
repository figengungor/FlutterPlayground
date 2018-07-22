import 'package:flutter/material.dart';

class AlertDialogDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AlertDialog Demo')),
      body: _getBody(context),
    );
  }

  _showInfoDialog(BuildContext context, String message) {
    var alert = new AlertDialog(
      title: Text('Congrats! 🎉'),
      content: Text(message),
      actions: <Widget>[
        FlatButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );

    showDialog(
      context: context,
      builder: (context) => alert,
    );
  }

  _showActionDialog(BuildContext context, String title, String message) {
    var alert = new AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Disagree'.toUpperCase(),
            )),
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Agree'.toUpperCase(),
            )),
      ],
    );

    showDialog(
      context: context,
      builder: (context) => alert,
    );
  }

  _showActionStackFullWidthButtonsDialog(
      BuildContext context, String title, String message) {
    var alert = new AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(message),
          Container(
            alignment: Alignment.bottomRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Turn on speed boost'.toUpperCase(),
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'No thanks'.toUpperCase(),
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    showDialog(
      context: context,
      builder: (context) => alert,
    );
  }

  _getBody(BuildContext context) {
    return ListView(
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            _showInfoDialog(context, 'You completed this lesson.');
          },
          child: Text('Info AlertDialog'),
        ),
        RaisedButton(
          onPressed: () {
            _showActionDialog(
                context,
                'Use location services?',
                'Let us help apps determine location.'
                ' This means sending anonymous location data to us, even when'
                'no apps are running.');
          },
          child: Text('Action AlertDialog'),
        ),
        RaisedButton(
          onPressed: () {
            _showActionStackFullWidthButtonsDialog(
                context,
                'Use location services?',
                'Let us help apps determine location.'
                ' This means sending anonymous location data to us, even when'
                'no apps are running.');
          },
          child: Text('Stacked full-width buttons AlertDialog'),
        )
      ]
          .map((item) => Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: item,
              ))
          .toList(),
    );
  }
}
