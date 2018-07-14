import 'package:flutter/material.dart';

class ImageAspectRatio extends StatelessWidget {
  static const double _aspectRatio = 1.5;

  @override
  Widget build(BuildContext context) {
    final _imageHeight = MediaQuery.of(context).size.width / _aspectRatio;
    return Scaffold(
      appBar: AppBar(
        title: Text('AspectRatio example'),
      ),
      body: Container(
        color: Colors.green,
        child: Stack(children: [
          AspectRatio(
            child: Image.asset(
              'assets/images/backdrop.jpg',
              fit: BoxFit.cover,
            ),
            aspectRatio: _aspectRatio,
          ),
          _getListView(_imageHeight)
        ]),
      ),
    );
  }

  _getListView(double imageHeight) {
    List<Widget> list = List();
    list.addAll(List.generate(
      50,
      (int index) => Container(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Ingredients $index',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.pink,
          ),
    ));
    list.insert(0, Padding(padding: EdgeInsets.only(top: imageHeight)));

    return ListView(
      children: list,
    );
  }
}
