import 'package:flutter/material.dart';

class Demo6Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo 6')),
      body: _getBody(),
    );
  }

  Widget _getBody() => SizedBox(
        height: 300.0,
        child: Stack(
          children: <Widget>[
            Positioned.fill(child: Placeholder()),
            //Positioned.fill is same as below with these
            //default values
            /*Positioned( bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    top: 0.0, child:Placeholder())*/
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                padding: EdgeInsets.all(8.0),
                color: Colors.red.withOpacity(0.7),
                child: Text(
                  'Hello World Image Bottom Text With Stack',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
