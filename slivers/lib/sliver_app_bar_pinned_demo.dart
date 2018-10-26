import 'package:flutter/material.dart';

class SliverAppBarPinnedDemo extends StatelessWidget {
  //pinned:true makes appbar pinned to the top.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              title: Text("SliverAppBar(pinned:true)"),
            ),
            SliverList(delegate: SliverChildListDelegate(
              List.generate(100, (_)=>Text("All work and no play makes Jack a dull boy.")),
            ),)
          ],
        ),
    );
  }
}
