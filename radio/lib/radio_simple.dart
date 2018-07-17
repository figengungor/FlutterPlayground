import 'package:flutter/material.dart';

class RadioSimple extends StatefulWidget {
  @override
  _RadioSimpleState createState() => _RadioSimpleState();
}

class _RadioSimpleState extends State<RadioSimple> {
  _Gender _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Simple'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Choose Gender',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23.0,
            ),
          ),

          Padding(padding: EdgeInsets.only(top: 8.0),),

          Row(
            children: _getGenderRadioButtons(),
          ),

          Expanded(
            child: Center(
                child: Text(
              _selectedGender == null ? '?' : _selectedGender.value,
              style: TextStyle(fontSize: 70.0),
            )),
          )
        ],
      ),
    );
  }

  _getGenderRadioButtons() {
    return _genderList
        .map((gender) => Row(
              children: <Widget>[
                Radio<_Gender>(
                  value: gender,
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
                Text('${gender.value}'),
              ],
            ))
        .toList();
  }
}

final _genderList = [
  _Gender('0', 'Female'),
  _Gender('1', 'Male'),
];

class _Gender {
  _Gender(this.id, this.value);

  final String id;
  final String value;
}
