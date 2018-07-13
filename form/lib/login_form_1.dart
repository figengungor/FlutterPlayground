import 'package:flutter/material.dart';

class LoginForm1 extends StatefulWidget {
  @override
  LoginForm1State createState() {
    return new LoginForm1State();
  }
}

class LoginForm1State extends State<LoginForm1> {
  final _formKey = GlobalKey<FormState>();
  var _userName, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Form 1'),
      ),
      body: Builder(
        // to create a child context of Scaffold to use SnackBar
        builder: (context) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(hintText: 'Username'),
                          validator: (value) => value.isEmpty
                              ? 'Username cannot be empty!'
                              : null,
                          onSaved: (value) => _userName = value,
                        ),
                        TextFormField(
                          decoration: InputDecoration(hintText: 'Password'),
                          validator: (value) => value.isEmpty
                              ? 'Password cannot be empty!'
                              : null,
                          onSaved: (value) => _password = value,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        RaisedButton(
                          child: Text('Submit'),
                          color: Colors.green,
                          textColor: Colors.white,
                          onPressed: () {
                            _login(context);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
      ),
    );
  }

  _login(BuildContext context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final snackBar = SnackBar(
        content: Text(
          'Login Success! Username: $_userName, Password: $_password',
          style: TextStyle(color: Colors.pink),
        ),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }
}
