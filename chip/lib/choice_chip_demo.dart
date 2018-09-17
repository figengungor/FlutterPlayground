import 'package:flutter/material.dart';

class ChoiceChipDemo extends StatefulWidget {
  @override
  _ChoiceChipDemoState createState() => _ChoiceChipDemoState();
}

class _ChoiceChipDemoState extends State<ChoiceChipDemo> {
  String _chosenSize = 'Large';
  final List<String> _sizes = [
    'XSmall',
    'Small',
    'Medium',
    'Large',
    'XLarge',
    'XXLarge'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ChoiceChip Demo')),
      body: Center(
        child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 8.0,
            children: _sizes
                .map((String size) => ChoiceChip(
                      selected: _chosenSize == size,
                      selectedColor: Colors.black,
                      label: Text(
                        size,
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onSelected: (bool selected) =>
                          setState(() => _chosenSize = selected ? size : null),
                    ))
                .toList()),
      ),
    );
  }
}
