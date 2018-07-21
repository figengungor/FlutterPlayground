class Album {
  final int userId;
  final int id;
  final String title;

  Album.fromJson(Map<String, dynamic> jsonMap)
      : this.userId = jsonMap['userId'],
        this.id = jsonMap['id'],
        this.title = jsonMap['title'];
}
