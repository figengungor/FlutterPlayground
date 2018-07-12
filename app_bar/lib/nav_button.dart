import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  NavButton({@required this.title, @required this.routeName});

  final title;
  final routeName;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
          child: Text(
            title,
            style: TextStyle(fontSize: 16.0),
          ),
          onPressed: () {
            Navigator.pushNamed(context, routeName);
          },
          color: Colors.blue,
          textColor: Colors.white,
        ),
      );
}
