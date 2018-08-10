import 'package:flutter/material.dart';

class MakingInputFieldsVisibleWhenFocusedIssuePage extends StatefulWidget {
  @override
  _MakingInputFieldsVisibleWhenFocusedIssuePageState createState() =>
      _MakingInputFieldsVisibleWhenFocusedIssuePageState();
}

class _MakingInputFieldsVisibleWhenFocusedIssuePageState
    extends State<MakingInputFieldsVisibleWhenFocusedIssuePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Field Visibility Issue'),
      ),
      body: Center(child: _getBody()),
    );
  }

  //First close the keyboard and then choose one of the input fields
  //in the bottom
  //and you'll see that keyboard covers it and you manually need to scroll down
  //even though you tapped on it
  //so look the same file without the issue suffix to see solution
  //to this problem;)
  Widget _getBody() => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Just Close Keyboard and choose one input '
                    'field from the bottom to see the issue '
                    'The keyboard covers the selected input field '
                    'even though it has focus. '
                    'You have to manually scroll down to see it.'),
                TextFormField(
                  decoration: InputDecoration(labelText: 'email'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'name'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'surname'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'age'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'occupation'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'password'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'confirm password'),
                )
              ],
            ),
          ),
        ),
      );
}
