import 'package:flutter/material.dart';

class ImageAssetBackground2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //not to include statusBar
      child: DecoratedBox(
        //to use image as background image
        decoration: BoxDecoration(
          color: Colors.green,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/background.jpg'),
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: Text(
              'SafeArea'
                  '\nDecoratedBox'
                  '\nfit:BoxFit.cover',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
