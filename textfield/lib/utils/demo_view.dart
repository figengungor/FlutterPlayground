import 'package:flutter/material.dart';

class DemoView extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const DemoView({Key key, this.title, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(color: Colors.pink),
            ),
          ]
            ..addAll(children)
            ..map((item) => Padding(padding: EdgeInsets.all(8.0), child: item))
                .toList()),
    );
  }
}
