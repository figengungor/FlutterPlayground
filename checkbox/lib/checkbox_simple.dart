import 'package:flutter/material.dart';

class CheckboxSimple extends StatefulWidget {
  @override
  _CheckboxSimpleState createState() => _CheckboxSimpleState();
}

class _CheckboxSimpleState extends State<CheckboxSimple> {
  var _termsAndConditionsIsChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBox Simple'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
              activeColor: Colors.green,
              value: _termsAndConditionsIsChecked,
              onChanged: (bool value) {
                setState(() {
                  _termsAndConditionsIsChecked = value;
                });
              },
            ),
            Text('I have read Terms and Conditions.')
          ],
        ),
        SizedBox(
          height: 16.0,
        ),
        RaisedButton(
          onPressed: _termsAndConditionsIsChecked ? () {} : null,
          textColor: Colors.white,
          color: Colors.pink,
          child: Text('Register'),
        )
      ],
    );
  }
}
