import 'package:flutter/material.dart';

class SliverAppBarFlexibleSpaceDemo extends StatelessWidget {
  //flexibleSpace is stacked under appbar and has the same height with appBar
  //FlexibleSpaceBar: The part of a material design [AppBar] that expands and collapses.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            title: Text("SliverAppBar(flexibleSpace)"),
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
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
          )
        ],
      ),
    );
  }
}
