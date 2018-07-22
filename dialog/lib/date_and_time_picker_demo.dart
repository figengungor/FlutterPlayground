import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateAndTimePickerDemo extends StatefulWidget {
  @override
  _DateAndTimePickerDemoState createState() => _DateAndTimePickerDemoState();
}

class _DateAndTimePickerDemoState extends State<DateAndTimePickerDemo> {
  DateTime _selectedDate;
  TimeOfDay _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date And Time Picker Dialog'),
      ),
      body: _getBody(context),
    );
  }

  _openDatePickerDialog(BuildContext context) async {
    var dateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (dateTime != null) {
      setState(() {
        _selectedDate = dateTime;
      });
    }
  }

  _openTimePickerDialog(BuildContext context) async {
    var timeOfDay =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (timeOfDay != null) {
      setState(() {
        _selectedTime = timeOfDay;
      });
    }
  }

  _getBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  _openDatePickerDialog(context);
                },
                child: Text('Select Date'),
              ),
              Expanded(
                child: Text(
                  'Selected date: ${_selectedDate != null ? DateFormat.yMMMd()
                    .format(_selectedDate) : ''}',
                  textAlign: TextAlign.end,
                ),
              )
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  _openTimePickerDialog(context);
                },
                child: Text('Select Time'),
              ),
              Expanded(
                child: Text(
                  'Selected time: ${_selectedTime != null ? _selectedTime.format(
                    context) : ''}',
                  textAlign: TextAlign.end,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
