import 'package:flutter/material.dart';

class ClipRRectDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ClipRRect')),
      body: ListView(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0)),
                  child: Image.asset(
                    'assets/office_man.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                ListTile(
                  title: Text('The Office Hours'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
