class Album {
  int id;
  int userId;
  String title;

  Album(int id, int userId, String title) {
    this.id = id;
    this.userId = userId;
    this.title = title;
  }

  Album.fromJson(Map json)
    : id = json['id'],
      userId = json['userId'],
      title = json['title'];

  Map toJson() {
    return {'id': id, 'userId': userId, 'title': title};
  }
}
