import 'package:flutter/material.dart';

//https://github.com/flutter/flutter/issues/17444

class SliverFillRemainingDemo extends StatelessWidget {
  //!!!!!!!BUGGY!!!!!!!!
  //It doesn't fill remaining space but it adds viewport height
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
              List.generate(5,
                      (_) => Text("All work and no play makes Jack a dull boy.")),
            ),
          ),
          SliverFillRemaining(child: Container(color: Colors.orange,),),
        ],
      ),
    );
  }
}
