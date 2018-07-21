import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http_requests/model/comment.dart';
import 'package:http_requests/network/jsonplaceholder_api.dart';
import 'package:http_requests/utils/error_utils.dart';

//https://stackoverflow.com/questions/51224420
// /flutter-switching-to-tab-reloads-widgets-and-runs-futurebuilder

class CommentsPage extends StatefulWidget {
  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage>
    with AutomaticKeepAliveClientMixin<CommentsPage> {
  Future<List<Comment>> _futureComments;

  @override
  void initState() {
    super.initState();
    _futureComments = JsonPlaceholderApi().getComments();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Comment>>(
        future: _futureComments,
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

  _getListView(List<Comment> data) {
    if (data.isNotEmpty) {
      return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            if (index.isOdd) return Divider();

            //If both operands are ints then a ~/ b
            //performs the truncating integer division.
            int commentIndex = index ~/ 2;

            return _getRow(data[commentIndex]);
          });
    } else {
      return Center(child: Text('No data found.'));
    }
  }

  _getRow(Comment comment) {
    return ListTile(
      title: Text(comment.email),
      subtitle: Text(
        comment.body,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  _onRetryPressed() {
    setState(() {
      _futureComments = JsonPlaceholderApi().getComments();
    });
  }

  @override
  bool get wantKeepAlive => true;
}
