import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

//Credits:
//https://flutter.io/cookbook/forms/text-field-changes/

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Textfield Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _name = '<your name>';
  var _age = '<age>';
  var _amount = '';

  //For age TextField
  final textEditingController = TextEditingController();

  //For amount TextField, to clear text when clear icon is tapped
  final amountTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //Start listening TextField changes for age TextField
    textEditingController.addListener(_updateAge);

    amountTextEditingController.addListener(_updateAmount);
  }

  @override
  void dispose() {
    //Stop listening TextField changes for age TextField
    textEditingController.removeListener(_updateAge);
    //Clean up the controller when the Widget is removed from the Widget tree
    textEditingController.dispose();

    amountTextEditingController.removeListener(_updateAmount);
    //Clean up the controller when the Widget is removed from the Widget tree
    amountTextEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Textfield Playground'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          _getOnChangedDemo(),
          _getOnSubmittedDemo(),
          _getTextEditingControllerDemo(),
          _getFloatingLabelDemo(),
          _getIconsDemo(),
          _getTextPrefixSuffixDemo(),
          _getCustomDemo(),
        ]
            .map((item) => Padding(padding: EdgeInsets.all(8.0), child: item))
            .toList(),
      ),
    );
  }

  _getOnChangedDemo() {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'OnChanged property',
            style: TextStyle(color: Colors.pink),
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Type your name'),
            //Whenever the text changes, this callback will be invoked
            //This only works with TextField
            //See TextEditingController for TextFormField
            onChanged: (value) => setState(() {
                  _name = value;
                }),
          ),
          Text('Hello, $_name'),
        ]
            .map((item) => Padding(padding: EdgeInsets.all(8.0), child: item))
            .toList(),
      ),
    );
  }

  _getOnSubmittedDemo() {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'OnSubmitted property',
            style: TextStyle(color: Colors.pink),
          ),
          Text(
            'After entering your note tap tick button on your keyboard',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Enter your note'),
            //When keyboard's tick button is tapped, onSubmitted event is called
            onSubmitted: (value) => _saveNote(value),
          )
        ]
            .map((item) => Padding(padding: EdgeInsets.all(8.0), child: item))
            .toList(),
      ),
    );
  }

  _getTextEditingControllerDemo() {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Using TextEditingController',
            style: TextStyle(color: Colors.pink),
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Enter your age'),
            keyboardType: TextInputType.number,
            //TextEditingController works with
            //both TextField and TextFormField
            //To be notified when the text changes,
            //we can listen to the controller using its addListener method.
            controller: textEditingController,
          ),
          Text('You are $_age years old.'),
        ]
            .map((item) => Padding(padding: EdgeInsets.all(8.0), child: item))
            .toList(),
      ),
    );
  }

  _getFloatingLabelDemo() {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Floating label',
            style: TextStyle(color: Colors.pink),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Please enter amount',
              labelText: 'Amount',
            ),
            keyboardType: TextInputType.number,
          ),
        ]
            .map((item) => Padding(padding: EdgeInsets.all(8.0), child: item))
            .toList(),
      ),
    );
  }

  _getIconsDemo() {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'icon, prefixIcon, suffixIcon, clear text',
            style: TextStyle(color: Colors.pink),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Please enter amount',
              icon: Icon(Icons.attach_money),
            ),
            keyboardType: TextInputType.number,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Please enter amount',
              icon: Icon(Icons.attach_money),
              labelText: 'Amount',
            ),
            keyboardType: TextInputType.number,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Please enter amount',
              labelText: 'Amount',
              prefixIcon: Icon(Icons.attach_money),
            ),
            keyboardType: TextInputType.number,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Please enter amount',
              labelText: 'Amount',
              suffixIcon: Icon(Icons.attach_money),
            ),
            keyboardType: TextInputType.number,
          ),
          Text(
            'Clear text suffix icon is shown when text is entered',
            style: TextStyle(color: Colors.pink),
          ),
          TextField(
            controller: amountTextEditingController,
            decoration: InputDecoration(
              hintText: 'Please enter amount ',
              labelText: 'Amount',
              prefixIcon: Icon(
                Icons.attach_money,
              ),
              suffixIcon: _amount.length > 0
                  ? IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: _clearTextField,
                    )
                  : null,
            ),
            keyboardType: TextInputType.number,
          ),
        ]
            .map((item) => Padding(padding: EdgeInsets.all(8.0), child: item))
            .toList(),
      ),
    );
  }

  _getTextPrefixSuffixDemo() {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'prefixText, suffixText',
            style: TextStyle(color: Colors.pink),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Enter your phone',
              prefixText: '(+90)',
              prefixStyle: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'your-workspace-url',
              suffixText: '.slack.com',
            ),
          ),
        ]
            .map((item) => Padding(padding: EdgeInsets.all(8.0), child: item))
            .toList(),
      ),
    );
  }

  _getCustomDemo() {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'InputBorders',
            style: TextStyle(color: Colors.pink),
          ),
          TextField(
            decoration: InputDecoration(
                hintText: 'Start typing here (InputBorder.none)',
                border: InputBorder.none),
          ),
          Text(
            'OutlineInputBorder without label',
            style: TextStyle(color: Colors.pink),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter your input',
              border: OutlineInputBorder(),
            ),
          ),
          Text(
            'OutlineInputBorder with label',
            style: TextStyle(color: Colors.pink),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter your input',
              labelText: 'Input',
              border: OutlineInputBorder(),
            ),
          ),
          Text(
            'Wrapped with Container\'s box decoration',
            style: TextStyle(color: Colors.pink),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              border: Border.all(width: 5.0, color: Colors.brown),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter your input',
                border: InputBorder.none,
              ),
            ),
          ),
        ]
            .map((item) => Padding(padding: EdgeInsets.all(8.0), child: item))
            .toList(),
      ),
    );
  }

  _saveNote(String note) {
    final snackBar =
        SnackBar(content: Text('Your note is saved.\nNote: $note'));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  _updateAge() {
    setState(() {
      _age = textEditingController.text;
    });
  }

  _updateAmount() {
    setState(() {
      _amount = amountTextEditingController.text;
    });
  }

  _clearTextField() {
    amountTextEditingController.clear();
  }
}
