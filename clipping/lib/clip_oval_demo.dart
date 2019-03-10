import 'package:flutter/material.dart';

class ClipOvalDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ClipOval')),
      body: ListView(
        children: <Widget>[
          Image.asset(
            'assets/office_man.jpg',
            fit: BoxFit.cover,
          ),
          ClipOval(
            child: Image.asset(
              'assets/office_man.jpg',
              fit: BoxFit.cover,
            ),
          ),
          ClipOval(
            child: Align(
              alignment: Alignment.topCenter,
              heightFactor: 0.5,
              child: Image.asset(
                'assets/office_man.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          ClipOval(
            clipper: ClipHalfVerticalOval(),
            child: Image.asset(
              'assets/office_man.jpg',
              fit: BoxFit.cover,
            ),
          ),
          ClipOval(
            clipper: ClipCenterOval(),
            child: Image.asset(
              'assets/office_man.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class ClipHalfVerticalOval extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0.0, 0.0, size.width / 2, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

class ClipCenterOval extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(size.width / 4, 0.0, size.width * 3 / 4, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
