import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http_requests/model/photo.dart';
import 'package:http_requests/network/jsonplaceholder_api.dart';
import 'package:http_requests/utils/error_utils.dart';

//https://stackoverflow.com/questions/51224420
// /flutter-switching-to-tab-reloads-widgets-and-runs-futurebuilder

class PhotosPage extends StatefulWidget {
  @override
  _PhotosPageState createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage>
    with AutomaticKeepAliveClientMixin<PhotosPage> {
  Future<List<Photo>> _futurePhotos;

  @override
  void initState() {
    super.initState();
    _futurePhotos = JsonPlaceholderApi().getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Photo>>(
        future: _futurePhotos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _getGridView(snapshot.data);
          } else if (snapshot.hasError) {
            return getErrorMessage(snapshot.error, _onRetryPressed);
          }
          // By default, show a loading spinner
          return CircularProgressIndicator();
        },
      ),
    );
  }

  _getGridView(List<Photo> data) {
    if (data.isNotEmpty) {
      return GridView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _getGridItem(data[index]);
        },
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      );
    } else {
      return Center(child: Text('No data found.'));
    }
  }

  _getGridItem(Photo photo) {
    return GridTile(
      child: Image.network(
        photo.thumbnailUrl,
        fit: BoxFit.cover,
      ),
      footer: Container(
          color: Color(0x60000000),
          padding: EdgeInsets.all(8.0),
          child: Text(
            photo.title,
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  _onRetryPressed() {
    setState(() {
      _futurePhotos = JsonPlaceholderApi().getPhotos();
    });
  }

  @override
  bool get wantKeepAlive => true;
}
