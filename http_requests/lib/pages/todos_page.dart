import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http_requests/model/todo.dart';
import 'package:http_requests/network/jsonplaceholder_api.dart';
import 'package:http_requests/utils/error_utils.dart';

//https://stackoverflow.com/questions/51224420
// /flutter-switching-to-tab-reloads-widgets-and-runs-futurebuilder

class TodosPage extends StatefulWidget {
  @override
  _TodosPageState createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage>
    with AutomaticKeepAliveClientMixin<TodosPage> {
  Future<List<Todo>> _futureTodos;

  @override
  void initState() {
    super.initState();
    _futureTodos = JsonPlaceholderApi().getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Todo>>(
        future: _futureTodos,
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

  _getListView(List<Todo> data) {
    if (data.isNotEmpty) {
      return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            if (index.isOdd) return Divider();

            //If both operands are ints then a ~/ b
            //performs the truncating integer division.
            int todoIndex = index ~/ 2;

            return _getRow(data[todoIndex]);
          });
    } else {
      return Center(child: Text('No data found.'));
    }
  }

  _getRow(Todo todo) {
    return ListTile(
      title: Text(todo.title),
      trailing: Checkbox(value: todo.completed, onChanged: null),
    );
  }

  _onRetryPressed() {
    setState(() {
      _futureTodos = JsonPlaceholderApi().getTodos();
    });
  }

  @override
  bool get wantKeepAlive => true;
}
