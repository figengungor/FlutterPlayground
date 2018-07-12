import 'package:flutter/material.dart';

class GhostButtonTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.blue.shade500, Colors.blue.shade100],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0]),
      ),
      child: _getGhostButton(),
    );
  }

  _getGhostButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: FlatButton(
            color: Colors.transparent,
            textColor: Colors.white,
            child: Text('Login'),
            onPressed: () {},
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2.0),
          ),
        ),
      ],
    );
  }
}
