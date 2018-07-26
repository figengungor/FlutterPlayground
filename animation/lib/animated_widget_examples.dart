import 'package:flutter/material.dart';

class AnimatedWidgetExamples extends StatefulWidget {
  @override
  AnimatedWidgetExamplesState createState() {
    return new AnimatedWidgetExamplesState();
  }
}

class AnimatedWidgetExamplesState extends State<AnimatedWidgetExamples>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _opacityTween,
      _sizeTween,
      _turnTween,
      _scaleTween,
      _slideTween,
      _positionedTween;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );

    _opacityTween = Tween(begin: 0.3, end: 1.0).animate(_animationController);
    _sizeTween = Tween(begin: 1.0, end: 5.0).animate(_animationController);
    _turnTween = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _scaleTween = Tween(begin: 0.0, end: 3.0).animate(_animationController);
    _slideTween = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(2.0, 0.0),
    ).animate(_animationController);

    _positionedTween = RelativeRectTween(
      begin: new RelativeRect.fromLTRB(
        50.0,
        30.0,
        50.0,
        30.0,
      ),
      end: const RelativeRect.fromLTRB(0.0, 30.0, 0.0, 30.0),
    ).animate(_animationController);

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
        title: Text('Animated Widget Examples'),
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
      body: Container(
        color: Colors.green,
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            _getFadeTransition(),
            _getRotationTransition(),
            _getScaleTransition(),
            _getSlideTransition(),
            _getPositionedTransition(),
            _getSizeTransition(),
          ]
              .map((item) => Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: item,
                  ))
              .toList(),
        ),
      ),
    );
  }

  _getFadeTransition() {
    return Row(
      children: <Widget>[
        Text('FadeTransition'),
        FadeTransition(
          opacity: _opacityTween,
          child: Icon(
            Icons.favorite,
            color: Colors.red,
            size: 60.0,
          ),
        ),
      ],
    );
  }

  _getRotationTransition() {
    return Row(
      children: <Widget>[
        Text('Rotation Transition'),
        Expanded(
          child: RotationTransition(
            turns: _turnTween,
            child: Center(
                child: Container(
              width: 50.0,
              height: 50.0,
              color: Colors.black,
            )),
          ),
        )
      ],
    );
  }

  _getScaleTransition() {
    return Row(
      children: <Widget>[
        Text('Scale Transition'),
        Expanded(
          child: ScaleTransition(
            scale: _scaleTween,
            child: Center(
                child: Container(
              width: 10.0,
              height: 10.0,
              color: Colors.black,
            )),
          ),
        )
      ],
    );
  }

  _getSlideTransition() {
    return Row(
      children: <Widget>[
        Text('Slide Transition'),
        //moves child as child size * offset in the given offset direction
        // dx * child's width, dy * child's height
        SlideTransition(
          position: _slideTween,
          child: Container(
            width: 10.0,
            height: 10.0,
            color: Colors.black,
          ),
        )
      ],
    );
  }

  _getPositionedTransition() {
    return Container(
      color: Colors.yellow,
      height: 200.0,
      child: Stack(
        children: <Widget>[
          Text('Positioned Transition'),
          //Only work in stack
          //RelativeRectTween you define how the child is positioned in Stack
          //with RelativeRect.fromLTRB
          //and apply animation according to these begin and end LTRB values
          PositionedTransition(
            rect: _positionedTween,
            child: Container(
              width: 10.0,
              height: 10.0,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }

  _getSizeTransition() {
    return Container(
      color: Colors.yellow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('SizeTransition'),
          Container(
            color: Colors.purple,
            child: SizeTransition(
              // doesn't change child's size
              // but creates a container which its size is changing
              // according to scaleFactor and centers the child inside it
              sizeFactor: _sizeTween,
              child: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 30.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
