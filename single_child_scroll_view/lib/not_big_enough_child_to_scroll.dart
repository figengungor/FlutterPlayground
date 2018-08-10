import 'package:flutter/material.dart';

class NotBigEnoughChildToScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Not Big Enough Child to Scroll')),
      body: Container(
        color: Colors.pink,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(16.0),
                height: 250.0,
                color: Colors.green,
                child: Center(
                  child: Text(
                    'Pink color is the color of Container that wraps '
                        'SingleChildScrollView.'
                        'As you can see SingleChildScrollView only gets size of its '
                        'child. See the example \'Fill Viewport ScrollView\' '
                        'to learn how to make it '
                        'take full height of viewport to align the child inside '
                        'SingleChildScrollView when it\'s not scrollable',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
