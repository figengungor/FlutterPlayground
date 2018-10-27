import 'package:flutter/material.dart';

class SliverPrototypeExtentListDemo extends StatelessWidget {
/*
SliverPrototypeExtentList

/// A sliver that places its box children in a linear array and constrains them
/// to have the same extent as a prototype item along the main axis.
///
/// [SliverPrototypeExtentList] arranges its children in a line along
/// the main axis starting at offset zero and without gaps. Each child is
/// constrained to the same extent as the [prototypeItem] along the main axis
/// and the [SliverConstraints.crossAxisExtent] along the cross axis.
///
/// [SliverPrototypeExtentList] is more efficient than [SliverList] because
/// [SliverPrototypeExtentList] does not need to lay out its children to obtain
/// their extent along the main axis. It's a little more flexible than
/// [SliverFixedExtentList] because there's no need to determine the appropriate
/// item extent in pixels.
* */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            title: Text("SliverPrototypeExtentList"),
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/popov.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPrototypeExtentList(
            prototypeItem: Card(
              child: Row(
                  children: [Icon(Icons.person, size: 56.0), Text("Hello")]),
            ),
            delegate: SliverChildListDelegate(
              List.generate(
                  20,
                  (_) => Card(
                      color: Colors.pink,
                      child: Center(
                          child: Text(
                              "All work and no play makes Jack a dull boy.")))),
            ),
          ),
        ],
      ),
    );
  }
}
