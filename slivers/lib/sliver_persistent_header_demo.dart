import 'package:flutter/material.dart';

class SliverPersistentHeaderDemo extends StatelessWidget {
  /*
  SliverPersistentHeader

  /// A sliver whose size varies when the sliver is scrolled to the leading edge
  /// of the viewport.
  ///
  /// This is the layout primitive that [SliverAppBar] uses for its
  /// shrinking/growing effect.
  * */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            title: Text("SliverPersistentHeader"),
          ),
          SliverPersistentHeader(
            delegate: MyCollapsingImage(),
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

class MyCollapsingImage extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Image.asset(
      "assets/popov.jpg",
      fit: BoxFit.cover,
    );
  }

  @override
  double get maxExtent => 200.0;

  @override
  double get minExtent => 0.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
