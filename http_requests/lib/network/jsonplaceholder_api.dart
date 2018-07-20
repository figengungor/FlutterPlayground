import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_requests/model/post.dart';

class JsonPlaceholderApi {
  static const String baseUrl = 'jsonplaceholder.typicode.com';

  static const String postsPath = 'posts';
  static const String commentsPath = 'comments';
  static const String albumsPath = 'albums';
  static const String photosPath = 'photos';
  static const String todosPath = 'todos';
  static const String usersPath = 'users';

  Future<List<Post>> getPosts() async {
    final uri = Uri.https(baseUrl, postsPath);

    final jsonResponse = await _getJsonResponse(uri);

    final posts =
        jsonResponse.map<Post>((dynamic item) => Post.fromJson(item)).toList();

    return posts;
  }


  Future<List<dynamic>> _getJsonResponse(Uri uri) async {
    var httpResponse = await http.get(uri);

    if (httpResponse.statusCode == HttpStatus.OK) {
      var jsonResponse = json.decode(httpResponse.body);
      return jsonResponse;
    } else {
      throw Exception('\nStatus code:${httpResponse.statusCode}');
    }
  }
}
