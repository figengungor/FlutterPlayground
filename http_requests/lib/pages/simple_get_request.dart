import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SimpleGetRequest extends StatefulWidget {
  @override
  SimpleGetRequestState createState() {
    return new SimpleGetRequestState();
  }
}

class SimpleGetRequestState extends State<SimpleGetRequest> {
  var _posts = List<Post>();

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Get Request'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          if (index.isOdd) return Divider();

          //If both operands are ints then a ~/ b
          //performs the truncating integer division.
          int postIndex = index ~/ 2;

          return _getPostRow(_posts[postIndex]);
        });
  }

  Future<void> _fetchPosts() async {
    var posts = await _getJsonPlaceholderPosts();
    if (posts != null) {
      setState(() {
        _posts = posts;
      });
    }
  }

  Future<List<Post>> _getJsonPlaceholderPosts() async {
    final url = 'https://jsonplaceholder.typicode.com/posts/';
    var httpResponse = await http.get(url);
    if (httpResponse.statusCode == HttpStatus.OK) {
      //jsonResponse is a List<dynamic> type object
      var jsonResponse = json.decode(httpResponse.body);

      //jsonResponse[0] is a Map<String, dynamic> type object
      //which contains post info
      //map dynamic items(maps) to Post object
      var posts = jsonResponse
          .map<Post>((dynamic item) => Post.fromJson(item))
          .toList();
      return posts;
    } else {
      print('Failed to load posts.');
      return null;
    }
  }

  _getPostRow(Post post) {
    return ListTile(
      title: Text(post._title),
      subtitle: Text(
        post._body,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class Post {
  final _userId;
  final _id;
  final _title;
  final _body;

  Post.fromJson(Map<String, dynamic> jsonMap)
      : this._userId = jsonMap['userId'],
        this._id = jsonMap['id'],
        this._title = jsonMap['title'],
        this._body = jsonMap['body'];
}
