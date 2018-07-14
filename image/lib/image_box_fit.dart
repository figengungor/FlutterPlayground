import 'package:flutter/material.dart';

class ImageBoxFit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BoxFit examples'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.green,
        child: ListView(
          children: <Widget>[
            _getCredits(),
            _getContain(context),
            _getCover(context),
            _getFill(context),
            _getFitWidth(context),
            _getFitWidth2(context),
            _getFitHeight(context),
            _getFitHeight2(context),
          ]
              .map((item) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: item,
                  ))
              .toList(),
        ),
      ),
    );
  }

  _getContain(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/dog.jpg',
          fit: BoxFit.contain,
          height: 200.0,
          width: MediaQuery.of(context).size.width,
        ),
        Center(
          child: Text(
            'BoxFit.contain',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  _getCover(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/dog.jpg',
          fit: BoxFit.cover,
          height: 200.0,
          width: MediaQuery.of(context).size.width,
        ),
        Center(
          child: Text(
            'BoxFit.cover',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  _getFill(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/dog.jpg',
          fit: BoxFit.fill,
          height: 200.0,
          width: MediaQuery.of(context).size.width,
        ),
        Center(
          child: Text(
            'BoxFit.fill',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  _getFitWidth(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/dog.jpg',
          fit: BoxFit.fitWidth,
          height: 200.0,
          width: MediaQuery.of(context).size.width,
        ),
        Center(
          child: Text(
            'BoxFit.fitWidth',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  _getFitWidth2(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset(
            'assets/images/dog.jpg',
            fit: BoxFit.fitWidth,
            height: 200.0,
            width: 100.0,
          ),
        ),
        Center(
          child: Text(
            'BoxFit.fitWidth',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  _getFitHeight(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/dog.jpg',
          fit: BoxFit.fitHeight,
          height: 200.0,
          width: MediaQuery.of(context).size.width,
        ),
        Center(
          child: Text(
            'BoxFit.fitHeight',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  _getFitHeight2(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset(
            'assets/images/dog.jpg',
            fit: BoxFit.fitHeight,
            height: 900.0,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Center(
          child: Text(
            'BoxFit.fitHeight',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  _getCredits() {
    return Center(
      child: Text('Photo by freddie marriage on Unsplash',
          style: TextStyle(
            color: Colors.white,
          )),
    );
  }
}
