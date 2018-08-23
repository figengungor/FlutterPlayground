import 'package:flutter/material.dart';

class Demo3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo 3')),
      body: _getBody(),
    );
  }

  //LayoutBuilder gives the BoxConstraints of the widget that is wrapped
  //So We'll get max width and height of stack and divide them by 2
  //Then extract half of width and half of height of container from these
  //values to center the positioned widgets in the stack.
  Widget _getBody() => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => Stack(
              children: <Widget>[
                Container(
                  color: Colors.pink,
                ),
                Positioned(
                  //how far top of the widget from the top of the stack
                  top: constraints.maxHeight / 2 - 50.0,
                  //how far left of the widget from the left of the stack
                  left: constraints.maxWidth / 2 - 50.0,
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
      );
}
