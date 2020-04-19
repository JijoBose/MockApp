import 'dart:convert';
import 'package:mockapp/API.dart';
import 'package:mockapp/models/User.dart';
import 'package:mockapp/users/userDetail.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  UserPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  var users = new List<User>();

  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    listTile(data) {
      return ListTile(
        leading: CircleAvatar(
        // backgroundImage: NetworkImage(horseUrl),
        ),
        title: Text(data.name),
        subtitle: Text(data.email),
        trailing: Icon(Icons.keyboard_arrow_right),
        selected: true,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserDetailScreen(user: data)),
          );
        },
      );
    }

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return listTile(users[index]);
      },
    );
  }
}
