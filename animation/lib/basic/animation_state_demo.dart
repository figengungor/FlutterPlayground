import 'package:flutter/material.dart';

class AnimationStateDemo extends StatefulWidget {
  @override
  _AnimationStateDemoState createState() => _AnimationStateDemoState();
}

class _AnimationStateDemoState extends State<AnimationStateDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  AnimationStatus _animationState;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);

    _animation.addListener(() {
      setState(() {}); // this rebuilds widget
    });

    _animation.addStatusListener((state) {
      print("$state");
      setState(() {
        _animationState = state;
      });

      // Forward =>  Completed => Reverse => Dismissed => Forward ...

      if (state == AnimationStatus.completed) {
        _animationController.reverse();
      }

      if (state == AnimationStatus.dismissed) {
        _animationController.forward();
      }
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
        title: Text('Animation State Demo'),
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
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 16.0),
          alignment: Alignment.topCenter,
          child: Text(
            _animationState != null ? "$_animationState" : 'Animation State',
            style: TextStyle(fontSize: 26.0),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Icon(
            Icons.favorite,
            color: Colors.red,
            size: 30.0 + 100.0 * _animation.value,
          ),
        ),
      ],
    );
  }
}
