import 'package:flutter/material.dart';

class SliverGridExtentDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            title: Text("SliverGrid.extent"),
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/popov.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid.extent(
              maxCrossAxisExtent: 75.0,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              children: List.generate(
                  20,
                  (index) => Container(
                      color: Colors.pink,
                      child: Center(child: Text("Item $index")))),
            ),
          ),
        ],
      ),
    );
  }
}
