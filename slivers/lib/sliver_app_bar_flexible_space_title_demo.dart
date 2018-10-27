import 'package:flutter/material.dart';

//https://github.com/flutter/flutter/pull/20339

class SliverAppBarFlexibleSpaceTitleDemo extends StatelessWidget {
  //!!!!BUGGY!!!!!
  //FlexibleSpaceBar: The part of a material design [AppBar] that expands and collapses.
  //If title is set inside FlexibleSpaceBar,
  //then it will be animated while collapsing and expanding
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("SliverAppBar(flexibleSpace:title)"),
              background: Image.asset(
                "assets/popov.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              List.generate(100,
                  (_) => Text("All work and no play makes Jack a dull boy.")),
            ),
          ),
        ],
      ),
    );
  }
}
