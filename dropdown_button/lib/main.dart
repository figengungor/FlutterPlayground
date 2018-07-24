import 'package:dropdown_button/constant.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DropdownButton Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DropdownButton Playground'),
      ),
      body: _getBody(context),
    );
  }

  _getBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: <Widget>[
        _getDropdownButtonBuggy(),
        _getDropdownButton(),
        _getFullWidthDropdownButton(),
        _getFullWidthAlignedDropdownButton(),
        _getFullWidthDropdownButtonWithBorderAll(),
        _getDropdownButtonWithInputDecorator(),
      ]
          .map((item) => Padding(
                child: item,
                padding: EdgeInsets.only(bottom: 16.0),
              ))
          .toList(),
    );
  }

  _getCityDropdownMenuItems() {
    return citiesOfTurkey
        .map((city) => DropdownMenuItem(value: city, child: Text(city)))
        .toList();
  }

  _getDropdownButtonBuggy() {
    return DropdownButton(
        value: _selectedCity,
        hint: Text('Select your city'),
        items: _getCityDropdownMenuItems(),
        onChanged: _onChanged);
  }

  _getDropdownButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DropdownButton(
            value: _selectedCity,
            hint: Text('Select your city'),
            items: _getCityDropdownMenuItems(),
            onChanged: _onChanged),
      ],
    );
  }

  _getFullWidthDropdownButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        DropdownButtonHideUnderline(
          child: DropdownButton(
            value: _selectedCity,
            hint: Text('Select your city'),
            items: _getCityDropdownMenuItems(),
            onChanged: _onChanged,
          ),
        ),
        Divider(
          height: 0.0,
        ),
      ],
    );
  }

  _getFullWidthAlignedDropdownButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ButtonTheme(
          alignedDropdown: true,
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: _selectedCity,
              hint: Text('Select your city'),
              items: _getCityDropdownMenuItems(),
              onChanged: _onChanged,
            ),
          ),
        ),
      ],
    );
  }

  _getFullWidthDropdownButtonWithBorderAll() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(border: Border.all()),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: _selectedCity,
              hint: Text('Select your city'),
              items: _getCityDropdownMenuItems(),
              onChanged: _onChanged,
            ),
          ),
        ),
      ],
    );
  }

  _getDropdownButtonWithInputDecorator() {
    return new InputDecorator(
      decoration: const InputDecoration(
        icon: const Icon(Icons.home),
        labelText: 'City',
      ),
      isEmpty: _selectedCity == null,
      child: new DropdownButtonHideUnderline(
        child: new DropdownButton<String>(
          value: _selectedCity,
          isDense: true,
          onChanged: _onChanged,
          items: _getCityDropdownMenuItems(),
        ),
      ),
    );
  }

  _onChanged(String value) {
    setState(() {
      _selectedCity = value;
    });
  }
}
