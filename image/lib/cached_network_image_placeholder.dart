import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedNetworkImagePlaceholder extends StatelessWidget {
  final _imageUrl = 'https://images.unsplash.com/photo-1473172707857-'
      'f9e276582ab6?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9'
      '&s=8e3859b288bd5a263d942340a1774647&auto=format'
      '&fit=crop&w=1050&q=80';

  final _imageHeight = 250.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CachedNetworkImage example'),
        backgroundColor: Colors.green,
      ),
      body: Column(children: [
        CachedNetworkImage(
          placeholder: Container(
              color: Colors.grey,
              height: _imageHeight,
              width: MediaQuery.of(context).size.width,
              child: Center(child: CircularProgressIndicator())),
          imageUrl: _imageUrl,
          height: _imageHeight,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
      ]),
    );
  }
}
