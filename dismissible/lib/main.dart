import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Dismissible Playground',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _groceryList = ['cucumber', 'tomato', 'potato', 'milk'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dismissible Playground'),
      ),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _groceryList.length,
              itemBuilder: (BuildContext context, int index) {
                String item = _groceryList[index];
                return Dismissible(
                  //this is displayed while item is swiped away
                  background: Container(color: Colors.red),
                  //direction restricts swipe to dismiss only in that direction
                  //direction: DismissDirection.endToStart,
                  //define what to do after item is swiped
                  //you can take different actions according to direction
                  onDismissed: (DismissDirection direction) {
                    if (DismissDirection.startToEnd == direction) {
                      print('Swiped start to end');
                    } else if (DismissDirection.endToStart == direction) {
                      print('Swiped end to start');
                    } else {
                      print(direction.toString());
                    }

                    //You can limit the swipe by setting direction property
                    //For now, the delete action is happening
                    // for all swipe directions
                    setState(() {
                      _groceryList.removeAt(index);
                    });
                  },
                  //must have a unique key
                  key: Key(item),
                  child: ListTile(
                    title: Text(item),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Container(
            color: Colors.red,
            child: Text(
              'Remaining: ${_groceryList.toString()}',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}
