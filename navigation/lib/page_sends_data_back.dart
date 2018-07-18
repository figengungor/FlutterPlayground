import 'package:flutter/material.dart';

class PageSendsDataBack extends StatefulWidget {
  @override
  PageSendsDataBackState createState() {
    return new PageSendsDataBackState();
  }
}

class PageSendsDataBackState extends State<PageSendsDataBack> {
  final _title = 'Page Sends Data Back';

  var _selectedColor;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _title,
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              'Choose Color to send back to previous page',
              style: TextStyle(color: Colors.red),
            ),
            _getColorRadios(),
            Text('Navigator.pop(context, _selectedColor)'),
            RaisedButton(
              child: Text('Change home button color'),
              onPressed: () {
                Navigator.pop(context, _selectedColor);
              },
            )
          ]
              .map((item) => Padding(
                    padding: EdgeInsets.all(8.0),
                    child: item,
                  ))
              .toList(),
        ),
      ),
    );
  }

  _getColorRadios() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Green'),
        Radio(
          onChanged: (value) {
            setState(() {
              _selectedColor = value;
            });
          },
          groupValue: _selectedColor,
          value: Colors.green,
        ),
        Text('Pink'),
        Radio(
          onChanged: (value) {
            setState(() {
              _selectedColor = value;
            });
          },
          groupValue: _selectedColor,
          value: Colors.pink,
        ),
      ],
    );
  }
}
