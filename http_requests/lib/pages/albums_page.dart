import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http_requests/model/album.dart';
import 'package:http_requests/network/jsonplaceholder_api.dart';
import 'package:http_requests/utils/error_utils.dart';

//https://stackoverflow.com/questions/51224420
// /flutter-switching-to-tab-reloads-widgets-and-runs-futurebuilder

class AlbumsPage extends StatefulWidget {
  @override
  _AlbumsPageState createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage>
    with AutomaticKeepAliveClientMixin<AlbumsPage> {
  Future<List<Album>> _futureAlbums;

  @override
  void initState() {
    super.initState();
    _futureAlbums = JsonPlaceholderApi().getAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Album>>(
        future: _futureAlbums,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _getListView(snapshot.data);
          } else if (snapshot.hasError) {
            return getErrorMessage(snapshot.error, _onRetryPressed);
          }
          // By default, show a loading spinner
          return CircularProgressIndicator();
        },
      ),
    );
  }

  _getListView(List<Album> data) {
    if (data.isNotEmpty) {
      return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            if (index.isOdd) return Divider();

            //If both operands are ints then a ~/ b
            //performs the truncating integer division.
            int albumIndex = index ~/ 2;

            return _getRow(data[albumIndex]);
          });
    } else {
      return Center(child: Text('No data found.'));
    }
  }

  _getRow(Album album) {
    return ListTile(
      leading: Icon(Icons.image),
      title: Text('${album.title}'),
    );
  }

  _onRetryPressed() {
    setState(() {
      _futureAlbums = JsonPlaceholderApi().getAlbums();
    });
  }

  @override
  bool get wantKeepAlive => true;
}
