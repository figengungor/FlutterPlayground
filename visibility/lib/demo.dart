import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  bool _isVisible = true;
  final _boxHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Visibility Demo')),
      body: _buildBody(),
    );
  }

  _buildBody() => SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RaisedButton(
              color: Colors.orange,
              onPressed: _handleVisibility,
              child: Text('Change Visibility'),
            ),
            SizedBox(height: 8.0),
            _buildInvisibleDemo(),
            SizedBox(height: 8.0),
            _buildGoneDemo(),
          ],
        ),
      );

  Widget _buildInvisibleDemo() {
    return Column(
      children: <Widget>[
        Text('Invisible Test.  State: ${_isVisible ? 'Visible' : 'INVISIBLE'}'),
        SizedBox(height: 8.0),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Opacity(
                opacity: _isVisible ? 1.0 : 0.0,
                child: Container(
                  color: Colors.pink,
                  height: _boxHeight,
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.green,
                height: _boxHeight,
              ),
              flex: 3,
            ),
            Expanded(
              flex: 1,
              child: Opacity(
                opacity: _isVisible ? 1.0 : 0.0,
                child: Container(
                  color: Colors.pink,
                  height: _boxHeight,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildGoneDemo() {
    return Column(
      children: <Widget>[
        Text('Gone Test.  State: ${_isVisible ? 'Visible' : 'GONE'}'),
        SizedBox(height: 8.0),
        Row(
          children: <Widget>[
            _isVisible
                ? Expanded(
                    child: Container(
                      color: Colors.pink,
                      height: _boxHeight,
                    ),
                    flex: 1,
                  )
                : Container(),
            Expanded(
              child: Container(
                color: Colors.green,
                height: _boxHeight,
              ),
              flex: 3,
            ),
            _isVisible
                ? Expanded(
                    child: Container(
                      color: Colors.pink,
                      height: _boxHeight,
                    ),
                    flex: 1,
                  )
                : Container(),
          ],
        )
      ],
    );
  }

  void _handleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
}
