import 'package:flutter/material.dart';

class LoadJsonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Load Json Demo')),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) => FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('assets/posts.json'),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: Text(
              snapshot.data,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        return Center(child: CircularProgressIndicator());
      });
}
