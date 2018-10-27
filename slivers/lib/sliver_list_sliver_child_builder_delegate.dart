import 'package:flutter/material.dart';

class SliverListSliverChildBuilderDelegate extends StatelessWidget {
/*
SliverChildBuilderDelegate

/// A delegate that supplies children for slivers using a builder callback.
///
/// Many slivers lazily construct their box children to avoid creating more
/// children than are visible through the [Viewport]. This delegate provides
/// children using an [IndexedWidgetBuilder] callback, so that the children do
/// not even have to be built until they are displayed.
* */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            title: Text("SliverChildBuilderDelegate"),
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/popov.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, index) => Text("All work and no play makes Jack a dull boy."),
              childCount: 100,
            ),
          ),
        ],
      ),
    );
  }
}
