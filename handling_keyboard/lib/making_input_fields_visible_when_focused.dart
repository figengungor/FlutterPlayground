import 'package:flutter/material.dart';
import 'package:handling_keyboard/ensure_visible_when_focused_widget.dart';

class MakingInputFieldsVisibleWhenFocusedPage extends StatefulWidget {
  @override
  _MakingInputFieldsVisibleWhenFocusedPageState createState() =>
      _MakingInputFieldsVisibleWhenFocusedPageState();
}

class _MakingInputFieldsVisibleWhenFocusedPageState
    extends State<MakingInputFieldsVisibleWhenFocusedPage> {
  FocusNode emailFocus = FocusNode();
  FocusNode nameFocus = FocusNode();
  FocusNode surnameFocus = FocusNode();
  FocusNode ageFocus = FocusNode();
  FocusNode occupationFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode confirmPasswordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Field Visibility Solution'),
      ),
      body: Center(child: _getBody()),
    );
  }

  //the solution is by using Collin Jackson's EnsureVisibleWhenFocused widget
  // Wrap all your TextFields with this and
  // create a separate FocusNode for each TextField
  // also use the same FocusNode for EnsureVisibleWhenFocused and TextField
  Widget _getBody() => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                EnsureVisibleWhenFocused(
                  focusNode: emailFocus,
                  child: TextFormField(
                    focusNode: emailFocus,
                    decoration: InputDecoration(labelText: 'email'),
                  ),
                ),
                EnsureVisibleWhenFocused(
                  focusNode: nameFocus,
                  child: TextFormField(
                    focusNode: nameFocus,
                    decoration: InputDecoration(labelText: 'name'),
                  ),
                ),
                EnsureVisibleWhenFocused(
                  focusNode: surnameFocus,
                  child: TextFormField(
                    focusNode: surnameFocus,
                    decoration: InputDecoration(labelText: 'surname'),
                  ),
                ),
                EnsureVisibleWhenFocused(
                  focusNode: ageFocus,
                  child: TextFormField(
                    focusNode: ageFocus,
                    decoration: InputDecoration(labelText: 'age'),
                  ),
                ),
                EnsureVisibleWhenFocused(
                  focusNode: occupationFocus,
                  child: TextFormField(
                    focusNode: occupationFocus,
                    decoration: InputDecoration(labelText: 'occupation'),
                  ),
                ),
                EnsureVisibleWhenFocused(
                  focusNode: passwordFocus,
                  child: TextFormField(
                    focusNode: passwordFocus,
                    decoration: InputDecoration(labelText: 'password'),
                  ),
                ),
                EnsureVisibleWhenFocused(
                  focusNode: confirmPasswordFocus,
                  child: TextFormField(
                    focusNode: confirmPasswordFocus,
                    decoration: InputDecoration(labelText: 'confirmPassword'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
