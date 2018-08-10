import 'package:flutter/material.dart';

class FillViewPortScrollView extends StatefulWidget {
  @override
  FillViewPortScrollViewState createState() {
    return FillViewPortScrollViewState();
  }
}

class FillViewPortScrollViewState extends State<FillViewPortScrollView> {
  double _containerHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          _containerHeight = _containerHeight == 100.0 ? 300.0 : 100.0;
        });
      }),
      appBar: AppBar(title: Text('Fill ViewPort Scroll View')),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return Container(
            color: Colors.pink,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      // A fixed-height child.
                      color: Colors.yellow,
                      height: _containerHeight,
                      child: Text('In this example, the children are spaced '
                          'out equally, unless there\'s no more room, in which '
                          'case they stack vertically and scroll.'
                          'Pink color is the color of container that wraps '
                          'SingleChildScrollView so you can see it takes '
                          'full height when it\'s not scrollable'),
                    ),
                    Container(
                      // Another fixed-height child.
                      color: Colors.green,
                      height: _containerHeight,
                      child: Text('Tap on Iconless Fabutton to increase '
                          'the box size and let it scrollllll'),
                    ),
                    Container(
                      // Another fixed-height child.
                      color: Colors.purple,
                      height: _containerHeight,
                      child: Text(
                          'LayoutBuilder provides BoxConstraints of viewport '
                          'Then we use this to make the SingleChildScrollView '
                          'to take full viewport height we gave it '
                          'a ConstrainedBox child which has BoxConstraints '
                          'with a minHeight of viewportConstraints.maxHeight '
                          'from LayoutBuilder. WOOO! '),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
