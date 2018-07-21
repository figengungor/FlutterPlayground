class Comment {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  Comment.fromJson(Map<String, dynamic> jsonMap)
      : this.postId = jsonMap['postId'],
        this.id = jsonMap['id'],
        this.name = jsonMap['name'],
        this.email = jsonMap['email'],
        this.body = jsonMap['body'];
}
