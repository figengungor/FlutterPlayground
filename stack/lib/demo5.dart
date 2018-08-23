import 'package:flutter/material.dart';

class Demo5Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo 5')),
      body: _getBody(),
    );
  }

  Widget _getBody() => Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Placeholder(),
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.red.withOpacity(0.8),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Image Bottom Header Text jfsdjhhfkl fds fjgds fhjdsgfsdnfm ',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                )
              ],
            ),
          ),
        ],
      );
}
