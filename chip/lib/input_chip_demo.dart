import 'package:flutter/material.dart';

class InputChipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('InputChip Demo')),
      body: _buildBody(),
    );
  }

  _buildBody() => Center(
        child: Column(
          children: <Widget>[
            InputChip(
              label: Text('See more'),
              onPressed: () {},
            ),
            InputChip(
              label: Text('Travel Tips'),
            ),
          ],
        ),
      );
}
