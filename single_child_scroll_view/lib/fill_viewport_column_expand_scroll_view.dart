import 'package:flutter/material.dart';

class FillViewPortColumnExpandScrollView extends StatefulWidget {
  @override
  FillViewPortColumnExpandScrollViewState createState() {
    return FillViewPortColumnExpandScrollViewState();
  }
}

class FillViewPortColumnExpandScrollViewState
    extends State<FillViewPortColumnExpandScrollView> {
  double _containerHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          _containerHeight = _containerHeight == 100.0 ? 300.0 : 100.0;
        });
      }),
      appBar: AppBar(title: Text('Fill ViewPort Colum Expand Scroll View')),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return Container(
            color: Colors.pink,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        // A fixed-height child.
                        color: Colors.yellow,
                        height: _containerHeight,
                      ),
                      Container(
                        // Another fixed-height child.
                        color: Colors.green,
                        height: _containerHeight,
                      ),
                      Expanded(
                        child: Container(
                          // Another fixed-height child.
                          color: Colors.purple,
                          height: _containerHeight,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
