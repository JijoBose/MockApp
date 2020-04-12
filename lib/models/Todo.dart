class ToDo {
  int id;
  int userId;
  String title;
  bool completed;

  ToDo(int id, int userId, String title, bool completed) {
    this.id = id;
    this.userId = userId;
    this.title = title;
    this.completed = completed;
  }

  ToDo.fromJson(Map json)
    : id = json['id'],
      userId = json['userId'],
      title = json['title'],
      completed = json['completed'];

  Map toJson() {
    return {'id': id, 'userId': userId, 'title': title, 'completed': completed};
  }
}
