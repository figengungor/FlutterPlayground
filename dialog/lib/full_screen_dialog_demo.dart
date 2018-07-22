import 'package:flutter/material.dart';

//https://marcinszalek.pl/flutter/
// flutter-fullscreendialog-tutorial-weighttracker-ii/

class FullScreenDialogDemo extends StatefulWidget {
  @override
  FullScreenDialogDemoState createState() {
    return new FullScreenDialogDemoState();
  }
}

class FullScreenDialogDemoState extends State<FullScreenDialogDemo> {
  var _todo = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Full Screen Dialog'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Full Screen Dialog(Todo Entry)'),
              onPressed: () {
                _openAddTodoDialog(context);
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            Text('Todo: $_todo')
          ],
        ),
      ),
    );
  }

  _openAddTodoDialog(BuildContext context) async {
    var todo = await Navigator.push(
      context,
      MaterialPageRoute<String>(
        builder: (context) => AddTodoDialog(),
        fullscreenDialog: true,
      ),
    );
    if (todo != null) {
      setState(() {
        _todo = todo;
      });
    }
  }
}

class AddTodoDialog extends StatefulWidget {
  @override
  AddTodoDialogState createState() {
    return new AddTodoDialogState();
  }
}

class AddTodoDialogState extends State<AddTodoDialog> {
  TextEditingController _todoController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _todoController = new TextEditingController();
  }

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Todo'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Save',
              style: Theme
                  .of(context)
                  .textTheme
                  .subhead
                  .copyWith(color: Colors.white),
            ),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                Navigator.pop(context, _todoController.text);
              }
            },
          ),
        ],
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _todoController,
              decoration: InputDecoration(hintText: 'Enter your todo'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
