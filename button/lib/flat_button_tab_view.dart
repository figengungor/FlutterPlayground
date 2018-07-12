import 'package:flutter/material.dart';
import 'colors.dart';

class FlatButtonTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              child: Text("Ok".toUpperCase()),
              onPressed: () {},
            ),
            FlatButton(
              child: Text("Cancel".toUpperCase()),
              textColor: kBrandOrange900,
              onPressed: () {},
            ),
          ],
        ),
        FlatButton(
          child: Text("Retry".toUpperCase()),
          textColor: kBrandOrange900,
          onPressed: () {},
        ),
        FlatButton(
          child: Text("Try Again".toUpperCase()),
          textColor: Colors.red,
          onPressed: () {},
        ),
      ],
    );
  }
}
