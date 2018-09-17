import 'package:flutter/material.dart';

class ActionChipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ActionChip Demo')),
      body: _buildBody(),
    );
  }

  _buildBody() => Container(
        margin: EdgeInsets.all(8.0),
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('ActionChip? 1 2 3 Action!'),
                ButtonBar(
                  children: <Widget>[
                    ActionChip(
                      label: Text('See more'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
