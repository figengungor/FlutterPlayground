import 'package:flutter/material.dart';

//Credit: https://sergiandreplace.com/planets-flutter-from-design-to-app/

class GradientAppBar extends StatelessWidget {
  const GradientAppBar({Key key, this.title}) : super(key: key);
  final String title;
  final double barHeight = 66.0;

  @override
  Widget build(context) {
    //Screen begins behind the status bar,
    //Add statusBarHeight to our app bar height and add top padding
    //as statusBarHeight so we could center our title vertically in our app bar
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      height: barHeight + statusBarHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF3366FF),
            const Color(0xFF00CCFF),
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 36.0,
          ),
        ),
      ),
    );
  }
}
