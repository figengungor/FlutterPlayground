import 'package:flutter/material.dart';

class SliverListGridBgDemo extends StatelessWidget {
  final double spacing = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Sliver List Grid Bg Demo'),
          ),
          //Grid with bg
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: EdgeInsets.only(
                right: spacing,
                left: spacing,
                //top: spacing,
              ),
              color: Colors.green,
              child: GridView.count(
                  padding: EdgeInsets.symmetric(vertical: spacing),
                  shrinkWrap: true,
                  physics: new NeverScrollableScrollPhysics(),
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: spacing,
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  children: List.generate(
                      10,
                      (i) => Container(
                            color: Colors.red,
                            child: Center(child: Text('Text $i')),
                          ))),
            ),
          ),
          //List with bg
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: EdgeInsets.only(
                right: spacing,
                left: spacing,
                //top: spacing,
              ),
              color: Colors.green,
              child: ListView(
                  padding: EdgeInsets.symmetric(vertical: spacing),
                  shrinkWrap: true,
                  physics: new NeverScrollableScrollPhysics(),
                  children: List.generate(
                      10,
                      (i) => Container(
                            color: Colors.red,
                            child: Center(child: Text('Text $i')),
                          ))),
            ),
          ),
          //Horizontal List with bg
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: EdgeInsets.all(spacing),
              height: 100,
              color: Colors.green,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                //physics: new NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) => Container(
                      color: Colors.red,
                      width: 100,
                      height: 100,
                      child: Center(child: Text('Text $index')),
                    ),
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(width: spacing),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
