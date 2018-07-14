import 'package:flutter/material.dart';

class ImageAssetBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
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
            'DecoratedBox'
                '\nfit:BoxFit.cover',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26.0,
            ),
          ),
        ),
      ),
    );
  }
}
