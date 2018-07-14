import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class FadeInImagePlaceholder extends StatelessWidget {
  final _imageUrl = 'https://images.unsplash.com/photo-1473172707857-'
      'f9e276582ab6?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9'
      '&s=8e3859b288bd5a263d942340a1774647&auto=format'
      '&fit=crop&w=1050&q=80';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FadeInImage example'),
      ),
      body: Container(
        color: Colors.green,
        child: ListView(
          children: [
            Image.network(
              _imageUrl,
              height: 250.0,
              fit: BoxFit.cover,
            ),
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: _imageUrl,
              height: 250.0,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            FadeInImage.assetNetwork(
              placeholder: 'assets/images/placeholder.png',
              image: _imageUrl,
              height: 250.0,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
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
}
