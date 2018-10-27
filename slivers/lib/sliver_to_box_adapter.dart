import 'package:flutter/material.dart';

class SliverToBoxAdapterDemo extends StatelessWidget {
  /*
  SliverToBoxAdapter
  /// A sliver that contains a single box widget.
  ///
  /// Slivers are special-purpose widgets that can be combined using a
  /// [CustomScrollView] to create custom scroll effects. A [SliverToBoxAdapter]
  /// is a basic sliver that creates a bridge back to one of the usual box-based
  /// widgets.
  * */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            title: Text("SliverToBoxAdapter"),
          ),
          SliverToBoxAdapter(
            child: Card(
              color: Colors.pink,
              child: Container(
                height: 300.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
