import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DateAndTimePickers Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  //DatePicker variables
  DateTime _selectedDate;
  String _selectedDateFormatted;

  //TimePicker variables
  TimeOfDay _selectedTime;
  String _selectedTimeFormatted;

  @override
  void initState() {
    _selectedDate = DateTime.now();
    _selectedDateFormatted = 'Select Date';

    _selectedTime = TimeOfDay(hour: 16, minute: 32);
    _selectedTimeFormatted = 'Select Time';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DateAndTimePickers Playground'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(_selectedDateFormatted),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
              onPressed: () => _chooseDate(),
            ),
            RaisedButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(_selectedTimeFormatted),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
              onPressed: () => _chooseTime(),
            ),
          ],
        ),
      ),
    );
  }

  void _chooseDate() async {
    DateTime selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), //initial selected date
      firstDate: DateTime(1991, 7), //lower bound for date
      lastDate: DateTime(2040), // upper bound for date
    );

    //If the value is returned with non-null and different than the previous
    //DateTime, then save 'em all.(DateTime and formatted String)
    if (selectedDate != null && selectedDate != _selectedDate) {
      setState(() {
        _selectedDate = selectedDate;
        _selectedDateFormatted = getFormattedDate(_selectedDate);
      });
    }
  }

  void _chooseTime() async {
    TimeOfDay selectedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    //If the value is returned with non-null and different than the previous
    //TimeOfDay, then save 'em all.(TimeOfDay and formatted String)
    if (selectedTime != null && selectedTime != _selectedTime) {
      setState(() {
        _selectedTime = selectedTime;
        _selectedTimeFormatted = getFormattedTime(_selectedTime, context);
      });
    }
  }

  static String getFormattedDate(DateTime date) {
    return DateFormat.yMMMd().format(date);
  }

  static String getFormattedTime(TimeOfDay time, BuildContext context) {
    return time.format(context);
  }
}
