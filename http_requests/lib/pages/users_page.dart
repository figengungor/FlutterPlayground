import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http_requests/model/user.dart';
import 'package:http_requests/network/jsonplaceholder_api.dart';
import 'package:http_requests/utils/error_utils.dart';

//https://stackoverflow.com/questions/51224420
// /flutter-switching-to-tab-reloads-widgets-and-runs-futurebuilder

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage>
    with AutomaticKeepAliveClientMixin<UsersPage> {
  Future<List<User>> _futureUsers;

  @override
  void initState() {
    super.initState();
    _futureUsers = JsonPlaceholderApi().getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<User>>(
        future: _futureUsers,
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

  _getListView(List<User> data) {
    if (data.isNotEmpty) {
      return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            if (index.isOdd) return Divider();

            //If both operands are ints then a ~/ b
            //performs the truncating integer division.
            int userIndex = index ~/ 2;

            return _getRow(data[userIndex]);
          });
    } else {
      return Center(child: Text('No data found.'));
    }
  }

  _getRow(User user) {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text('${user.name}'),
    );
  }

  _onRetryPressed() {
    setState(() {
      _futureUsers = JsonPlaceholderApi().getUsers();
    });
  }

  @override
  bool get wantKeepAlive => true;
}
