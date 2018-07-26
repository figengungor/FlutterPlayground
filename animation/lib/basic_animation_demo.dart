import 'package:flutter/material.dart';

class BasicAnimationDemo extends StatefulWidget {
  @override
  _BasicAnimationDemoState createState() => _BasicAnimationDemoState();
}

class _BasicAnimationDemoState extends State<BasicAnimationDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );

    //https://flutter.github.io/assets-for-api-docs/assets/animation/curve_ease_in.png
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);

    //every time animation value changes, this callback that we pass to
    //addListener is triggered.

    //so we tell our widget to build itself again to get the updated
    //animation value to change our UI. See below how we use this value
    //to change icon size.

    _animation.addListener(() {
      setState(() {
        print('${_animation.value}');
      }); // this rebuilds widget
    });

    //Starts animation
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
        title: Text('Basic Animation Demo'),
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
      body: _getBody(),
    );
  }

  _getBody() {
    return Center(
      child: Icon(
        Icons.check,
        color: Colors.black,
        //Change size with Curves.easeIn animation
        //Value goes from 0.0 to 1.0 but it goes with easeIn
        //Which starts slowly and finishes quickly in 2 seconds.
        size: 30.0 + 100.0 * _animation.value,
      ),
    );
  }
}
