import 'dart:convert';
import 'package:mockapp/API.dart';
import 'package:mockapp/models/Todo.dart';
import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  TodoPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  var todos = new List<ToDo>();

  _getToDos() {
    API.getToDos().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        todos = list.map((model) => ToDo.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getToDos();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    listTile(data) {
      return ListTile(
        leading: Checkbox(
          value: data.completed,
          onChanged: null
        ),
        title: Text(data.title),
      );
    }

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return listTile(todos[index]);
      },
    );
  }
}
