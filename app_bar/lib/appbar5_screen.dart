import 'package:flutter/material.dart';

class AppBar5Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Overflow Menu"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.star_border),
              onPressed: () {},
            ),
            PopupMenuButton<String>(
              onSelected: (String s) {},
              itemBuilder: (BuildContext context) {
                return ['Item 1', 'Item 2', 'Item 3']
                    .map((String item) => PopupMenuItem<String>(
                          value: item,
                          child: Text(item),
                        ))
                    .toList();
              },
            ),
          ],
        ),
      );
}
