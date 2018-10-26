import 'package:flutter/material.dart';

class SliverAppBarFloatingDemo extends StatelessWidget {
  //floating:true makes appbar appear immediately when scrolling down.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              title: Text("SliverAppBar(floating:true)"),
            ),
            SliverList(delegate: SliverChildListDelegate(
              List.generate(100, (_)=>Text("All work and no play makes Jack a dull boy.")),
            ),)
          ],
        ),
    );
  }
}
