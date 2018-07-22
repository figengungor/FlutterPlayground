import 'package:flutter/material.dart';

//https://stackoverflow.com/questions/46690765/
// flutter-radio-animation-is-not-showing-up-on-showdialog

class AlertDialogSingleChoiceDemo extends StatefulWidget {
  @override
  _AlertDialogSingleChoiceDemoState createState() =>
      _AlertDialogSingleChoiceDemoState();
}

class _AlertDialogSingleChoiceDemoState
    extends State<AlertDialogSingleChoiceDemo> {
  final ringTones = [
    'None',
    'Callisto',
    'Ganymede',
    'Luna',
    'Oberon',
    'Phobos',
    'Dione',
    'Dione2',
    'Dione3',
    'Dione4',
  ];

  var _ringTone;

  @override
  void initState() {
    super.initState();
    _ringTone = ringTones[3];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AlertDialog Single Choice')),
      body: _getBody(),
    );
  }

  _getBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              _showSingleChoiceAlertDialog();
            },
            child: Text('Single choice Alert Dialog'),
          ),
          SizedBox(
            height: 16.0,
          ),
          Text('Chosen ringtone: $_ringTone')
        ],
      ),
    );
  }

  _showSingleChoiceAlertDialog() {
    showDialog(
      context: context,
      builder: (context) => SingleChoiceDialog(
          ringTones, //choice list
          _ringTone, //initial value
          (value) => setState(() {
                _ringTone = value;
              })),
    );
  }
}

typedef void DialogCallback(String color);

class SingleChoiceDialog extends StatefulWidget {
  final List<String> ringTones;
  final DialogCallback onSubmit;
  final String initialValue;

  SingleChoiceDialog(this.ringTones, this.initialValue, this.onSubmit);

  @override
  _SingleChoiceDialogState createState() => _SingleChoiceDialogState();
}

class _SingleChoiceDialogState extends State<SingleChoiceDialog> {
  var _choice;

  @override
  void initState() {
    super.initState();
    _choice = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      contentPadding: EdgeInsets.all(0.0),
      title: Text('Phone ringtone'),
      content: _getRingtoneList(),
      actions: <Widget>[
        FlatButton(
          child: Text('CANCEL'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.pop(context);
            widget.onSubmit(_choice);
          },
        )
      ],
    );
  }

  _getRingtoneList() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 24.0,
        ),
        Divider(
          height: 0.0,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: ListBody(
                children: widget.ringTones
                    .map(
                      (ringTone) => RadioListTile(
                            title: Text(ringTone),
                            value: ringTone,
                            groupValue: _choice,
                            onChanged: (value) {
                              setState(() {
                                _choice = value;
                              });
                            },
                          ),
                    )
                    .toList()),
          ),
        ),
        Divider(
          height: 0.0,
        ),
      ],
    );
  }
}
