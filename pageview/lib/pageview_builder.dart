import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class PageViewBuilder extends StatefulWidget {
  @override
  _PageViewBuilderState createState() => _PageViewBuilderState();
}

class _PageViewBuilderState extends State<PageViewBuilder>
    with SingleTickerProviderStateMixin {
  Future<List<dynamic>> _fetchPicsumListFuture;

  @override
  void initState() {
    _fetchPicsumListFuture = _fetchPicsumList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PageView Builder')),
      body: _buildBody(),
    );
  }

  //Using builder constructor

  /*
 This constructor is appropriate for page views with a large (or infinite)
 number of children because the builder is called only for those children that
 are actually visible.
  */

  _buildBody() {
    return FutureBuilder<List<dynamic>>(
        future: _fetchPicsumListFuture,
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            return _buildPageView(snapshot.data);
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Center(child: Text('Loading...'));
          }
        });
  }

  Future<List<dynamic>> _fetchPicsumList() async {
    try {
      final response = await http.get("https://picsum.photos/list");
      print(response.body);
      final list = json.decode(response.body);
      return list;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Widget _buildPageView(List data) {
    final screenSize = MediaQuery.of(context).size;
    return PageView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        final imageId = data[index]['id'];
        final aspectRatio = data[index]['height'] / data[index]['width'];
        return Image.network(
          "https://picsum.photos/${screenSize.width}/${screenSize
              .width * aspectRatio}?image=$imageId",
          width: screenSize.width,
        );
      },
    );
  }
}
