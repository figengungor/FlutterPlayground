import 'package:flutter/material.dart';

class SliverListSliverChildListDelegate extends StatelessWidget {
/*
SliverChildListDelegate

/// Many slivers lazily construct their box children to avoid creating more
/// children than are visible through the [Viewport]. This delegate provides
/// children using an explicit list, which is convenient but reduces the benefit
/// of building children lazily.
///
/// In general building all the widgets in advance is not efficient. It is
/// better to create a delegate that builds them on demand using
/// [SliverChildBuilderDelegate] or by subclassing [SliverChildDelegate]
/// directly.
///
/// This class is provided for the cases where either the list of children is
/// known well in advance (ideally the children are themselves compile-time
/// constants, for example), and therefore will not be built each time the
/// delegate itself is created, or the list is small, such that it's likely
/// always visible (and thus there is nothing to be gained by building it on
/// demand). For example, the body of a dialog box might fit both of these
/// conditions.
* */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            title: Text("SliverChildListDelegate"),
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
              List.generate(20,
                  (_) => Text("All work and no play makes Jack a dull boy.")),
            ),
          ),
        ],
      ),
    );
  }
}
