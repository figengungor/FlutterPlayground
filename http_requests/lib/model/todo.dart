class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo.fromJson(Map<String, dynamic> jsonMap)
      : this.userId = jsonMap['userId'],
        this.id = jsonMap['id'],
        this.title = jsonMap['title'],
        this.completed = jsonMap['completed'];
}
