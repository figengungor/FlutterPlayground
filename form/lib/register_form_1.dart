import 'package:flutter/material.dart';

class RegisterForm1 extends StatefulWidget {
  @override
  RegisterForm1State createState() {
    return new RegisterForm1State();
  }
}

class RegisterForm1State extends State<RegisterForm1> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String _fullName, _emailAddress, _phone, _password, _address;
  Gender _gender;

  final List<DropdownMenuItem<Gender>> _genderDropdownItems = [
    Gender('Other', '0'),
    Gender('Female', '1'),
    Gender('Male', '2'),
  ]
      .map((Gender gender) =>
          DropdownMenuItem<Gender>(value: gender, child: Text(gender.name)))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Register Form 1'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(hintText: 'Full name'),
                  validator: (value) =>
                      value.isEmpty ? 'Please enter full name' : null,
                  onSaved: (value) => _fullName = value,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(hintText: 'Email'),
                  validator: (value) =>
                      value.isEmpty ? 'Please enter email' : null,
                  onSaved: (value) => _emailAddress = value,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  decoration: InputDecoration(hintText: 'Phone'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter phone';
                    }
                    if (value.length != 10) {
                      return 'Please enter 10 digits';
                    }
                  },
                  onSaved: (value) => _phone = value,
                ),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'Password'),
                  validator: (value) =>
                      value.isEmpty ? 'Please enter password' : null,
                  onSaved: (value) => _password = value,
                ),
                TextFormField(
                  maxLines: 6,
                  decoration: InputDecoration(hintText: 'Address'),
                  validator: (value) =>
                      value.isEmpty ? 'Please enter address' : null,
                  onSaved: (value) => _address = value,
                ),
                DropdownButtonFormField<Gender>(
                  hint: Text('Gender'),
                  value: _gender,
                  items: _genderDropdownItems,
                  validator: (Gender gender) {
                    return gender == null ? 'Please choose gender' : null;
                  },
                  onChanged: (Gender gender) {
                    print(gender.name);
                    setState(() {
                      _gender = gender;
                    });
                  },
                  onSaved: (Gender gender) {
                    _gender = gender;
                  },
                ),
                RaisedButton(
                  child: Text('Submit'),
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  onPressed: () {
                    _validateForm();
                  },
                )
              ]
                  .map((item) => Padding(
                        padding: EdgeInsets.all(8.0),
                        child: item,
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  void _validateForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
          'Good to go, $_fullName =)',
        ),
      ));
    }
  }
}

class Gender {
  final String name;
  final String value;

  const Gender(this.name, this.value);
}
