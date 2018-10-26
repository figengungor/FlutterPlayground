import 'package:flutter/material.dart';

class SliverAppBarSnapDemo extends StatelessWidget {
//snap:true is used along with floating:true,
//the appbar will be immediately visible when scrolling down started.
//Without this you need to scroll until you see it fully visible.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              title: Text("SliverAppBar(snap:true)"),
            ),
            SliverList(delegate: SliverChildListDelegate(
              List.generate(100, (_)=>Text("All work and no play makes Jack a dull boy.")),
            ),)
          ],
        ),
    );
  }
}
