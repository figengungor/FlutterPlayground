import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:http_requests/model/post.dart';

class FutureBuilderDemo extends StatefulWidget {
  @override
  FutureBuilderDemoState createState() {
    return new FutureBuilderDemoState();
  }
}

class FutureBuilderDemoState extends State<FutureBuilderDemo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureBuilder Demo'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return Center(
      child: FutureBuilder<List<Post>>(
        future: _getJsonPlaceholderPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _getListView(snapshot.data);
          } else if (snapshot.hasError) {
            return _getErrorMessage(snapshot.error);
          }
          // By default, show a loading spinner
          return CircularProgressIndicator();
        },
      ),
    );
  }

  Future<List<Post>> _getJsonPlaceholderPosts() async {
    final url = 'https://jsonplaceholder.typicode.com/posts/';
    var httpResponse = await http.get(url);
    if (httpResponse.statusCode == HttpStatus.OK) {
      var jsonResponse = json.decode(httpResponse.body);
      var posts = jsonResponse
          .map<Post>((dynamic item) => Post.fromJson(item))
          .toList();
      return posts;
    } else {
      throw Exception(
          'Failed to load posts. \nStatus code:${httpResponse.statusCode}');
    }
  }

  _getPostRow(Post post) {
    return ListTile(
      title: Text(post.title),
      subtitle: Text(
        post.body,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  _getListView(List<Post> data) {
    if (data.isNotEmpty) {
      return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            if (index.isOdd) return Divider();

            //If both operands are ints then a ~/ b
            //performs the truncating integer division.
            int postIndex = index ~/ 2;

            return _getPostRow(data[postIndex]);
          });
    } else {
      return Center(child: Text('No data found.'));
    }
  }

  _getErrorMessage(Object error) {
    var errorMessage;
    if (error is TimeoutException) {
      errorMessage = 'Time out';
    } else if (error is IOException) {
      errorMessage = 'No Internet Connection';
    } else {
      errorMessage = error.toString();
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "$errorMessage",
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 16.0,
        ),
        RaisedButton(
          onPressed: () {
            setState(() {});
          },
          child: Text('Retry'),
        ),
      ],
    );
  }
}


