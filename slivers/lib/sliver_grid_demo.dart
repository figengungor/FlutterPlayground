import 'package:flutter/material.dart';

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            title: Text("SliverGrid"),
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
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 2.0),
              delegate: SliverChildListDelegate(
                List.generate(
                    20,
                    (index) => Container(
                        color: Colors.pink,
                        child: Center(child: Text("Item $index")))),
              ),
            ),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                  (_, index) => Container(
                      color: Colors.yellow,
                      child: Center(child: Text("Item $index"))),
                  childCount: 100),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 120.0,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0)),
        ],
      ),
    );
  }
}
