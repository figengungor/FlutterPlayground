import 'package:flutter/material.dart';

class FilterChipDemo extends StatefulWidget {
  @override
  _FilterChipDemoState createState() => _FilterChipDemoState();
}

class _FilterChipDemoState extends State<FilterChipDemo> {
  final List<String> _allIngredients = [
    'olive',
    'cheese',
    'mushroom',
    'pepper',
  ];

  List<String> _filter = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FilterInput Demo')),
      body: _buildBody(),
    );
  }

  _buildBody() => Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8.0,
            children: _allIngredients
                .map((ingredient) => FilterChip(
                      selected: _filter.contains(ingredient),
                      onSelected: (bool value) {
                        setState(() {
                          if (value) {
                            _filter.add(ingredient);
                          } else {
                            _filter.removeWhere(
                              (String item) => item == ingredient,
                            );
                          }
                        });
                      },
                      label: Text(ingredient),
                    ))
                .toList(),
          ),
          Text('Extra ingredients: ${_filter.join(', ')}')
        ],
      ));
}
