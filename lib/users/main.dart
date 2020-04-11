import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<User> fetchUsers() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/users');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // return User.fromJson(json.));
    final jsonResponse = json.decode(response.body);
    return User.fromJson(jsonResponse[0]);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String website;

  User({this.id, this.name, this.username, this.email, this.website});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      website: json['website']
    );
  }
}

class UserPage extends StatefulWidget {
  UserPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  Future<User> listUsers;

  @override
  void initState() {
    super.initState();
    listUsers = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {

    listTile(data) {
      print(data);
      return ListTile(
        leading: CircleAvatar(
        // backgroundImage: NetworkImage(horseUrl),
        ),
        title: Text("data"),
        subtitle: Text('A strong animal'),
        trailing: Icon(Icons.keyboard_arrow_right),
        selected: true,
      );
    }

    return FutureBuilder<User>(
      future: listUsers,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return listTile(snapshot);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }
}


// ListTile(
//           leading: CircleAvatar(
//             // backgroundImage: NetworkImage(horseUrl),
//           ),
//           title: Text('Horse'),
//           subtitle: Text('A strong animal'),
//           trailing: Icon(Icons.keyboard_arrow_right),
//           onTap: () {
//             print('horse');
//           },
//           selected: true,
//         ),
