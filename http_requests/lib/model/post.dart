class Post {
  final userId;
  final id;
  final title;
  final body;

  Post.fromJson(Map<String, dynamic> jsonMap)
      : this.userId = jsonMap['userId'],
        this.id = jsonMap['id'],
        this.title = jsonMap['title'],
        this.body = jsonMap['body'];
}