import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_requests/model/user.dart';
import 'package:http_requests/model/album.dart';
import 'package:http_requests/model/comment.dart';
import 'package:http_requests/model/photo.dart';
import 'package:http_requests/model/post.dart';
import 'package:http_requests/model/todo.dart';

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

  Future<List<Comment>> getComments() async {
    final uri = Uri.https(baseUrl, commentsPath);

    final jsonResponse = await _getJsonResponse(uri);

    final comments = jsonResponse
        .map<Comment>((dynamic item) => Comment.fromJson(item))
        .toList();

    return comments;
  }

  Future<List<User>> getUsers() async {
    final uri = Uri.https(baseUrl, usersPath);

    final jsonResponse = await _getJsonResponse(uri);

    final users =
        jsonResponse.map<User>((dynamic item) => User.fromJson(item)).toList();

    return users;
  }

  Future<List<Todo>> getTodos() async {
    final uri = Uri.https(baseUrl, todosPath);

    final jsonResponse = await _getJsonResponse(uri);

    final todos =
        jsonResponse.map<Todo>((dynamic item) => Todo.fromJson(item)).toList();

    return todos;
  }

  Future<List<Photo>> getPhotos() async {
    final uri = Uri.https(baseUrl, photosPath);

    final jsonResponse = await _getJsonResponse(uri);

    final photos = jsonResponse
        .map<Photo>((dynamic item) => Photo.fromJson(item))
        .toList();

    return photos;
  }

  Future<List<Album>> getAlbums() async {
    final uri = Uri.https(baseUrl, albumsPath);

    final jsonResponse = await _getJsonResponse(uri);

    final albums = jsonResponse
        .map<Album>((dynamic item) => Album.fromJson(item))
        .toList();

    return albums;
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
