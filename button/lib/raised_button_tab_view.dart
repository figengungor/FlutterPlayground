import 'package:flutter/material.dart';
import 'colors.dart';

class RaisedButtonTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: _getRaisedButtons(context)
            .map((Widget widget) => Padding(
                  padding: EdgeInsets.all(8.0),
                  //wrap button with Column to make it wrap_content
                  //otherwise button fills entire width as list
                  child: Column(
                    children: <Widget>[
                      widget,
                    ],
                  ),
                ))
            .toList());
  }
}

List<Widget> _getRaisedButtons(BuildContext context) {
  return <Widget>[
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        RaisedButton(
          onPressed: () {},
          child: Text('Simple'),
        ),
        RaisedButton(
          onPressed: null,
          child: Text('Disabled'),
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
        ),
      ],
    ),
    RaisedButton(
      onPressed: () {},
      child: Text('Colored'),
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
    ),
    RaisedButton(
      onPressed: () {},
      child: Text('Orange Splash Color'),
      color: kBrandBlue500,
      textColor: Colors.white,
      splashColor: kBrandOrange900,
    ),
    RaisedButton(
      onPressed: () {},
      child: Text('Orange Highlight Color'),
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      highlightColor: kBrandOrange900,
    ),
    RaisedButton(
      onPressed: () {},
      child: Text('Blue Splash & Highlight'),
      color: kBrandBlue500,
      textColor: Colors.white,
      highlightColor: kBrandBlue400,
      splashColor: kBrandBlue300,
    ),
    RaisedButton(
      onPressed: () {},
      child: Text('Border'),
      color: Colors.white,
      textColor: Colors.black,
      shape: Border.all(width: 3.0, color: Colors.black),
    ),
    RaisedButton(
      onPressed: () {},
      child: Icon(Icons.plus_one),
      color: Colors.pink,
      textColor: Colors.white,
      shape: CircleBorder(),
      padding: EdgeInsets.all(16.0),
    ),
    RaisedButton(
      onPressed: () {},
      child: Text('Beveled Rectangle Border'),
      color: Colors.pink,
      textColor: Colors.white,
      shape: BeveledRectangleBorder(),
    ),
    RaisedButton(
      onPressed: () {},
      child: Text('Stadium Border'),
      color: Colors.green,
      textColor: Colors.white,
      shape: StadiumBorder(),
    ),
    RaisedButton(
      onPressed: () {},
      child: Text('Rounded Rectangle Border'),
      color: Colors.pink,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(60.0))),
    ),
    RaisedButton(
      onPressed: () {},
      child: Text('Left Rounded Rectangle Border'),
      color: Colors.pink,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(60.0))),
    ),
  ];
}
