import 'package:flutter/material.dart';

class ClosingKeyboardPage extends StatefulWidget {
  @override
  _ClosingKeyboardPageState createState() => _ClosingKeyboardPageState();
}

class _ClosingKeyboardPageState extends State<ClosingKeyboardPage> {
  bool _enableClosingKeyboardOnTapOutside = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Closing Keyboard'),
        actions: <Widget>[
          Switch(
              activeColor: Colors.orange,
              value: _enableClosingKeyboardOnTapOutside,
              onChanged: (value) {
                setState(() {
                  _enableClosingKeyboardOnTapOutside = value;
                });
                print(value);
              }),
        ],
      ),
      body: Center(child: _getBody()),
    );
  }

  Widget _getBody() => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return GestureDetector(
            onTap: () {
              _enableClosingKeyboardOnTapOutside
                  ? FocusScope.of(context).requestFocus(FocusNode())
                  : Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Enable Closing Keyboard '
                              'on Tapping Outside of Input Fields'),
                        ),
                      );
            },
            child: SingleChildScrollView(
              child: new ConstrainedBox(
                constraints: new BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(labelText: 'email'),
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'password'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
}
