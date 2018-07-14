import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.transparent,
        child: Container(
          color: Colors.green,
          child: Center(
            child: Stack(
              children: [
                Image.network('https://images.unsplash.com/photo-1477936432016-'
                    '8172ed08637e?ixlib=rb-0.3.5&s=b8d21a7fc0c49635b7641343e7ce3ba3'
                    '&auto=format&fit=crop&w=334&q=80'),
                Positioned(
                  left: 8.0,
                  bottom: 8.0,
                  child: Text(
                    'Photo by freddie marriage on Unsplash',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
