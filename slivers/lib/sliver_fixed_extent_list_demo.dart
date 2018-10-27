import 'package:flutter/material.dart';

class SliverFixedExtentListDemo extends StatelessWidget {
/*
SliverFixedExtentList

/// A sliver that places multiple box children with the same main axis extent in
/// a linear array.
///
/// [SliverFixedExtentList] places its children in a linear array along the main
/// axis starting at offset zero and without gaps. Each child is forced to have
/// the [itemExtent] in the main axis and the
/// [SliverConstraints.crossAxisExtent] in the cross axis.
///
/// [SliverFixedExtentList] is more efficient than [SliverList] because
/// [SliverFixedExtentList] does not need to perform layout on its children to
/// obtain their extent in the main axis.
* */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            title: Text("SliverFixedExtentList"),
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/popov.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 100.0,
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
