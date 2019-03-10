import 'package:flutter/material.dart';

class ClipRectDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ClipRect')),
      body: ListView(
        children: <Widget>[
          Image.asset(
            'assets/office_man.jpg',
            fit: BoxFit.cover,
          ),
          CutHalfHorizontal(),
          CutHalfVertical(),
          CutHalfVerticalWithCustomClipper(),
        ],
      ),
    );
  }
}

class CutHalfHorizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipRect(
          child: Align(
            alignment: Alignment.topCenter,
            heightFactor: 0.5,
            child: Image.asset(
              'assets/office_man.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 16.0),
        ClipRect(
          child: Align(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.5,
            child: Image.asset(
              'assets/office_man.jpg',
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}

class CutHalfVertical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double imageWidth = MediaQuery.of(context).size.shortestSide;

    return Row(
      children: <Widget>[
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: ClipRect(
              child: Align(
                alignment: Alignment.topLeft,
                widthFactor: 0.5,
                child: Image.asset(
                  'assets/office_man.jpg',
                  fit: BoxFit.cover,
                  width: imageWidth,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 16.0),
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: ClipRect(
              child: Align(
                alignment: Alignment.topRight,
                widthFactor: 0.5,
                child: Image.asset(
                  'assets/office_man.jpg',
                  fit: BoxFit.cover,
                  width: imageWidth,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class CutHalfVerticalWithCustomClipper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double imageWidth = MediaQuery.of(context).size.shortestSide / 2 - 8.0;

    return Row(
      children: <Widget>[
        ClipRect(
          clipper: CutHalfClipper(),
          child: Image.asset(
            'assets/office_man.jpg',
            fit: BoxFit.cover,
            width: imageWidth,
          ),
        ),
        SizedBox(width: 16.0),
        ClipRect(
          clipper: CutHalfClipper(),
          child: Image.asset(
            'assets/office_man.jpg',
            fit: BoxFit.cover,
            width: imageWidth,
          ),
        )
      ],
    );
  }
}

class CutHalfClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width / 2, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
