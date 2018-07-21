import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http_requests/model/post.dart';
import 'package:http_requests/network/jsonplaceholder_api.dart';
import 'package:http_requests/utils/error_utils.dart';

//https://stackoverflow.com/questions/51224420
// /flutter-switching-to-tab-reloads-widgets-and-runs-futurebuilder

class PostsPage extends StatefulWidget {
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage>
    with AutomaticKeepAliveClientMixin<PostsPage> {
  Future<List<Post>> _futurePosts;

  @override
  void initState() {
    super.initState();
    _futurePosts = JsonPlaceholderApi().getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Post>>(
        future: _futurePosts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _getListView(snapshot.data);
          } else if (snapshot.hasError) {
            return getErrorMessage(snapshot.error, _onRetryPressed);
          }
          // By default, show a loading spinner
          return CircularProgressIndicator();
        },
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

  _onRetryPressed() {
    setState(() {
      _futurePosts = JsonPlaceholderApi().getPosts();
    });
  }

  @override
  bool get wantKeepAlive => true;
}
