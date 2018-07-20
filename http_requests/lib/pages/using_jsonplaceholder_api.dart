import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http_requests/network/jsonplaceholder_api.dart';
import 'package:http_requests/model/post.dart';

class UsingJsonPlaceholderApi extends StatefulWidget {
  @override
  UsingJsonPlaceholderApiState createState() {
    return new UsingJsonPlaceholderApiState();
  }
}

class UsingJsonPlaceholderApiState extends State<UsingJsonPlaceholderApi> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Using JsonPlaceholder Api')),
      body: _getBody(),
    );
  }

  _getBody() {
    return Center(
      child: FutureBuilder<List<Post>>(
        future: JsonPlaceholderApi().getPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return getListView(snapshot.data);
          } else if (snapshot.hasError) {
            return getErrorMessage(snapshot.error);
          }
          // By default, show a loading spinner
          return CircularProgressIndicator();
        },
      ),
    );
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

  getListView(List<Post> data) {
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

  getErrorMessage(Object error) {
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
