import 'package:flutter/material.dart';

import 'dart:math';

class TransformExamples extends StatefulWidget {
  @override
  TransformExamplesState createState() {
    return TransformExamplesState();
  }
}

class TransformExamplesState extends State<TransformExamples>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _rotateAnimation, _scaleAnimation, _translateAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2500));
    _rotateAnimation =
        Tween<double>(begin: 0, end: 2 * pi).animate(_animationController);
    _scaleAnimation =
        Tween<double>(begin: 0, end: 1.5).animate(_animationController);
    _translateAnimation =
        Tween<Offset>(begin: Offset.zero, end: Offset(100.0, 0.0))
            .animate(_animationController);
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transform Examples'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _animationController.reset();
              _animationController.forward();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 16.0),
            AnimatedBuilder(
              animation: _animationController,
              child: Box(title: 'Rotate', width: 100, height: 100),
              builder: (_, Widget child) => Transform.rotate(
                    angle: _rotateAnimation.value,
                    child: child,
                  ),
            ),
            const SizedBox(height: 50.0),
            AnimatedBuilder(
              animation: _animationController,
              child: Box(title: 'Scale', width: 100, height: 100),
              builder: (_, Widget child) => Transform.scale(
                    scale: _scaleAnimation.value,
                    child: child,
                  ),
            ),
            const SizedBox(height: 50.0),
            AnimatedBuilder(
              animation: _animationController,
              child: Box(title: 'Translate', width: 100, height: 100),
              builder: (_, Widget child) => Transform.translate(
                    offset: _translateAnimation.value,
                    child: child,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class Box extends StatelessWidget {
  final String title;
  final double width;
  final double height;

  const Box({Key key, this.title, this.width, this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        color: Colors.pinkAccent,
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
