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
        Material(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.0),
              side: BorderSide(color: Colors.white)),
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Login', style: TextStyle(color: Colors.white),),
            ),
          ),
        ),
      ],
    );
  }
}
