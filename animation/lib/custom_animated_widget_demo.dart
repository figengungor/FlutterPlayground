import 'package:flutter/material.dart';

class CustomAnimatedWidgetDemo extends StatefulWidget {
  @override
  CustomAnimatedWidgetDemoState createState() {
    return new CustomAnimatedWidgetDemoState();
  }
}

class CustomAnimatedWidgetDemoState extends State<CustomAnimatedWidgetDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom AnimatedWidget Demo'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              //Reset animation value and start animation again.
              _animationController.reset();
              _animationController.forward();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedIcon(animation: _animation),
          AnimatedText(
            animation: _animation,
          ),
        ],
      )),
    );
  }
}

//Use AnimatedWidget helper class (instead of addListener() and setState())
//Use AnimatedWidget to create a widget that performs a reusable animation

class AnimatedIcon extends AnimatedWidget {
  AnimatedIcon({Key key, Animation animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation animation = listenable;
    return Icon(
      Icons.check,
      color: Colors.black,
      size: 30.0 + 100.0 * animation.value,
    );
  }
}

class AnimatedText extends AnimatedWidget {
  AnimatedText({Key key, Animation animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation animation = listenable;
    return Text(
      'Correct',
      style: TextStyle(fontSize: 16.0 + 50.0 * animation.value),
    );
  }
}
