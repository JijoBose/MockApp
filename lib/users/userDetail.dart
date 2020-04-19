import 'package:mockapp/models/User.dart';
import 'package:flutter/material.dart';

class UserDetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo.
  final User user;

  // In the constructor, require a Todo.
  UserDetailScreen({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(user.name),
      ),
    );
  }
}
